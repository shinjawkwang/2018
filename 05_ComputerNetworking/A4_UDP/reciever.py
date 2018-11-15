from socket import *
from threading import *
import os.path
import sys
from datetime import datetime, timedelta


class UDPReciever(object):
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))
        self.PortDict = {}
        self.setSockBuf()
        self.packetsList = []
        self.logsList = []

    def setSockBuf(self):
        buf = self.sock.getsockopt(SOL_SOCKET, SO_RCVBUF)
        print('socket recv buffer size: ', buf)
        if buf < 1000000:
            self.sock.setsockopt(SOL_SOCKET, SO_RCVBUF, 1000000)
            buf = self.sock.getsockopt(SOL_SOCKET, SO_RCVBUF)
        print('socket recv buffer size updated: ', buf)

    def recieve(self):
        idx = 0
        while True:
            data, addr = self.sock.recvfrom(65535)
            print(addr)
            if addr[1] not in self.PortDict:
                # register filename
                self.PortDict[addr[1]] = [data.decode(), idx, -1]

                self.packetsList.append([])
                idx += 1
            else:
                fileidx = self.PortDict[addr[1]][1]
                # before this, we need to exclude seq from data
                seqidx = data.find(b'\r\n\n')
                print('seqidx:', seqidx)
                seq = int(data[:seqidx])
                print('seq:', seq)
                data = data[seqidx+3:]
                print('data:', data)
                self.packetsList[fileidx].append(data)
                
            print(self.PortDict)




if __name__ == '__main__':
    lossP = float(input('packet loss probability (0.0 ~ 1.0): '))

    try:
        clPort = 10080
        print('======== Starting Client. <Ctrl + C> to stop. ========')
        reciever = UDPReciever('', clPort)
        reciever.recieve()
    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close server after every threads are closed.')
        reciever.sock.close()
        sys.exit()
