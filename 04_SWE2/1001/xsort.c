#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


/* this form won't make warning */
int compare(const void *a, const void *b) {
    /*      ^^^^^^^^^^^^   ^^^^^^^^^^^^  */
    return strcmp((char*)a, (char *)b);
}

int main(int argc, char *argv[]) {
    int fd = open(argv[1], O_RDONLY);
    char wd;
    int i=0, j=0, fl=0, max=0;
    char buf[20][20] = {0x00, };

    if(fd > 0) {
        while(read(fd, &wd, 1)) {
            if(wd=='\n') {
                i ++;
                if(j>max) {
                    max = j;
                }
                j = 0;
            }
            else {
                buf[i][j] = wd;
                j ++;
            }
        }
    }
    else {
        printf("READ ERROR\n");
        return 1;
    }
    i = fl;

    qsort((void *)buf, fl, sizeof(buf[0]), compare);

    for(i=0; i<fl; i++) {
        printf("%s\n", buf[i]);
    }
    return 0;
}
