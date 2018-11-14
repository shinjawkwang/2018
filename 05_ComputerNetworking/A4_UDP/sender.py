import os.path
import sys
from datetime import datetime, timedelta
from socket import *
from threading import *
from time import *

#=== global variables ===#
ipAddr = None
recvAddr = (ipAddr, 10080)
wSize = 0
timeout = float(0)
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
        self.timer = []
        self.logF = open(filename + '_sending_log.txt', 'w')
        UDPSender.senderNum += 1
    
    def __del__(self):
        UDPSender.senderNum -= 1
        self.sock.close()

    def sendNRecv(self):
        self.readNDevide()
        start_time = time()
        sendt = Thread(target=self.sendPacket, args=[start_time])
        recvt = Thread(target=self.recvACK, args=[start_time])

        sendt.start()
        recvt.start()

        sendt.join()
        recvt.join()
        print(filename, 'close')
        self.logF.close()
        
    def readNDevide(self):
        try:
            with open(self.filename, 'rb') as f:
                # read file and construct packet list and seq list
                while True:
                    pkt = f.read(1400)
                    if not pkt:
                        break
                    pkt = (bytearray((str(self.packets) + 'SEQ\n' + str(self.packets+1) + 'ACK\n').encode())
                        + bytearray(pkt))

                    # can find keyword in bytearray at reciever like this:
                    #       seqPos = pkt.find(b'SEQ\n')
                    #       ackPos = pkt.find(b'ACK\n')
                    self.pList.append(pkt)
                    self.packets += 1
                self.timer = [None] * self.packets

        except Exception as e:
            print(e)
            sys.exit()
    
    def sendPacket(self, start_time):
        pkIdx = 0
        while True:
            if self.dropped:
                continue

            if self.inFlight < wSize:
                # self.sock.sendto(self.packets[pkIdx], recvAddr)
                self.timer[pkIdx] = time() - start_time
                self.logF.write('%.3f pkt: %d | sent\n' % (self.timer[pkIdx], pkIdx))
                pkIdx += 1

                with threadLock:
                    self.inFlight += 1

                if pkIdx == self.packets:
                    return
        
    def recvACK(self, start_time):
        prevACK = -1
        dupCnt = 0
        while True:
            try:
                # recvAddr isn't useful at here.
                ack, _ = self.sock.recv()
                ack = int(ack.decode())
                self.logF.write('%.3f ACK: %d | sent\n' % (time()-start_time, ack))
                if prevACK == ack:
                    dupCnt += 1
                else:
                    dupCnt = 0
                prevACK = ack

                with threadLock:
                    self.inFlight -= 1

                # For fast transmission
                if dupCnt == 3:
                    with threadLock:
                        self.dropped = True
                        self.sock.sendto(self.packets[ack], recvAddr)
                        self.timer[ack] = time() - start_time
                        self.logF.write('%.3f pkt: %d | 3 duplicated ACKs\n' % (self.timer[ack], ack))

                if ack == self.packets:
                    self.sock.sendto(b'END', recvAddr)
                    end_time = time() - start_time
                    self.logF.write('\nFile transfer is finished.\n')
                    self.logF.write('Throughput: %.2f pkts / sec\n' % (self.packets/end_time))
                    return

            except Exception as e:
                print(e)


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
    timeout = float(input('timeout (sec): '))
    recvAddr = (ipAddr, 10080)

    try:
        print('======== Starting Sender. <Ctrl + C> to stop. ========')
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
