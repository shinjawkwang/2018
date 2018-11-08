#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 255

int main(int argc, char *argv[]) {
    int n, cfd;
    struct hostent *h;
    struct sockaddr_in saddr;
    char buf[MAXLINE];
    char *host = argv[1];
    int port = atoi(argv[2]);
    char cmd[255];

    if((cfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("socket() failed.\n");
        exit(1);
    }
    if ((h = gethostbyname(host)) == NULL) {
        printf("invalid hostname %s\n", host);
        exit(2);
    }
    bzero((char *)&saddr, sizeof(saddr));
    saddr.sin_family = AF_INET;
    bcopy((char *)h->h_addr, (char *)&saddr.sin_addr.s_addr, h->h_length);
    saddr.sin_port = htons(port);

    if (connect(cfd, (struct sockaddr *)&saddr, sizeof(saddr)) < 0) {
        printf("connect() failed.\n");
        exit(3);
    }
    /* -------------------------------------------------------------------------
     * connect finished
     * send(write), recv(read) process start
     * -------------------------------------------------------------------------
     */
    while(1) {
        write(1, "> ", 2);
        n = read(0, cmd, MAXLINE);
        cmd[n-1] = '\0';
        
        if(!strcmp(cmd, "!q")) {
            break;
        }
        write(cfd, cmd, strlen(cmd));
        while((n = read(cfd, buf, MAXLINE)) > 0) {
            printf("%s", buf);
            if(buf[0] == '\n') {
                break;
            }
            for(int i=0; i<MAXLINE; i++) {
                buf[i] = 0x00;
            }
        }
    }
    close(cfd);
}
