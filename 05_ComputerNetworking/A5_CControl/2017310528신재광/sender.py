import math
import os
import signal
import sys
from multiprocessing import *
from socket import *
from threading import *
from time import *

#=== global variables ===#
recvAddr = ('', 10080)
wSize = 0
threadLock = Lock()
# f = open('log.txt', 'w')
#========================#

class Packet(object):
    def __init__(self, data, seq):
        self.seq = seq
        self.data = data
        self.sent = False
        self.resent = False
        self.ACKed = False
        self.sendT = None
        self.resendT = None

    def send(self, time):
        self.sendT = time
        self.sent = True

    def ACK(self, time):
        self.sampleRTT = time - self.sendT
        self.ACKed = True

    def retransmit(self, time):
        self.resendT = time
        self.resent = True

    def isInFlight(self):
        return self.sent and not self.ACKed

class UDPSender(object):
    def __init__(self):
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)

        self.dropped = False
        self.pList = []
        self.inFlight = []
        self.window = {'start':0, 'end':wSize-1}
        self.wMax = wSize

        self.avgRTT = 1     # initial value
        self.devRTT = 1     # initial value
        self.timeout = 1    # initial value
        self.timerIdx = 0

        self.sendPackets = 0
        self.recvACKs = 0

        signal.signal(signal.SIGALRM, self.handler)
        self.flag1 = False
        self.flag2 = False
        self.flag3 = True

    def __del__(self):
        self.sock.close()

    def collectInFlight(self):
        inFlightSeq = []
        for pkt in self.inFlight:
            inFlightSeq.append(pkt.seq)
        return inFlightSeq

    def logWrite(self):
        Timer(2, self.logWrite).start()
        if self.flag1:
            logF = open(str(self.sock.getsockname()[1]) + '_log.txt', 'a+')
            cur_time = time() - self.start_time
            logF.write('%-7.3f | avg_RTT: %.3f | SR: %6.2f | G: %.2f\n' 
                        % (cur_time, self.avgRTT, self.sendPackets/2, self.recvACKs/2))
            logF.close()
            self.sendPackets = 0
            self.recvACKs = 0
        else:
            self.flag1 = True

    def createPacket(self, cnt):
        binStr = (str(cnt) + '\n').encode()
        length = 1400 - len(binStr)
        data = bytearray(binStr + b'0'*length)
        return Packet(data, cnt)

    def searchPacket(self, idx):
        for pkt in self.inFlight:
            if pkt.seq == idx:
                return pkt
        return None

    def sendNRecv(self):
        self.start_time = time()
        self.lastDroppedTime = 0
        sendt = Thread(target=self.sendPacket, args=[], daemon=True)
        recvt = Thread(target=self.recvACK, args=[], daemon=True)

        sendt.start()
        recvt.start()
        self.logWrite()

        sendt.join()
        recvt.join()
    
    def sendPacket(self):
        pkIdx = 0
        self.CUBIC_INCREASE()
        while True:
            if self.dropped:
                continue
            if (self.window['start'] <= pkIdx <= self.window['end'] 
                and pkIdx not in self.collectInFlight()):
                pkt = self.createPacket(pkIdx)
                self.pList.append(pkt)
                cur_time = time()-self.start_time
                with threadLock:
                    pkt.send(cur_time)
                    self.inFlight.append(pkt)
                self.sock.sendto(pkt.data, recvAddr)
                self.sendPackets += 1
                # for pkt in self.inFlight:
                #    f.write(str(pkt.seq) + ' ')
                # f.write('\n')
                #    print(self.inFlight[0].seq, '~', self.inFlight[len(self.inFlight)-1].seq)
                # print('sent:', pkt.seq)
                if pkIdx == 0:
                    signal.setitimer(signal.ITIMER_REAL, self.timeout)

                pkIdx += 1
                    
    def recvACK(self):
        ack = -1
        while True:
            ack = self.sock.recv(65535)
            ack = int(ack.decode())
            self.recvACKs += 1
            # print('recv:', ack)
            cur_time = time() - self.start_time

            ackPkt = self.pList[ack]
            with threadLock:
                ackPkt.ACK(cur_time)
                if self.searchPacket(ack):
                    self.inFlight.remove(self.searchPacket(ack))
                if self.dropped:
                    if ack == self.timerIdx:
                        # print('timeout solved -', self.timerIdx)
                        self.dropped = False
                        self.resetTimer()

                if ack == self.window['start']:
                    self.window['start'] += 1
                    if len(self.pList) < self.window['start']:
                        while self.pList[self.window['start']].ACKed:
                            self.window['start'] += 1
                            if len(self.pList) == self.window['start']:
                                break
                    self.window['end'] = self.window['start'] + wSize - 1
                    # print('s(%d):' % (wSize), self.window['start'], '~', self.window['end'])
            if not ackPkt.resent:
                self.calcAvgRTT(ackPkt)

    def handler(self, signum, frame):
        if self.pList[self.timerIdx].ACKed:
            # print('FAKE(%d), ' % self.timerIdx, end='')
            self.resetTimer()
        
        else:
            # print('TIMEOUT DETECT - %d' % self.timerIdx)
            with threadLock:
                self.dropped = True
            self.sock.sendto(self.pList[self.timerIdx].data, recvAddr)
            #print('retransmit:', self.pList[self.timerIdx].seq)
            cur_time = time()-self.start_time

            with threadLock:
                self.CUBIC_DECREASE(cur_time)
                self.pList[self.timerIdx].retransmit(cur_time)
            signal.setitimer(signal.ITIMER_REAL, self.timeout)

    def resetTimer(self):
        tmp_timeout = None
        if len(self.inFlight) > 0:
            item = self.inFlight[0]
            if item.seq != self.timerIdx:
                self.timerIdx = self.pList.index(item)
                if self.timeout - (time()-self.start_time-item.sendT) > 0:
                    tmp_timeout = self.timeout - (time()-self.start_time-item.sendT)
                    signal.setitimer(signal.ITIMER_REAL, tmp_timeout)
                else:
                    signal.setitimer(signal.ITIMER_REAL, self.timeout)

                # print('reset timer -', self.timerIdx)

    def calcAvgRTT(self, ACKedPKT):
        alpha = 0.125
        beta = 0.25
        self.devRTT = (1-beta) * self.devRTT + beta * abs(ACKedPKT.sampleRTT - self.avgRTT)
        self.avgRTT = (1-alpha) * self.avgRTT + alpha * ACKedPKT.sampleRTT
        self.timeout = self.avgRTT + 4 * self.devRTT
        # print('avgRTT: %.3f\tdevRTT: %.3f\ttimeout: %.3f' % (self.avgRTT, self.devRTT, self.timeout))

    def CUBIC_INCREASE(self):
        Timer(2 * self.avgRTT, self.CUBIC_INCREASE).start()
        global wSize
        cubicPara = 0.4
        beta = 0.3
        if self.flag2:
            t = time() - self.start_time - self.lastDroppedTime
            k = ((self.wMax * beta)/cubicPara) ** (1/3)
            with threadLock:
                wSize = math.ceil(cubicPara * ((t - k) ** 3) + self.wMax)
                self.window['end'] = self.window['start'] + wSize - 1
                self.flag3 = True
            
        else:
            self.flag2 = True
        
    def CUBIC_DECREASE(self, time):
        global wSize
        if self.flag3:
            beta = 0.3
            self.wMax = wSize
            self.lastDroppedTime = time
            if beta * wSize > 0:
                wSize = math.ceil(beta * wSize)
                self.window['end'] = self.window['start'] + wSize - 1
            self.flag3 = False
            

def senderMainProcess():
    sender = UDPSender()
    sender.sendNRecv()

#===============================   main   ===============================#
if __name__ == '__main__':
    ipAddr = input('Receiver IP address: ')
    recvAddr = (ipAddr, 10080)
    p = Process(target=senderMainProcess, args=[])
    pid = None
    try:
        while True:
            cmd = input('command>> ')
            if ' ' in cmd:
                wSize = int(cmd.split(' ')[1])
                cmd = cmd.split(' ')[0]
            
            if cmd == 'start':
                p.start()
                pid = p.pid
                continue
                
            elif cmd == 'stop':
                if pid == None:
                    print('Not Started Yet')
                    continue
                os.kill(pid, signal.SIGKILL)
                # f.close()
                break

    except KeyboardInterrupt:
        os.kill(pid, signal.SIGKILL)
        sys.exit()
#========================================================================#
