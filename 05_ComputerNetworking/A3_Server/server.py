from socket import *

user_id = 'JKPraha'
user_password = 2521

def rqParser(req):
    headerDict = {}
    headers = req.split('\r\n')
    method, url, ver = headers[0].split(' ')
    headers = headers[1:-2]
    for header in headers:
        key, value = header.split(': ')
        headerDict[key] = value
    return [method, url, ver, headerDict]

def rqHandler(req):
    method, url, ver, headerDict = rqParser(req)
    if method=='GET':
        # index.html
        if url=='/':
            filename = 'index.html'
        else:
            filename = url[1:]
        
        print('filename: {0}'.format(filename))
        if filename.endswith('.html'):
            ctype = 'text/html'
        elif filename.endswith('.png'):
            ctype = 'image/png'
        elif filename.endswith('.jpg'):
            ctype = 'image/jpg'
        elif filename.endswith('.gif'):
            ctype = 'image/gif'
        elif filename.endswith('.mp4'):
            ctype = 'video/mp4'
        elif filename.endswith('.js'):
            ctype = 'application/javascript'
        elif filename.endswith('.css'):
            ctype = 'text/css'
        else:
            ctype = 'text/plain'
        
        content, ctype = readNserve(ctype, filename)
    elif method=='POST':
        print('login process start')
    
    return [content, ctype]

def readNserve(ctype, filename):
    if ctype.startswith('video'):
        _, vtype = ctype.split('/')
        ctype = 'text/html'
        content = """<!DOCTYPE html>
        <html>
            <body>
                <video>
                    <source src="{0}" type="video/{1}"/>
                </video>
            </body>
        </html>""".format(filename, vtype)
    else:
        try:
            with open(filename, 'rb') as f:
                content = f.read()
        except FileNotFoundError:
            return None
    
    return [content, ctype]



def main():
    svPort = 10080
    successMsg = 'HTTP/1.1 200 OK\r\n'
    with socket(AF_INET, SOCK_STREAM) as svSock:
        svSock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        svSock.bind(('', svPort))
        svSock.listen(5)
        while True:
            clSock, addr = svSock.accept()
            print('Client Port: {0}'.format(addr[1]))
            msg = clSock.recv(65535).decode()
            print(msg)
            content, ctype = rqHandler(msg)

            if content:
                if type(content) == str:
                    content = content.encode()
                successMsg += 'Content-Type: {0}\r\n'.format(ctype)
                successMsg += '\r\n'
                clSock.send(successMsg.encode())
                clSock.send(content)
                
            else:
                clSock.send("""HTTP/1.1 404 NOT FOUND\r\n\r\n
                <!DOCTYPE html>
                <html>
                <body>
                <h1>FILE NOT FOUND</h1>
                </body>
                </html>""".encode())
            successMsg = 'HTTP/1.1 200 OK\r\n'

main()
