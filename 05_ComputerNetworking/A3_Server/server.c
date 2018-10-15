#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <netdb.h>
#include <netinet/in.h>
#include <pthread.h>
#include "httpHandler.h"

typedef struct threadArgument {
    int sockD;
    struct sockaddr_in * clAddr;
    socklen_t clAddr_len;
}tArg;

void* requestHandler(void* data);

int main(int argc, char **argv) {
    /*
        * svSock, clSock: Socket Descriptor
        * svAddr, slAddr: local/client Address
        * portNum: local port num-> in this assignment: 10080
        * clLen: Length of client address
        * eval: used when evaluate something like size of read buffer, result of bind/listen, etc. 
        * buf: buffer used in read/write
        */
    int svSock, clSock;
    struct sockaddr_in svAddr;
    struct sockaddr_in clAddr;
    int portNum;
    socklen_t clLen;
    int eval, on=1;
    char buf[1024];
    pthread_t thread;
    tArg *arg;

    portNum = 10080;

    /* Socket Handling */
    svSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(svSock < 0) {
        perror("SOCKET OPEN ERROR; END PROGRAM");
        return 1;
    }
    if (setsockopt(svSock, SOL_SOCKET, SO_REUSEADDR, (void*)&on, sizeof(on)) != 0) {
		perror("setsockopt() error");
		return 1;
	}

    /* construct struct */
    memset(&svAddr, 0, sizeof(svAddr));
    svAddr.sin_family = AF_INET;
    svAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    svAddr.sin_port = htons(portNum);

    /* binding */
    eval = bind(svSock, (struct sockaddr *)&svAddr, sizeof(svAddr));
    if(eval < 0) {
        perror("bind() ERROR; END PROGRAM");
        close(svSock);
        return 1;
    }

    /* listening */
    eval = listen(svSock, 5);
    if(eval < 0) {
        perror("listen() ERROR; END PROGRAM");
        close(svSock);
        return 1;
    }

    /* accept in infinite loop */
    while(1) {
        clLen = sizeof(clAddr);
        clSock = accept(svSock, (struct sockaddr*)&clAddr, &clLen);
        if(clSock < 0) {
            perror("accept() ERROR; END PROGRAM");
            return 1;
        }
        arg->sockD = clSock;
        arg->clAddr = &clAddr;
        arg->clAddr_len = clLen;
        pthread_create(&thread, NULL, requestHandler, (void *)arg);
        /* for test */
        //eval = read(clSock, buf, 1024);
        //write(1, buf, eval);
    }
    
    return 0;
}

void *requestHandler(void *data) {
    tArg *argP = (tArg *)data;
    int eval = -1;
    char header_buf[2048];
    int p=0;
    request_line_t request = {0,};
    
    tArg arg = *argP;

}
