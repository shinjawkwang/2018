from socket import *
import email
import pprint
from io import StringIO

def rqParser(req):
    headers = req.split('\r\n')
    method, url, ver = headers[0].split(' ')
    headers = headers[1:]
    return [method, url, ver, headers]

def rqHandler(req):
    method, url, ver, headers = rqParser(req)
    if method=='GET':
        # index.html
        if url=='/':
            filename = 'index.html'
        else:
            flag = True

def createResponse():
    test = False


def main():
    svPort = 10080
    with socket(AF_INET, SOCK_STREAM) as svSock:
        svSock.bind(('', svPort))
        svSock.listen(5)
        while True:
            clSock, addr = svSock.accept()
            msg = clSock.recv(65535).decode()
            method, url, ver, headers = rqParser(msg)
            print(method)
            print(url)
            print(ver)
            print(headers)
                


main()
