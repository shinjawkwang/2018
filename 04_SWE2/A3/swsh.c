#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>

typedef struct __COMMAND__ {
    char *name;
    int argc;
    char *argv[];
} command;
static char cmdChar = '\0';
static char cmdStr[80];
static char *dirs[100];
pid_t pid;

void handler (int sig) {
    // do_nothing
}
void readCommand(char *line, char *cmd);
void parseCommand(command *cmd, char *line);
void runCommand(command *cmd);
int isImplementedCommand(char *name);
int runImplementedCommand(command *cmd);
void getPath(char *dirs[]);
void runPipeCommand(command *cmd, int idx);
void execCommand(command *cmd);
void execPipeCommand(char *arg1[], char *arg2[], char *name1, char *name2);
char *findCommand(char *argv[], char *dirs[]);

void cat(command *cmd);
void cp(command *cmd);
void mv(command *cmd);
void rm(command *cmd);
void cd(command *cmd);
void pwd(command *cmd);
void head(command *cmd);
void tail(command *cmd);

int main() {
    signal(SIGINT, handler);
    signal(SIGTSTP, handler);
    command cmd;
    getPath(dirs);
    
    while(1) {
        write(1, "$ ", 2);
        read(0, &cmdChar, 1);
        if (cmdChar == '\n') {
            cmdChar = '\0';
            for(int i=0; i<strlen(cmdStr); i++) {
                cmdStr[i] = '\0';
            }
            continue;
        }
        else {
            readCommand(cmdStr, &cmdChar);
            if(strcmp(cmdStr, "exit") == 0) {
                exit(0);
            }
            parseCommand(&cmd, cmdStr);
            runCommand(&cmd);
        }
    }
    cmdChar = '\0';
    for(int i=0; i<strlen(cmdStr); i++) {
        cmdStr[i] = '\0';
    }
    return 0;
}

void getPath(char *dirs[]) {
    int i;
    char *pathEnv;
    char *path;
    char *cpy;
    for(i=0; i<100; i++) {
        dirs[i] = NULL;
    }

    pathEnv = (char *)getenv("PATH");
    path = (char *)malloc(strlen(pathEnv) + 1);
    strcpy(path, pathEnv);

    i=0;
    cpy = strtok(path, ":");
    while(cpy != NULL) {
        dirs[i] = cpy;
        cpy = strtok(NULL, ":");
        i++;
    }
}

char *findCommand(char *argv[], char *dirs[]) {
    int i;
    char *result;
    for(i=0; i<100; i++) {
        if(dirs[i] != NULL) {
            asprintf(&result, "%s%s%s", dirs[i], "/", argv[0]);
            if(access(result, X_OK) == 0) {
                return result;
            }
        }
        else {
            break;
        }
    }
    return NULL;
}

void readCommand(char *line, char *cmd) {
    int bufLen = 0;

    while ((*cmd != '\n') && (bufLen < 80)) {
        line[bufLen++] = *cmd;
        read(0, cmd, 1);
    }
    line[bufLen] = '\0';
}

void parseCommand(command *cmd, char *line) {
    int argc = 0;
    char *arg;

    arg = strtok(line, " ");
    while(arg != NULL) {
        cmd->argv[argc++] = arg;
        arg = strtok(NULL, " ");
    }

    cmd->argc = argc;
    cmd->argv[argc] = NULL;
    cmd->name = cmd->argv[0];
}

int isImplementedCommand(char *name) {
    if (!strcmp(name, "cat"))          return 1;
    else if (!strcmp(name, "cp"))      return 1;
    else if (!strcmp(name, "mv"))      return 1;
    else if (!strcmp(name, "rm"))      return 1;
    else if (!strcmp(name, "cd"))      return 1;
    else if (!strcmp(name, "pwd"))     return 1;
    else if (!strcmp(name, "head"))    return 1;
    else if (!strcmp(name, "tail"))    return 1;
    else                               return 0;
}

int runImplementedCommand(command *cmd) {
    if (!strcmp(cmd->name, "cat")) {
        cat(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "cp")) {
        cp(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "mv")) {
        mv(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "rm")) {
        rm(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "cd")) {
        cd(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "pwd")) {
        pwd(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "head")) {
        head(cmd);
        return 1;
    }
    else if (!strcmp(cmd->name, "tail")) {
        tail(cmd);
        return 1;
    }
    else {
        return 0;
    }
}

void runCommand(command *cmd) {
    for(int i=0; i<cmd->argc; i++) {
        if(!strcmp(cmd->argv[i], "|")) {
            runPipeCommand(cmd, i);
            return;
        }
    }
    execCommand(cmd);
}

