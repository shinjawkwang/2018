#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <assert.h>
#include <stdio.h>

int main(int argc, char **argv) {
	int fd[2], n;
	pid_t pid;
	char *arg = argv[1];

	if(pipe(fd) < 0) {
		exit(1);
	}
	if((pid = fork()) < 0) {
		exit(2);
	}
	if(pid > 0) {
		close(fd[0]);
		dup2(fd[1], 1);
		execl("/bin/echo", "echo", arg, NULL);
	}
	else {
		close(fd[1]);
		dup2(fd[0], 0);
		execl("/usr/bin/bc", "bc", NULL);
	}
}

