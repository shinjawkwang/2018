from socket import *
from threading import *
import os.path
import sys
from datetime import datetime, timedelta


class UDPClient(object):
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_DGRAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))

    def recieve(self):
        while True:
            data, addr = self.sock.recv(65535)



if __name__ == '__main__':
    lossP = float(input('packet loss probability (0.0 ~ 1.0): '))

    try:
        clPort = 10080
        print('======== Starting Client. <Ctrl + C> to stop. ========')
        client = UDPClient('', clPort)
        # server.listen()
    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close server after every threads are closed.')
        client.sock.close()
        sys.exit()
