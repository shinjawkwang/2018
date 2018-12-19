import os.path
import sys
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

class UDPSender(object):
    # Core class of sender
    senderNum = 0
    def __init__(self, filename):
        self.filename = filename
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind(('', 0))
        self.pList = []
        self.packets = 0
        self.dropped = False
        self.inFlight = 0
        self.time = []
        self.timer = None
        self.timerIdx = -1
        self.logF = open(filename + '_sending_log.txt', 'w')
        self.window = {'start':0, 'end':wSize-1}
        UDPSender.senderNum += 1
    
    def __del__(self):
        UDPSender.senderNum -= 1
        self.sock.close()

    def sendNRecv(self):
        self.readNDevide()
        self.start_time = time()
        sendt = Thread(target=self.sendPacket, args=[])
        recvt = Thread(target=self.recvACK, args=[])

        sendt.start()
        recvt.start()

        sendt.join()
        recvt.join()
        self.logF.close()
        
    def readNDevide(self):
        try:
            fLen = len(self.filename)
            pLen = (os.path.getsize(self.filename) // (1371 - fLen)) + 1
            with open(self.filename, 'rb') as f:
                # read file and construct packet list and seq list
                while True:
                    pkt = f.read(1371 - fLen)
                    if not pkt:
                        break
                    pkt = (bytearray(('%10d\rf\n%s\rp\n%10d\re\n'%(self.packets, self.filename, pLen)).encode())
                        + bytearray(pkt))
                    
                    # can find keyword in bytearray at reciever like this:
                    #       seqPos = pkt.find(b'\r\n\n')
                    self.pList.append(pkt)
                    self.packets += 1

                self.time = [None] * (self.packets+1)
        except Exception as e:
            print(e)
            sys.exit()
    
    def sendPacket(self):
        pkIdx = 0
        first = True
        while True:
            if self.dropped:
                continue

            if self.inFlight < wSize and (self.window['start'] <= pkIdx <= self.window['end']):
                self.sock.sendto(self.pList[pkIdx], recvAddr)
                cur_time = time()
                if cur_time - self.start_time > 0 and first:
                    with threadLock:
                        self.start_time = time()
                    cur_time = time()
                    first = False
                
                with threadLock:
                    self.time[pkIdx] = cur_time - self.start_time
                    self.logF.write('%.3f pkt: %-5d | sent\n' % (self.time[pkIdx], pkIdx))

                pkIdx += 1

                with threadLock:
                    self.inFlight += 1

                if pkIdx == self.packets:
                    return
    
    def recvACK(self):
        seq = -1
        ack = -1
        prevACK = -1
        dupCnt = 0
        First = True
        while True:
            ack = None
            try:
                ack = self.sock.recv(65535)
                ack = int(ack.decode())
                
                if seq <= ack:
                    with threadLock:
                        self.dropped = False
                        self.window['start'] = ack+1
                        self.window['end'] = ack+wSize-1
                    First = True

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
                        seq = ack+1
                        self.sock.sendto(self.pList[ack+1], recvAddr)
                        self.inFlight -= 1
                        self.logF.write('%.3f pkt: %-5d | 3 duplicated ACKs\n' % (self.time[ack+1], ack+1))
                        
                with threadLock:
                    self.inFlight -= 1
                
                if ack+1 == self.packets:
                    end_time = time() - self.start_time
                    self.logF.write('\nFile transfer is finished.\n')
                    self.logF.write('Throughput: %.2f pkts / sec' % (self.packets/end_time))
                    return

            except Exception as e:
                print(e)
                raise


def senderMainThread(filename):
    global senders
    sender = UDPSender(filename)
    senders.append(sender)
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
