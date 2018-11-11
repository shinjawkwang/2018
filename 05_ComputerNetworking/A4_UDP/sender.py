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
        self.sending = 0
        self.timer = []
        self.logF = open(filename + '_sending_log.txt', 'w')
        UDPSender.senderNum += 1
    
    def __del__(self):
        UDPSender.senderNum -= 1
        self.logF.close()
        self.sock.close()

    def sendNRecv(self):
        self.readNDevide()
        start_time = time()
        sendt = Thread(target=self.sendPacket, args=(start_time))
        recvt = Thread(target=self.recvACK, args=[])

        sendt.start()
        recvt.start()

        sendt.join()
        recvt.join()
        
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

        except Exception as e:
            print(e)
            sys.exit()
    
    def sendPacket(self, start_time):
        pkIdx = 0
        while True:
            if self.dropped:
                continue

            if self.sending < wSize:
                self.timer[pkIdx] = time() - start_time
                self.sock.sendto(self.packets[pkIdx], recvAddr)
                pkIdx += 1

                with threadLock:
                    self.sending += 1
        

    def recvACK(self):
        prevACK = -1
        dupCnt = 0
        while True:
            try:
                # recvAddr isn't useful at here.
                ack, _ = self.sock.recv()
                ack = int(ack.decode())

                if prevACK == ack:
                    dupCnt += 1
                else:
                    dupCnt = 0
                prevACK = ack

                # For fast transmission
                if dupCnt == 3:
                    self.dropped = True

                
            except Exception as e:
                print(e)


def senderMainThread(filename):
    sender = UDPSender(filename)
    print('>>> sender #%d created' % (UDPSender.senderNum))
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
                Thread(target=senderMainThread, args=[filename]).start()

    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close Sender.')
        # server.sock.close()
        sys.exit()
#========================================================================#
