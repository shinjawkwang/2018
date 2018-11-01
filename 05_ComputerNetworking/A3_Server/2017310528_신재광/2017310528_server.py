from socket import *
from threading import *
import os.path
import sys
from datetime import datetime, timedelta

cookieList = []
threads = []
pdfFlag = True

htmlHeader = """<!DOCTYPE html><html><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Computer Networks A3</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
        <style>body {font-family: 'Nanum Gothic', sans-serif;}</style>
    </head>"""

rspons_404 = 'HTTP/1.1 404 NOT FOUND\r\n\r\n' + htmlHeader + '<body><h1 class=\"col l8 offset-l2 s12\">404 NOT FOUND</h1></div></body></html>'
rspons_403 = 'HTTP/1.1 403 Forbidden\r\n\r\n' + htmlHeader + '<body><h1 class=\"col l8 offset-l2 s12\">403 Forbidden</h1></div></body></html>'

class ThreadServer(object):
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = socket(AF_INET, SOCK_STREAM)
        self.sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))

    def listen(self):
        global threads
        self.sock.listen(5)
        while True:
            clSock, addr = self.sock.accept()
            t = Thread(target=self.recieveFromClient, args=(clSock, addr))
            t.start()
            threads.append(t)


    def recieveFromClient(self, clSock, addr):
        print('######## Client Port: {0}'.format(addr))
        successMsg = 'HTTP/1.1 200 OK\r\n'
        try:
            data = clSock.recv(65535)
            msg = data.decode()
            if data:
                print('======== REQUEST ===================================')
                print(msg)
                filename, content, ctype, isCookie, setCookie = self.rqHandler(msg, addr)
                if ctype == '404':
                    clSock.send(rspons_404.encode())
                    return
                elif ctype == '403':
                    clSock.send(rspons_403.encode())
                    return
                else:
                    print('======== RESPONSE(status and header) ===============')
                    successMsg += 'Date: {0}\r\n'.format(datetime.now().strftime('%a, %d %b %Y %H:%M:%S GMT'))
                    if ctype:
                        successMsg += 'Content-Type: {}\r\n'.format(ctype)
                    successMsg += 'Accept-Ranges: bytes\r\n'
                    successMsg += 'Keep-Alive: timeout=10, max=100\r\n'
                    successMsg += 'Connection: Keep-Alive\r\n'
                    
                    if content:
                        if setCookie:
                            successMsg += content
                            clSock.send(successMsg.encode())
                            self.readNserve(clSock, filename)
                        else:
                            print(successMsg)
                            successMsg += '\r\n' + content
                            clSock.send(successMsg.encode())
                            return

                        print(successMsg, end='')

                    else:
                        successMsg += '\r\n'
                        print(successMsg, end='')
                        clSock.send(successMsg.encode())
                        self.readNserve(clSock, filename)

                print('\n======== Send Complete =============================')
            else:
                raise error('######## Client Disconnected')

        except Exception as e:
            print(e)
            clSock.close()
            return False

        clSock.close()
    
    def rqHandler(self, req, addr):
        global cookieList
        global pdfFlag
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
                ctype = 'text/html'
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
            cookieList.append([username, addr[0], cookieEndTime])
            cookieEndStr = cookieEndTime.strftime('%A, %d %b %Y %H:%M:%S GMT')
            filename = 'secret.html'
            content = 'Set-Cookie: id={0}; Expires={1};\r\n\r\n'.format(username, cookieEndStr)
            isCookie = True
            setCookie = True

        ctype = self.filetype(filename)

        if ctype.startswith('image') or ctype.startswith('video'):
            if not os.path.exists(filename):
                return [None, '404', isCookie, setCookie]
            elif 'Referer' not in headerDict:
                if ctype.startswith('image'):
                    content = htmlHeader + """<body><div class=\"container\"><div class=\"row\"><img style=\"margin-top:80px;\" 
                    class=\"col l8 offset-l2 s12\" src=\"{0}\" alt=\"{0}\"/></div></div></body></html>""".format(filename)
                elif ctype.startswith('video'):
                    content = htmlHeader + """<body><div class=\"container\"><div class=\"row\"><video controls style=\"margin-top:80px;\" autoplay=\"autoplay\">
                    <source class=\"col l8 offset-l2 s12\"  src=\"{0}\" type=\"{1}\"></video></div></div></body></html>""".format(filename, ctype)
                ctype = 'text/html'
                return [filename, content, ctype, isCookie, setCookie]

        if ctype.endswith('pdf') and pdfFlag:
            content = htmlHeader + """<body><embed class=\"center-align\" width=\"1000\" height=\"3000\" src=\"{0}\" type=\"application/pdf\"></body></html>""".format(filename)
            pdfFlag = False
            ctype = 'text/html'
            return [filename, content, ctype, isCookie, setCookie]

        if filename == 'cookie.html':
            username = headerDict['Cookie'][3:]
            endTime = self.find(username, addr[0])
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
            ctype = 'application/pdf'
        elif filename.endswith('.ico'):
            ctype = 'image/ico'
        else:
            ctype = None

        return ctype

    def readNserve(self, sock, filename):
        global pdfFlag
        if not pdfFlag and filename.endswith('.pdf'):
            pdfFlag = True
        try:
            with open(filename, 'rb') as f:
                chunk = 4096 * 4096
                while True:
                    buffer = f.read(chunk)
                    if not buffer:
                        return
                    sock.send(buffer)
        except FileNotFoundError:
            sock.send(rspons_404.encode())
            return

    def find(self, username, addr):
        global cookieList
        for arr in cookieList:
            if arr[0] == username and arr[1] == addr:
                return arr[2]



if __name__ == '__main__':
    try:
        svPort = 10080
        print('======== Starting Server. <Ctrl + C> to stop. ========')
        server = ThreadServer('', svPort)
        server.listen()
    except KeyboardInterrupt:
        print('\nKeyboard Interrupted. Close server after every threads are closed.')
        for t in threads:
            t.join()
        server.sock.close()
        sys.exit()
