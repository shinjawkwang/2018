from socket import *
import os.path
import sys
import uuid
from datetime import datetime, timedelta

username = None
cookieEndTime = None

htmlHeader = """<!DOCTYPE html><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Computer Networks A3</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
        <style>body {font-family: 'Nanum Gothic', sans-serif;}</style>
    </head><html><body><div class=\"container\"><div class=\"row\">"""

def rqParser(req):
    headerDict = {}
    postDict = {}
    headers = req.split('\r\n')
    print(headers)
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

def filetype(filename):
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

def rqHandler(req):
    global username
    global cookieEndTime
    method, url, _, headerDict, postDict = rqParser(req)
    if 'Cookie' in headerDict:
        isCookie = True
    else:
        isCookie = False

    if method=='GET':
        if url=='/':
            filename = 'index.html'
        else:
            filename = url[1:]
            if not os.path.exists(filename):
                return [None, '404', False, False]
            if isCookie or url=='/favicon.ico':
                pass
            else:
                return [None, '403', False, False]
        setCookie = False


    elif method=='POST':
        print('#### login process start')
        username = postDict['username']
        cookieID = uuid.uuid4()

        cookieEndTime = datetime.now() + timedelta(seconds=30)
        cookieEndStr = cookieEndTime.strftime('%A, %-d %b %Y %H:%M:%S GMT')
        filename = 'secret.html'
        cCookie = 'Set-Cookie: id={0}; Expires={1};\r\n\r\n'.format(cookieID, cookieEndStr)
        isCookie = True
        setCookie = True
    
    ctype = filetype(filename)

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
                content = """<html><body><iframe class=\"center-align\" style=\"width:100%;height:100%;\" src=\"{0}\"></iframe></div></div></body></html>""".format(filename)
            ctype = 'text/html'
            return [content, ctype, isCookie, setCookie]

    if filename == 'cookie.html':
        seconds = (cookieEndTime - datetime.now()).seconds
        content = htmlHeader + """<h2 class=\"col l6 offset-l3 s12\">Hello {0}</h2>
        <p class=\"col l6 offset-l3 s12\">{1} seconds left until your cookie expires.</p></div></body></html>""".format(username, seconds)
        return [content, ctype, isCookie, setCookie]

    content, ctype = readNserve(ctype, filename)
    if method == 'POST':
        if type(content) != str:
            content = content.decode()
        content = cCookie + content
    
    return [content, ctype, isCookie, setCookie]

def readNserve(ctype, filename):
    try:
        with open(filename, 'rb') as f:
            content = f.read()
    except FileNotFoundError:
        return [None, '404']

    return [content, ctype]


def main():
    svPort = 10080
    successMsg = 'HTTP/1.1 200 OK\r\n'
    with socket(AF_INET, SOCK_STREAM) as svSock:
        svSock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        svSock.bind(('', svPort))
        svSock.listen(5)
        print('#### Server has been ready to accept')
        try:
            while True:
                print('#### waiting for accept')
                clSock, addr = svSock.accept()
                print('#### Client Port: {0}'.format(addr[1]))
                print('#### Waiting reciving . . .\n')
                msg = clSock.recv(1024).decode()
                if not msg:
                    print('REQUEST ERROR. recv() again.')
                    continue
                print(msg)
                content, ctype, isCookie, setCookie = rqHandler(msg)

                if content:
                    if type(content) == str:
                        content = content.encode()
                    successMsg += 'Keep-Alive: timeout=10, max=100\r\n'
                    successMsg += 'Connection: Keep-Alive\r\n'
                    successMsg += 'Content-Type: {0}\r\n'.format(ctype)
                    successMsg += 'Date: {0}\r\n'.format(datetime.now().strftime('%A, %-d %b %Y %H:%M:%S GMT'))
                    if not setCookie:
                        print('no cookie setting')
                        successMsg += '\r\n'
                    clSock.send(successMsg.encode())
                    print(successMsg, end='')
                    if not ctype.startswith('image') and not ctype.startswith('video') and not ctype.endswith('pdf'):
                        if type(content) == str:
                            test = content
                        else:
                            test = content.decode()
                        print(test)
                    clSock.send(content)

                else:
                    if ctype == '404':
                        print('404 ERROR')
                        clSock.send(('HTTP/1.1 404 NOT FOUND\r\n\r\n' + htmlHeader + '<h1 class=\"col l8 offset-l2 s12\">404 NOT FOUND</h1></div></body></html>').encode())
                    elif ctype == '403':
                        print('403 ERROR')
                        clSock.send(('HTTP/1.1 403 Forbidden\r\n\r\n' + htmlHeader + '<h1 class=\"col l8 offset-l2 s12\">403 Forbidden</h1></div></body></html>').encode())
                
                print('\n#### Send Complete. Close Client Socket')
                successMsg = 'HTTP/1.1 200 OK\r\n'
                clSock.close()
        except KeyboardInterrupt:
            print('\nKeyboard Interrupted. End Program.')


main()
