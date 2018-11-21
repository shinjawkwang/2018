import os.path
import sys
from datetime import datetime, timedelta
from socket import *
from threading import *
from time import *

#=== global variables ===#
recvAddr = ('', 10080)
wSize = 0
timeoutF = float(0)
threadLock = Lock()
senders = []
mainThreads = []
#========================#

class Packet(object):
    def __init__(self, index):
        self.idx = index
        self.ACKed = False
        self.inFlight = False
        self.sendTime = None
        self.data = None
        self.dupped = False
        self.dupNSent = False

    def setData(self, data):
        self.data = data

class UDPSender(object):
    # Core class of sender
    def __init__(self, filename):
        self.filename = filename
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind(('', 0))
        self.pList = []
        self.packets = 0
        self.dropped = False
        self.seq = -1
        self.timer = None
        self.timerIdx = -1
        self.dupped = False
        self.timerOn = False
        self.logF = open(filename + '_sending_log.txt', 'w')
        self.window = {'start':0, 'end':wSize-1}
    
    def __del__(self):
        self.sock.close()

    def listInFlight(self):
        fList = []
        for p in self.pList:
            if p.inFlight:
                fList.append(p)
        return fList

    def getTList(self):
        tList = []
        for p in self.pList:
            tList.append(p.sendTime)
        return tList

    def sendNRecv(self):
        self.readNDevide()
        self.start_time = time()
        sendt = Thread(target=self.sendPacket, args=[])
        recvt = Thread(target=self.recvACK, args=[])
        timet = Thread(target=self.UDPtimer, args=[])

        sendt.start()
        recvt.start()
        timet.start()

        sendt.join()
        recvt.join()
        timet.join()
        self.logF.close()
        
    def readNDevide(self):
        try:
            fLen = len(self.filename)
            pLen = (os.path.getsize(self.filename) // (1371 - fLen)) + 1
            with open(self.filename, 'rb') as f:
                # read file and construct packet list and seq list
                while True:
                    pkt = Packet(self.packets)
                    data = f.read(1371 - fLen)
                    if not data:
                        break
                    data = (bytearray(('%10d\rf\n%s\rp\n%10d\re\n'%(self.packets, self.filename, pLen)).encode())
                        + bytearray(data))

                    pkt.setData(data)
                    self.pList.append(pkt)
                    self.packets += 1

        except Exception as e:
            print(e)
            sys.exit()
    
    def sendPacket(self):
        pkIdx = 0
        first = True
        while True:
            if self.dropped:
                continue

            if len(self.listInFlight()) < wSize and (self.window['start'] <= pkIdx <= self.window['end']):
                self.sock.sendto(self.pList[pkIdx].data, recvAddr)
                self.pList[pkIdx].inFlight = True
                cur_time = time()
                if cur_time - self.start_time > 0 and first:
                    with threadLock:
                        self.start_time = time()
                    cur_time = time()
                    first = False
                
                with threadLock:
                    self.pList[pkIdx].sendTime = cur_time - self.start_time
                    self.logF.write('%.3f pkt: %-5d | sent\n' % (self.pList[pkIdx].sendTime, pkIdx))

                self.pList[pkIdx].ACKed = False
                pkIdx += 1

                if pkIdx == self.packets:
                    return
            
            #else:
            #    print('stuck', pkIdx)
    
    def recvACK(self):
        ack = -1
        prevACK = -1
        dupCnt = 0
        First = True
        while True:
            ack = None
            try:
                ack = self.sock.recv(65535)
                ack = int(ack.decode())
                #with threadLock:
                self.pList[ack].ACKed = True
                self.pList[ack].inFlight = False
                
                if self.seq <= ack:
                    #with threadLock:
                    self.dropped = False
                    self.window['start'] = ack+1
                    self.window['end'] = ack+wSize-1
                    for i in range(ack+1):
                        self.pList[i].ACKed = True
                        self.pList[i].inFlight = False
                    First = True

                print('recv:', ack)
                self.logF.write('%.3f ACK: %-5d | recieved\n' % (time()-self.start_time, ack))
                if prevACK == ack:
                    dupCnt += 1
                else:
                    dupCnt = 0
                prevACK = ack

                # For fast transmission
                if dupCnt == 3 and First:
                    First = False
                    with threadLock:
                        self.dropped = True

                    self.seq = ack+1
                    print('3 dupplicated:', ack+1)
                    self.pList[ack+1].dupped = True
                    self.sock.sendto(self.pList[ack+1].data, recvAddr)
                    cur_time = time()
                    self.logF.write('%.3f pkt: %-5d | 3 duplicated ACKs\n' % (cur_time-self.start_time, ack+1))
                    self.pList[ack+1].sendTime = cur_time
                    self.pList[ack+1].dupNSent = True
                
                if ack+1 == self.packets:
                    end_time = time() - self.start_time
                    self.logF.write('\nFile transfer is finished.\n')
                    self.logF.write('Throughput: %.2f pkts / sec' % (self.packets/end_time))
                    return

            except Exception as e:
                print(e)
                raise

    def UDPtimer(self):
        fList = self.listInFlight()
        if len(fList) > 0:
            self.timer = fList[0].sendTime
            self.timerIdx = 0
        else:
            self.timer = None
        while True:
            if self.timer == None:
                fList = self.listInFlight()
                if len(fList) > 0:
                    self.timer = fList[0].sendTime
                    self.timerIdx = 0
                else:
                    self.timer = None
                    print('ㅅㄱㅂ')
                continue

            if time()-self.start_time-self.timer > timeoutF:
                if self.pList[self.timerIdx].ACKed:
                    print('before reset:', self.timerIdx, self.timer)
                    nxt = next((i for i in self.pList if i.ACKed==False), None)
                    if nxt == None:
                        print('**special case')
                        tList = self.getTList()
                        self.timer = max(tList)
                        self.timerIdx = tList.index(self.timer)
                    else:
                        self.timerIdx = self.pList.index(nxt)
                        self.timer = nxt.sendTime
                    print('reset:', self.timerIdx, self.timer)

                else:
                    print('real timeout -', self.timerIdx)
                    with threadLock:
                        self.dropped = True
                        self.seq = self.timerIdx
                    cur_time = time()
                    self.logF.write('%.3f pkt: %-5d | timeout since %.3f\n' 
                                     % (cur_time-self.start_time, self.timerIdx, self.timer))
                    if len(self.listInFlight()) < wSize and (self.window['start'] <= self.timerIdx <= self.window['end']):
                        self.sock.sendto(self.pList[self.timerIdx].data, recvAddr)
                        cur_time = time()
                        
                        with threadLock:
                            self.pList[self.timerIdx].sendTime = cur_time - self.start_time
                            self.logF.write('%.3f pkt: %-5d | retransmitted\n' 
                                             % (self.pList[self.timerIdx].sendTime, self.timerIdx))
                            self.pList[self.timerIdx].inFlight = True
                            self.pList[self.timerIdx].ACKed = False
                    
                    self.timer = self.pList[self.timerIdx].sendTime
        
def senderMainThread(filename):
    global senders
    sender = UDPSender(filename)
    senders.append(sender)
    # print('>>> sender #%d created' % (UDPSender.senderNum))
    sender.sendNRecv()

#===============================   main   ===============================#
if __name__ == '__main__':
    ipAddr = input('Receiver IP address: ')
    wSize = int(input('window size: '))
    timeoutF = float(input('timeout (sec): '))
    recvAddr = (ipAddr, 10080)

    try:
        while True:
            filename = input('file_name: ')
            if not os.path.exists(filename):
                print('ERROR: FILE DOES NOT EXIST. INPUT AGAIN.')
                continue
            else:
                t = Thread(target=senderMainThread, args=[filename])
                mainThreads.append(t)
                t.start()

    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close Sender.')
        for t in mainThreads:
            t.join()
        for sender in senders:
            del sender
        sys.exit()
#========================================================================#
