#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <fcntl.h>

#define MAXLINE 255

int isnum(char c);
int isalphabet(char c);
void searchNSend(char *tar, int connfd);

int main(int argc, char *argv[]) {
    int n, listenfd, connfd, caddrlen;
	struct hostent *h;
	struct sockaddr_in saddr, caddr;
	char buf[MAXLINE], *hostname;
	int option = 1;
	int port = atoi(argv[1]);
	
	if ((listenfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
		printf("socket() failed.\n");
		exit(1);
	}
	setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, (const char*)&option, sizeof(option));
	bzero((char *)&saddr, sizeof(saddr));
	saddr.sin_family = AF_INET;
	saddr.sin_addr.s_addr = htonl(INADDR_ANY);
	saddr.sin_port = htons(port);   
	if (bind(listenfd, (struct sockaddr *)&saddr, sizeof(saddr)) < 0) {
		printf("bind() failed.\n");
		exit(2);
	}
	if (listen(listenfd, 5) < 0) {
		printf("listen() failed.\n");
		exit(3);
	}
    while (1) {
        caddrlen = sizeof(caddr);
        if ((connfd = accept(listenfd, (struct sockaddr *)&caddr, (socklen_t *)&caddrlen)) < 0) {
            printf ("accept() failed.\n");
            continue;
        }
        h = gethostbyaddr((const char *)&caddr.sin_addr.s_addr, sizeof(caddr.sin_addr.s_addr), AF_INET);
		hostname = inet_ntoa(*(struct in_addr *)&caddr.sin_addr);
		printf("\nConnected: %s\n", hostname); 
        while((n = read(connfd, buf, MAXLINE)) > 0) {
            printf("search: %s\n", buf);
			searchNSend(buf, connfd);
			for(int i=0; i<MAXLINE; i++) {
				buf[i] = 0x00;
			}
        }
        printf("Disconnected: %s\n", hostname);
        close(connfd);
    }
    return 0;
}

int isnum(char c) {
    return '0'<=c && c<='9';
}
int isalphabet(char c) {
	return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z');
}

void searchNSend(char *tar, int connfd) {
	/* Write your own C code */
	int inptfd;
	char buf[1024] = {0x00,}, sender[1024] = {0x00,}, *name, tmp[20], *word;
	int cntVerse=0, cntWd=0, cntIdx=0;
	int cnt=0, ChapFlag=1, introFlag=0, curchap=0, curver=0, sendFlag=0, curbyte, size, i, j, testflag, send;
	char str[20];
    char inputFileNm[50] = "genesis.txt";
	inptfd = open(inputFileNm, O_RDONLY);
    for(cnt=0; inputFileNm[cnt]!='.'; cnt++);
	size = cnt;
	name = (char *)malloc(sizeof(char) * cnt);
	for (i = 0; i<cnt; i++)
		name[i] = inputFileNm[i];
	name[cnt] = '\0';

	send = 0;
	while(read(inptfd, buf, 1) > 0) {
		if(buf[0] == '\n') {
			ChapFlag = 1;
			continue;
		}
		else if (buf[0] == ' ') {
			sender[strlen(sender)] = buf[0];
			continue;
		}
		else if (isnum(buf[0])) {
			if (ChapFlag) {
				for(i=0; i<strlen(name); i++) {
					sender[strlen(sender)] = name[i];
				}
				sender[strlen(sender)] = ':';
				cnt = 1;
				while(buf[cnt-1] != ':') {
					read(inptfd, buf+cnt, 1);
					sender[strlen(sender)] = buf[cnt - 1];
					cnt++;
				}
				sender[strlen(sender)] = ':';
				buf[cnt] = '\0';
				curchap = atoi(buf);
				ChapFlag = 0;
			}
			else {
				cnt = 1;
				while(buf[cnt-1] != ':') {
					read(inptfd, buf+cnt, 1);
					sender[strlen(sender)] = buf[cnt - 1];
					cnt++;
				}
				sender[strlen(sender)] = ':';
				curver = atoi(buf);
				cntVerse++;
			}
			if (!introFlag)
				introFlag = 1;
		}
		else {
			if (ChapFlag) {
				while (buf[0] != '\n') {
					read(inptfd, buf, 1);
				}
				continue;
			}
			else if(!introFlag) {
				continue;
			}
			else {
				cnt = 0;
				while (buf[cnt] != '\n') {
					cnt ++;
					read(inptfd, buf+cnt, 1);
				}
				buf[cnt+1] = '\0';
				i = 0;
				cnt = 0;
				while(buf[i] != '\0') {
					if(buf[i] == tar[0]) {
						for(j=0; j<strlen(tar); j++) {
							if(tar[j] != buf[i+j]) {
								break;
							}
						}
						// Found!
						if(j==strlen(tar)) {
							sender[strlen(sender)] = '[';
							for(j=0; j<strlen(tar); j++) {
								sender[strlen(sender)] = tar[j];
							}
							sender[strlen(sender)] = ']';
							i += strlen(tar) - 1;
							sendFlag = 1;
						}
						// Not found
						else {
							sender[strlen(sender)] = buf[i];
						}
					}
					else {
						sender[strlen(sender)] = buf[i];
					}
					i++;
				}
				ChapFlag = 1;
				if(sendFlag) {
					write(connfd, sender, strlen(sender));
					sendFlag = 0;
				}
				for(i=0; i<1024; i++) {
					sender[i] = 0x00;
				}
			}
		}
		for(i=0; i<1024; i++) {
			buf[i] = 0x00;
		}
	}
	write(connfd, "\n", 1);
	close(inptfd);
}
