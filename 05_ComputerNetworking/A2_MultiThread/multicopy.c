#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>

typedef struct System {
    char fName[100];
    char nName[100];
} sys;

time_t start=0, end=0, coretime=0;

void *thread(void *data) {
    sys *fsys = (sys *)data;
    char buf[1024] = {0x00,};
    int buf_size = 1024;
    int cpy, tar, log_;
    struct stat file_info;
    int pos;

    
    /* check if file exist, and determine buf_size */
    if (stat((*fsys).fName, &file_info) < 0) {
        printf("ERROR: File doesn't exist.\n");
        return NULL;
    }
    else {
        if (file_info.st_size < 128) {
            buf_size = 8 * file_info.st_size;
        }
    }

    start = clock();
    /* open filestreams */
    cpy = open((*fsys).fName, O_RDONLY, S_IRWXU | S_IRWXG | S_IRWXO);
    tar = open((*fsys).nName, O_WRONLY | O_CREAT, S_IRWXU | S_IRWXG | S_IRWXO);
    log_ = open("log.txt", O_WRONLY | O_CREAT | O_APPEND, S_IRWXU | S_IRWXG | S_IRWXO);

    write(log_, "Start copying ", 14);
    write(log_, (*fsys).fName, strlen((*fsys).fName));
    write(log_, " to ", 4);
    write(log_, (*fsys).nName, strlen((*fsys).nName));
    write(log_, "\n", 1);
    /* copy file by buffer && write log.txt */
    pos = read(cpy, buf, buf_size);
    while (pos > 0) {
        write(tar, buf, pos);
        pos = read(cpy, buf, buf_size);
    }
    end = clock();
    coretime += end - start;
    printf("%s - %lf\n", (*fsys).nName, coretime);
    write(log_, (*fsys).nName, strlen((*fsys).nName));
    write(log_, " is copied completely\n", 22);

    /* close filestream => save to directory */
    close(cpy);
    close(tar);
    close(log_);
}

int main(int argc, char **argv) {
    /* 
		* fName: file name 
		* nName: new name 
		* buf: buffer that is used when copying
		* cpy, tar, log_: file streams
		* mod: for giving authority
		* buf_size: size of buffer; dynamically changed by file size
		* file_info: for check file size
		* pos: position of bit, used when reading & writing
		*/
    int cnt = 0;;
    sys *fsys = malloc(sizeof(sys));
    pthread_t threads[200];


    /* Core Loop */
    while (1) {
        /* input file name && new name */
        printf("Input the file name: ");
        scanf("%s", (*fsys).fName);
        getchar();
        printf("Input the new name: ");
        scanf("%s", (*fsys).nName);
        printf("\n");
    

        if (!strcmp((*fsys).fName, (*fsys).nName)) {
            printf("ERROR: File name and new name are same.\n");
            continue;
        }

        pthread_create(&threads[cnt], NULL, thread, (void *)fsys);
    }
    
   
    return 0;
}
