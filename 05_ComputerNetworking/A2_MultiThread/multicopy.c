#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>


/* 
    * struct contains file name && new name 
    * for giving parameter easier to thread
    */
typedef struct System {
    char fName[100];
    char nName[100];
} sys;


/* global variables for measure time */
time_t start = 0, end = 0;
double coretime=0;


void *thread(void *data);


int main(int argc, char **argv) {
    /*
        * cnt: for count threads
        * fsys: struct contain file name and new name => give parameter to thread
        * threads: threads
        */
    int cnt = 0;
    sys *fsys = malloc(sizeof(sys));
    pthread_t threads;


    /* Core Loop */
    while (1) {
        /* input file name && new name */
        start = clock();
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


        end = clock(); 
        coretime += (double)((end - start) / CLOCKS_PER_SEC);
        pthread_create(&threads, NULL, thread, (void *)fsys);
    }

    free(fsys);
    return 0;
}


/* 
    * Core Thread function 
    * copy file and measure time
    */
void *thread(void *data) {
    /* 
        * fsys: struct contains file name and new name string
		* buf: buffer that is used when copying
		* cpy, tar, log_: file streams
		* buf_size: size of buffer; dynamically changed by file size
		* file_info: for check file size
		* pos: position of bit, used when reading & writing
		*/
    sys *fsys = (sys *)data;
    sys copier = *fsys;
    char buf[1024] = {0x00,};
    int buf_size = 1024;
    int cpy, tar, log_;
    struct stat file_info;
    int pos;
    char tmp[1] = {0x00};


    /* check if file exist, and determine buf_size */
    if (stat(copier.fName, &file_info) < 0) {
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
    cpy = open(copier.fName, O_RDONLY, S_IRWXU | S_IRWXG | S_IRWXO);
    tar = open(copier.nName, O_WRONLY | O_CREAT, S_IRWXU | S_IRWXG | S_IRWXO);
    log_ = open("log.txt", O_WRONLY | O_CREAT | O_APPEND, S_IRWXU | S_IRWXG | S_IRWXO);


    sprintf(tmp, "%-6.2lf ", coretime);
    write(log_, tmp, strlen(tmp));
    write(log_, "Start copying ", 14);
    write(log_, copier.fName, strlen(copier.fName));
    write(log_, " to ", 4);
    write(log_, copier.nName, strlen(copier.nName));
    write(log_, "\n", 1);
    

    /* copy file by buffer && write log.txt */
    pos = read(cpy, buf, buf_size);
    while (pos > 0) {
        write(tar, buf, pos);
        pos = read(cpy, buf, buf_size);
    }
    end = clock();
    coretime += (double)((end - start) / CLOCKS_PER_SEC);
    sprintf(tmp, "%-6.2lf ", coretime);
    write(log_, tmp, strlen(tmp));
    write(log_, copier.nName, strlen(copier.nName));
    write(log_, " is copied completely\n", 22);


    /* close filestream => save to directory */
    close(cpy);
    close(tar);
    close(log_);
}
