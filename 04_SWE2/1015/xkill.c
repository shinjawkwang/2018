#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>

#define N (10)

int main(void) {
	pid_t pid[N];
	int i, child_status;
	for(i=0; i<N; i++) {
		if((pid[i]=fork()) == 0) {
			while(1);
		}
	}

	for(i=0; i<N; i++) {
		kill(pid[i], SIGTERM);
	}

	for(i=0; i<N; i++) {
		pid_t wpid = wait(&child_status);
		if(WIFEXITED(child_status)) {
			printf("Child %d terminated with exit status %d\n", wpid, WIFEXITED(child_status));
		}
		else {
			printf("Child %d terminated abnormally\n", wpid);
		}
	}
}
