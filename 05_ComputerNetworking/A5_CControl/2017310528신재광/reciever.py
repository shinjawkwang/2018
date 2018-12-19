import queue
import sys
from socket import *
from threading import *
from time import *

import numpy as np

threadLock = Lock()
# f = open('log.txt', 'w')

def QueueItems(q):
    mycopy = []
    ret = []
    while True:
        try:
            elem = q.get(block=False)
        except queue.Empty:
            break
        else:
            mycopy.append(elem)
    for elem in mycopy:
        q.put(elem)
        packet = elem[0]
        seqIdx = packet.find(b'\n')
        seq = int( packet[:seqIdx] )
        ret.append(seq)

    return ret

def JFairnessIndex(d):
    items = []
    for ip in d:
        for port in d[ip]:
            items.append(d[ip][port][0] / 2)
    if len(items) > 0:
        cv2 = 1 + (np.std(items) / np.mean(items)) ** 2
        return 1 / cv2
    else:
        return np.nan

def initLog():
    NEMLog = open('NEM.log', 'w')
    RMLog = open('RM.log', 'w')
    NEMLog.write('   time | incoming_rate | forwarding_rate | avg_queue_utilization\n')
    NEMLog.close()
    RMLog.close()

class UDPReciever(object):
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))
        self.addrDict = {}

        self.NEMQUEUE = queue.Queue(qSize)
        self.PacketQueue = queue.Queue()    # queue between NEM and RM
        self.bottleNeckCounter = 0

        self.arrPkts = 0
        self.fwdPkts = 0
        self.queueUtil = 0

        self.flag = False
        initLog()

    def recieve(self):
        self.start_time = time()
        NEMT = Thread(target=self.NetworkEmulatorModule, args=[])
        RMT = Thread(target=self.RecieverModule, args=[])

        NEMT.start()
        RMT.start()
        self.logWrite()

        NEMT.join()
        RMT.join()

    def calcRates(self):
        rates = {}
        rates['arrRate'] = self.arrPkts / 2
        rates['fwdRate'] = self.fwdPkts / 2
        rates['queueUtilRate'] = self.queueUtil / 20
        
        self.arrPkts = 0
        self.fwdPkts = 0
        self.queueUtil = 0
        return rates

    def logWrite(self):
        Timer(2, self.logWrite).start()
        # f.write('-----------------------------------------------------------------\n')
        if self.flag:
            NEMLog = open('NEM.log', 'a+')
            RMLog = open('RM.log', 'a+')
            cur_time = time() - self.start_time
            rates = self.calcRates()
            NEMLog.write('%7.2f | %13.3f | %15.3f | %21.3f\n' 
                      % (cur_time, rates['arrRate'], rates['fwdRate'], rates['queueUtilRate']))

            RMLog.write('%7.2f | %.3f\n' % (cur_time, JFairnessIndex(self.addrDict)))
            for ip in self.addrDict:
                for port in self.addrDict[ip]:
                    RMLog.write('\t\t%s:%d | %.3f\n' % (ip, port, self.addrDict[ip][port][0]/2))
                    with threadLock:
                        self.addrDict[ip][port][0] = 0

            NEMLog.close()
            RMLog.close()
        else:
            self.flag = True

    def BottleNeckResetter(self):
        Timer(1, self.BottleNeckResetter).start()
        with threadLock:
            self.bottleNeckCounter = 0

    def QueueUtilizationCalculator(self):
        Timer(0.1, self.QueueUtilizationCalculator).start()
        with threadLock:
            if self.NEMQUEUE.qsize() == qSize:
                self.queueUtil += 1

    def NetworkEmulatorModule(self):
        self.BottleNeckResetter()
        self.QueueUtilizationCalculator()
        self.sock.settimeout(0.1)
        while True:
            try:
                packet = self.sock.recvfrom(1500)
            except timeout:
                if self.bottleNeckCounter < BLR:
                    if not self.NEMQUEUE.empty():
                        self.PacketQueue.put(self.NEMQUEUE.get())
                        # for i in QueueItems(self.NEMQUEUE):
                        #    f.write(str(i) + ' ')
                        # f.write('\n')
                        self.fwdPkts += 1
                        self.bottleNeckCounter += 1
            else:
                # f.write(str(packet[0][:packet[0].find(b'\n')]) + 'arrived\n')
                self.arrPkts += 1
                if self.bottleNeckCounter < BLR:
                    if self.NEMQUEUE.empty():
                        self.PacketQueue.put(packet)
                    else:
                        self.PacketQueue.put(self.NEMQUEUE.get())
                        self.NEMQUEUE.put(packet)
                        # for i in QueueItems(self.NEMQUEUE):
                        #    f.write(str(i) + ' ')
                        # f.write('\n')
                    self.fwdPkts += 1
                    self.bottleNeckCounter += 1

                else:
                    if not self.NEMQUEUE.full():
                        self.NEMQUEUE.put_nowait(packet)
                        # f.write('PUT: ')
                        # for i in QueueItems(self.NEMQUEUE):
                        #    f.write(str(i) + ' ')
                        # f.write('\n')
                     #else:
                        # print('DROP:', QueueItems(self.NEMQUEUE))
                        # f.write('DROP: ')
                        # for i in QueueItems(self.NEMQUEUE):
                        #    f.write(str(i) + ' ')
                        # f.write('\n')

    def RecieverModule(self):
        idx = 0
        seqList = []
        while True:
            packet = self.PacketQueue.get() # if the queue is empty, wait until there exists item
            seqIdx = packet[0].find(b'\n')
            seq = int( packet[0][:seqIdx] )
            ip = packet[1][0]
            port = int( packet[1][1] )
            # print('seq: %d\tip:%s\tport:%s' % (seq, ip, port))
            # f.write('forwarded: %d\n' % (seq))
            addr = (ip, port)
            ack = seq

            if ip not in self.addrDict:
                self.addrDict[ip] = {}
                self.addrDict[ip][port] = [0, idx]
                seqList.append([])
                idx += 1

            elif port not in self.addrDict[ip]:
                self.addrDict[ip][port] = [0, idx]
                seqList.append([])
                idx += 1

            self.addrDict[ip][port][0] += 1
            addrIdx = self.addrDict[ip][port][1]

            if seq not in seqList[addrIdx]:
                seqList[addrIdx].append(seq)
                self.sock.sendto(str(ack).encode(), addr) #ignore already recieved packet 

#===============================   main   ===============================#
if __name__ == '__main__':
    cmd = input('configure>> ')
    if ' ' in cmd:
        BLR = int(cmd.split(' ')[0])
        qSize = int(cmd.split(' ')[1])
    else:
        print('Usage: configure>> (BLR) (queue_size)')
        sys.exit()

    try:
        clPort = 10080
        reciever = UDPReciever('', clPort)
        reciever.recieve()

    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. End Reciever.')
        reciever.sock.close()
        sys.exit()
#========================================================================#
