import os.path
import sys
from random import *
from socket import *
from threading import *
from time import *

lossP = float(0)

class UDPReciever(object):
    # TODO: handle logs
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))
        self.PortDict = {}
        self.packetsList = []
        self.setSockBuf()

    def setSockBuf(self):
        buf = self.sock.getsockopt(SOL_SOCKET, SO_RCVBUF)
        print('socket recv buffer size:', buf)
        if buf < 10000000:
            self.sock.setsockopt(SOL_SOCKET, SO_RCVBUF, 10000000)
            buf = self.sock.getsockopt(SOL_SOCKET, SO_RCVBUF)
        print('socket recv buffer size updated:', buf)

    def recieve(self):
        lackList = []
        finished = []
        OutOfOrderBuf = []
        logs = []
        startTimes = []
        seq = []
        idx = 0
        prevDropped = []
        pd = False
        dropped = False
        prevSeq = [-1] * 100
        ack = []
        first = []
        packets = []        
        while True:
            data, addr = self.sock.recvfrom(65535)
            cur_time = time()
            seqIdx = data.find(b'\rf\n')
            pLenIdx = data.find(b'\rp\n')
            hEndIdx = data.find(b'\re\n')
            seqI = int( data[:seqIdx] )
            fNm = data[seqIdx+3:pLenIdx].decode().replace(' ', '')
            packetsI = int( data[pLenIdx+3:hEndIdx] )
            data = data[hEndIdx+3:]

            if random() < lossP:
                # print('dropped -', seqI)
                dropped = True

            if addr[1] not in self.PortDict:
                # filename, fileidx, number of packets
                self.PortDict[addr[1]] = [fNm, idx]
                self.packetsList.append([])
                lackList.append([])
                prevDropped.append([])
                packets.append(int(packetsI))
                finished.append(False)
                OutOfOrderBuf.append({})
                seq.append(seqI)
                ack.append(-1)
                first.append(True)
                startTimes.append(cur_time)
                fileidx = idx
                idx += 1
                logs.append(open(fNm + '_recieving_log.txt', 'w'))
                print('>>', fNm, 'recieve started')
            
            fileidx = self.PortDict[addr[1]][1]

            seq[fileidx] = seqI
            
            if seq[fileidx] > prevSeq[fileidx] + 1 or (len(OutOfOrderBuf[fileidx])>0 
                                                        and seq[fileidx] not in lackList[fileidx]):
                OutOfOrderBuf[fileidx][seq[fileidx]] = data

            elif not dropped:
                if seq[fileidx] == packets[fileidx]-1:
                    finished[fileidx] = True
                
                if cur_time-startTimes[fileidx]>0 and first[fileidx]:
                    startTimes[fileidx] = cur_time
                    first[fileidx] = False

                logs[fileidx].write('%.3f pkt: %-5d | recieved\n'
                                        % (cur_time-startTimes[fileidx], seq[fileidx]))

                self.packetsList[fileidx].append(data)

                if seq[fileidx] in lackList[fileidx]:
                    del( lackList[fileidx][ lackList[fileidx].index(seq[fileidx]) ] )

                if len( OutOfOrderBuf[fileidx] ) > 0:
                    i = 1
                    while seq[fileidx] + i in OutOfOrderBuf[fileidx]:
                        self.packetsList[fileidx].append(OutOfOrderBuf[fileidx][seq[fileidx] + i])
                        del(OutOfOrderBuf[fileidx][seq[fileidx]+i])
                        i += 1
                    seq[fileidx] = seq[fileidx] + i - 1
                    if seq[fileidx] == packets[fileidx]-1:
                        finished[fileidx] = True

            if len( OutOfOrderBuf[fileidx] ) > 0:
                ack[fileidx] = min(OutOfOrderBuf[fileidx]) - 2
            else:
                ack[fileidx] = seq[fileidx]

            if not dropped:
                cur_time = time()
                logs[fileidx].write('%.3f ACK: %-5d | sent\n'
                                     % (cur_time-startTimes[fileidx], ack[fileidx]))
                self.sock.sendto(str(ack[fileidx]).encode(), addr)
                prevSeq[fileidx] = seq[fileidx]
            
            else:
                lackList[fileidx].append(seq[fileidx])
                logs[fileidx].write('%.3f pkt: %-5d | dropped\n'
                                     % (cur_time-startTimes[fileidx], seq[fileidx]))
                dropped = False

            if finished[fileidx]:
                # Do not break. close log file discriptor and write packets
                with open(self.PortDict[addr[1]][0], 'wb') as f:
                    try:
                        for packet in self.packetsList[fileidx]:
                            f.write(packet)
                    except Exception as e:
                        print(e)

                end_time = time()-startTimes[fileidx]
                logs[fileidx].write('\nFile transfer is finished.\n')
                logs[fileidx].write('Throughput: %.2f pkts / sec' % (packets[fileidx]/end_time))
                logs[fileidx].close()
                print('>> {0} recieved completely. Check {0}_recieving_log.txt'.format(self.PortDict[addr[1]][0]))
                
            dropped = False


#===============================   main   ===============================#
if __name__ == '__main__':
    lossP = float(input('packet loss probability (0.0 ~ 1.0): '))

    try:
        clPort = 10080
        reciever = UDPReciever('', clPort)
        print('reciever program starts...')
        reciever.recieve()
    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. End Reciever.')
        reciever.sock.close()
        sys.exit()
#========================================================================#
