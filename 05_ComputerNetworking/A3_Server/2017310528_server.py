from socket import *
from threading import *
from io import *
import os.path
import sys
import uuid
from datetime import datetime, timedelta

cookieDict = {}

htmlHeader = """<!DOCTYPE html><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Computer Networks A3</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
        <style>body {font-family: 'Nanum Gothic', sans-serif;}</style>
    </head><html><body><div class=\"container\"><div class=\"row\">"""

rspons_404 = 'HTTP/1.1 404 NOT FOUND\r\n\r\n' + htmlHeader + '<h1 class=\"col l8 offset-l2 s12\">404 NOT FOUND</h1></div></body></html>'
rspons_403 = 'HTTP/1.1 403 Forbidden\r\n\r\n' + htmlHeader + '<h1 class=\"col l8 offset-l2 s12\">403 Forbidden</h1></div></body></html>'

class ThreadServer(object):
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_STREAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))

    def listen(self):
        self.sock.listen(5)
        while True:
            clSock, addr = self.sock.accept()
            Thread(target=self.recieveFromClient, args=(clSock, addr)).start()

    def recieveFromClient(self, clSock, addr):
        print('######## Client Port: {0}'.format(addr[1]))
        successMsg = 'HTTP/1.1 200 OK\r\n'
        try:
            data = clSock.recv(65535)
            msg = data.decode()
            if data:
                print('######## Client Port: {0}'.format(addr[1]))
                print('======== REQUEST ===================================')
                print(msg)
                filename, content, ctype, isCookie, setCookie = self.rqHandler(msg)
                if ctype == '404':
                    clSock.send(rspons_404.encode())
                    return
                elif ctype == '403':
                    clSock.send(rspons_403.encode())
                    return
                else:
                    print('======== RESPONSE(status and header) ===============')
                    successMsg += 'Date: {0}\r\n'.format(datetime.now().strftime('%A, %-d %b %Y %H:%M:%S GMT'))
                    successMsg += 'Accept-Ranges: bytes\r\n'
                    successMsg += 'Keep-Alive: timeout=50, max=100\r\n'
                    successMsg += 'Connection: Keep-Alive\r\n'
                    
                    if content:
                        if setCookie:
                            successMsg += content
                            clSock.send(successMsg.encode())
                            self.readNserve(clSock, filename)
                        else:
                            successMsg += '\r\n' + content
                            clSock.send(successMsg.encode())
                            print(successMsg, end='')
                            return

                        print(successMsg, end='')

                    else:
                        self.readNserve(clSock, filename)

                print('\n======== Send Complete =============================')
            else:
                raise error('######## Client Disconnected')

        except Exception as e:
            print(e)
            clSock.close()
            return False
    
    def rqHandler(self, req):
        global cookieDict
        content = None
        filename = None
        method, url, _, headerDict, postDict = self.rqParser(req)
        if 'Cookie' in headerDict:
            isCookie = True
        else:
            isCookie = False

        if method == 'GET':
            if url == '/':
                filename = 'index.html'
            else:
                filename = url[1:]
                if not os.path.exists(filename) and filename != 'cookie.html':
                    return [filename, None, '404', False, False]
                if isCookie or url == '/favicon.ico':
                    pass
                else:
                    return [filename, None, '403', False, False]
            setCookie = False

        elif method == 'POST':
            print('######## login process start')
            username = postDict['username']

            cookieEndTime = datetime.now() + timedelta(seconds=30)
            cookieDict[username] = cookieEndTime
            cookieEndStr = cookieEndTime.strftime('%A, %-d %b %Y %H:%M:%S GMT')
            filename = 'secret.html'
            content = 'Set-Cookie: id={0}; Expires={1};\r\n\r\n'.format(username, cookieEndStr)
            isCookie = True
            setCookie = True

        ctype = self.filetype(filename)

        if ctype.startswith('image') or ctype.startswith('video') or ctype.endswith('pdf'):
            if not os.path.exists(filename):
                return [None, '404', isCookie, setCookie]
            elif 'Referer' not in headerDict:
                if ctype.startswith('image'):
                    content = htmlHeader + """<img style=\"margin-top:80px;\" 
                    class=\"col l8 offset-l2 s12\" src=\"{0}\" alt=\"{0}\"/></div></div></body></html>""".format(filename)
                elif ctype.startswith('video'):
                    content = htmlHeader + """<video controls style=\"margin-top:80px;\" autoplay=\"autoplay\">
                    <source class=\"col l8 offset-l2 s12\"  src=\"{0}\" type=\"{1}\"></video></div></div></body></html>""".format(filename, ctype)
                else:
                    content = """<html><body><iframe class=\"center-align\" style=\"width:100%;height:100%;\" src=\"{0}\"></iframe></div></div></body></html>""".format(
                        filename)
                ctype = 'text/html'
                return [filename, content, ctype, isCookie, setCookie]

        if filename == 'cookie.html':
            username = headerDict['Cookie'][3:]
            endTime = cookieDict[username]
            seconds = (endTime - datetime.now()).seconds
            content = htmlHeader + """<h2 class=\"col l6 offset-l3 s12\">Hello {0}</h2>
            <p class=\"col l6 offset-l3 s12\">{1} seconds left until your cookie expires.</p></div></body></html>""".format(username, seconds)
            return [filename, content, ctype, isCookie, setCookie]


        return [filename, content, ctype, isCookie, setCookie]

    def rqParser(self, req):
        headerDict = {}
        postDict = {}
        headers = req.split('\r\n')

        method, url, ver = headers[0].split(' ')
        if method == 'GET':
            headers = headers[1:-2]
            postVars = None
        elif method == 'POST':
            postVars = headers[-1]
            postVars = postVars.split('&')
            for var in postVars:
                key, value = var.split('=')
                postDict[key] = value
            headers = headers[1:-2]
        else:
            print('method hasn\'t parsed well. quit')
            sys.exit()

        for header in headers:
            key, value = header.split(': ')
            headerDict[key] = value

        return [method, url, ver, headerDict, postDict]


    def filetype(self, filename):
        if filename.endswith('.html'):
            ctype = 'text/html'
        elif filename.endswith('.png'):
            ctype = 'image/png'
        elif filename.endswith('.jpg'):
            ctype = 'image/jpg'
        elif filename.endswith('.jpeg'):
            ctype = 'image/jpeg'
        elif filename.endswith('.gif'):
            ctype = 'image/gif'
        elif filename.endswith('.mp4'):
            ctype = 'video/mp4'
        elif filename.endswith('.avi'):
            ctype = 'video/avi'
        elif filename.endswith('.js'):
            ctype = 'application/javascript'
        elif filename.endswith('.css'):
            ctype = 'text/css'
        elif filename.endswith('.pdf'):
            ctype = 'Application/pdf'
        elif filename.endswith('.ico'):
            ctype = 'image/ico'
        else:
            ctype = 'text/plain'

        return ctype

    def readNserve(self, sock, filename):
        try:
            with open(filename, 'rb') as f:
                print(os.path.getsize(filename), 'copy start')
                chunk = 4096 * 4096
                while True:
                    buffer = f.read(chunk)
                    if not buffer:
                        return
                    sock.send(buffer)
        except FileNotFoundError:
            sock.send(rspons_404.encode())
            return



if __name__ == '__main__':
    try:
        svPort = 10080
        print('======== Starting Server. <Ctrl + C> to stop. ========')
        server = ThreadServer('', svPort)
        server.listen()
    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close server.')
        server.sock.close()
        sys.exit()