void execPipeCommand(char *arg1[], char *arg2[], char *name1, char *name2) {
    int pipefd[2];
    int i;
    command *tmp = (command *)malloc(sizeof(command));

	if(pipe(pipefd)) {
		perror("pipe");
		exit(127);
	}

	switch(fork()) {
        case -1:
            perror("fork()");
            exit(127);
        case 0:
            close(pipefd[0]);
            dup2(pipefd[1], 1);
            close(pipefd[1]);
            
            printf("Not Implemented: %s\n", name1);
            i = 0;
            while(arg1[i] != NULL) {
                printf("%s\n", arg1[i]);
                i++;
            }
            execve(name1, arg1, 0);
            
            perror(name1);
            exit(126);
        default:
            close(pipefd[1]);
            dup2(pipefd[0], 0);
            close(pipefd[0]);

            execve(name2, arg2, 0);

            perror(name2);
            exit(125);
	}
}

void execCommand(command *cmd) {
    int pid;
	int status;
	pid_t childPID;
    if(!runImplementedCommand(cmd)) {
        cmd->name = findCommand(cmd->argv, dirs);
        if(cmd->name == NULL) {
            return;
        }
        pid = fork();
        if(pid < 0 ) {
            fprintf(stderr, "Fork fails: \n");
            return;
        }
        else if(pid==0) {
            execve(cmd->name, cmd->argv, 0);
            return;
        }
        else if(pid > 0) {
            childPID = waitpid(pid, &status, WUNTRACED | WCONTINUED);
            if (childPID == -1) {
                perror("waitpid");
                exit(EXIT_FAILURE);
            }

            if (WIFEXITED(status)) {
                return;
            }

        }
    }
}

void runPipeCommand(command *cmd, int idx) {
    int i, j, k=0, pid, status;
    char *arg1[5], *arg2[5], *name1, *name2;
    for(i=0; i<5; i++) {
        arg1[i] = NULL;
        arg2[i] = NULL;
    }
    for(i=0; i<idx; i++) {
        arg1[i] = cmd->argv[i];
    }
    for(j=i+1; j<cmd->argc; j++) {
        arg2[k] = cmd->argv[j];
        k++;
    }

    name1 = findCommand(arg1, dirs);
    name2 = findCommand(arg2, dirs);
    
	fflush(stdout);

    switch ((pid = fork())) {
        case -1:
            perror("fork");
            break;
        case 0:
            execPipeCommand(arg1, arg2, name1, name2);
            break;
        default:
            pid = wait(&status);
    }
    return;
}


/* implemented Commands */
void cat(command *cmd) {
    int tar = open(cmd->argv[1], O_RDONLY);
    int cnt = 0;
    char wd;

    while (tar>0 && read(tar, &wd, 1)>0) {
        write(1, &wd, 1);
    }
    close(tar);
    write(1, "\n", 1);
}

void cp(command *cmd) {
    int cpy = open(cmd->argv[1], O_RDONLY);
	int tar = open(cmd->argv[2], O_WRONLY | O_CREAT);
	char wd;

	while(cpy>0 && read(cpy, &wd, 1)>0) {
		write(tar, &wd, 1);
	}
	close(cpy);
	close(tar);
}

void mv(command *cmd) {
    int cpy = open(cmd->argv[1], O_RDONLY);
	int tar = open(cmd->argv[2], O_WRONLY | O_CREAT);
	char wd;

	while(cpy>0 && read(cpy, &wd, 1)>0) {
		write(tar, &wd, 1);
	}
	close(cpy);
	close(tar);
    unlink(cmd->argv[1]);
}

void rm(command *cmd) { unlink(cmd->argv[1]); }

void cd(command *cmd) {
    if (cmd->argc == 1) {
        chdir(getenv("HOME"));
    }
    else if(cmd->argc == 2) {
        if (chdir(cmd->argv[1])) {
            printf("No directory\n");
        }
    }
    else {
        printf("USAGE: cd [dir]\n");
    }
}

void pwd(command *cmd) {
    char *buf = (char *)malloc(sizeof(char) * 100);
    char *result;
    result = (char *) getcwd(buf, 100);
    write(1, result, strlen(result));
    write(1, "\n", 1);
}

void head(command *cmd) {
    int tar = open(cmd->argv[1], O_RDONLY);
    int cnt = 0;
    char wd;

    while (tar>0 && read(tar, &wd, 1)>0) {
        write(1, &wd, 1);
        if(wd == '\n') {
            cnt++;
        }
        if(cnt == 10) {
            break;
        }
    }
    close(tar);
    write(1, "\n", 1);
}

void tail(command *cmd) {
    int tar = open(cmd->argv[1], O_RDONLY);
    int cnt = 0;
    char wd;
    if(lseek(tar, 0, SEEK_END) == -1) {
        perror("lseek() ERROR\n");
        return;
    }
    else {
        while(1) {
            if(lseek(tar, -1, SEEK_CUR) != -1) {
                read(tar, &wd, 1);
                if (wd == '\n') {
                    cnt++;
                }
                lseek(tar, -1, SEEK_CUR);
                if(cnt == 10) {
                    break;
                }
            }
            else {
                break;
            }
        }
        while(read(tar, &wd, 1)) {
            write(1, &wd, 1);
        }
    }
    close(tar);
    write(1, "\n", 1);
}
