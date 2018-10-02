#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    int tar = open(argv[1], O_RDONLY);
    int cnt = 0;
    char wd, buf[10];

    while (tar > 0 && read(tar, &wd, 1) > 0) {
        if(cnt==9) {
            write(1, buf, 10);
            cnt = 0;
            continue;
        }
        buf[cnt]= wd;
        cnt ++;
    }

    write(1, buf, cnt);
    close(tar);

    return 0;
}
