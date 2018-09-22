#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>


int isnum(char inpt);


int main(int argc, char **argv)
{
	int fd;
	const char *file_name = NULL;
	char buf[1024] = {0x00, }, prev;
	int ChapSum=0, VerseSum=0;
	int cnt=0, cntWd=0, ChapFlag = 1;

	if (argc < 2) {
		write(1, "usage: pa0 <src>\n", 17);
		return 1;
	} else {
		file_name = argv[1];
	}

	fd = open(file_name, O_RDONLY);

	/* write your own c code */
	while(read(fd, buf, 1) > 0) {
		//write(1, buf, 1);
		if (buf[0] == '\n') {
			ChapFlag = 1;
			continue;
		}
		else if(buf[0] == ' ') {
			continue;
		}
		else if(isnum(buf[0])) {
			cnt = 1;
			while(buf[cnt-1] != ':') {
				read(fd, buf+cnt, 1);
				cnt ++;
			}
			if(ChapFlag) {
				write(1, "[[ Chapter ]]\n", 15);
				ChapFlag = 0;
			}
			else {
				write(1, ">>> Verse\n", 10);
			}
			//write(1, buf, cnt-1);
			//write(1, "\n", 1);
			for (int i = 0; i < cnt; i++) {
				buf[i] = 0x00;
			}
		}
		else {
			cnt = 1;
			while(buf[cnt-1] != ' ' && buf[cnt-1] != '\n') {
				read(fd, buf+cnt, 1);
				cnt ++;
			}
			if(buf[cnt-1] == '\n') {
				ChapFlag = 1;
			}
			for (int i = 0; i < cnt; i++) {
				buf[i] = 0x00;
			}
			cntWd ++;
		}
	}
	
	printf("Words : %d\n", cntWd);
	close(fd);
	return 0;
}


int isnum(char inpt) {
	return inpt == '0' || inpt == '1' || inpt == '2' || inpt == '3' || inpt == '4' || inpt == '5' || inpt == '6' || inpt == '7' || inpt == '8' || inpt == '9';
}
