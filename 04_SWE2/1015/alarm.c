#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>

//pid_t pid;

void handler(int sig) {
	while(1) {
		printf("BEEP\n");
		sleep(1);
	}
}

int main() {
	signal(SIGALRM, handler);
	alarm(1);
	while(1);
	return 0;
}
