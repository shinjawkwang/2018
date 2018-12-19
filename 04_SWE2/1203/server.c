#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>
#include <arpa/inet.h>
#include <pthread.h>

#define MAXLINE 80
#define N 10

int flag = 0;
pthread_mutex_t fd_mutex = PTHREAD_MUTEX_INITIALIZER;
int connfds[N];
int thread_num = 0;
void *thread_main(void *arg);

int main(int argc, char *argv[]) {
    int n, listenfd, connfd, *connfdp, caddrlen;
    struct hostent *h;
    struct sockaddr_in saddr, caddr;
    int port = atoi(argv[1]);
    pthread_t tid;

    if ((listenfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("socket() failed.\n");
        exit(1);
    }
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
		if ((connfd = accept(listenfd, (struct sockaddr *)&caddr, 
        (socklen_t *)&caddrlen)) < 0) {
			printf ("accept() failed.\n");
			continue;
		}
        pthread_mutex_lock(&fd_mutex);
        connfds[thread_num ++] = connfd;
        pthread_mutex_unlock(&fd_mutex);
        connfdp = (int *)malloc(sizeof(int));
        *connfdp = connfd;
        pthread_create(&tid, NULL, thread_main, connfdp);
        thread_num ++;
	}
	close(listenfd);
}

void *thread_main(void *arg) {
    int n, i, j;
    char buf[MAXLINE];
    int connfd = *((int *)arg);
    pthread_detach(pthread_self());
    free(arg);

    while ((n = read(connfd, buf, MAXLINE)) > 0) {
        printf("incoming: %s\n", buf);
        pthread_mutex_lock(&fd_mutex);
        for(i=0; i<thread_num; i++) {
            if(connfds[i] != connfd){
                write(connfds[i], buf, n);
            }
        }
        pthread_mutex_unlock(&fd_mutex);
    }
    pthread_mutex_lock(&fd_mutex);
    for(i=0; i<thread_num; i++) {
        if(connfds[i] == connfd){
            write(connfds[i], buf, n);
        }
    }
    pthread_mutex_unlock(&fd_mutex);
    close(connfd);
    return NULL;
}
