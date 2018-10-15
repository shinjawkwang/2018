#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>

pid_t pid;
int flag=0;

void zombie(int sig) {
	pid_t id;
	while((id=waitpid(-1, NULL, WNOHANG)) > 0) {
		for(int i=0; i<5; i++) {
			printf("beep\n");
			sleep(1);
		}
		printf("I'm Alive!\n");
		flag = 1;
	}
}

int main() {
	signal(SIGINT, zombie);
	if((pid=fork()) == 0) {
		exit(0);
	}
	while(!flag) {
		sleep(5);
	}
}
