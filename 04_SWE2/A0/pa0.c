#include <fcntl.h>
#include <unistd.h>


int isnum(char inpt);
int Int2String(int inpt, char* rString);


int main(int argc, char **argv) {
	int fd;
	const char *file_name = NULL;
	char buf[1024] = {0x00, };
	int ChapSum=0, VerseSum=0;
	int cnt=0, cntWd=0, ChapFlag = 1, flag = 0, summer = 0;
	char cSum[20], vSum[20], cWd[20];

	if (argc < 2) {
		write(1, "usage: pa0 <src>\n", 17);
		return 1;
	}
	else {
		file_name = argv[1];
	}

	fd = open(file_name, O_RDONLY);

	/* write your own c code */
	while(read(fd, buf, 1) > 0) {
		if (buf[0] == '\n') {
			ChapFlag = 1;
			continue;
		}
		else if(buf[0] == ' ') {
			continue;
		}
		// 1 3 7 : => cnt=4
		// 0 1 2 3
		else if(isnum(buf[0])) {
			cnt = 1;
			while(buf[cnt-1] != ':') {
				read(fd, buf+cnt, 1);
				cnt ++;
			}
			if(ChapFlag) {
				ChapFlag = 0;
				for(int i=0; i<cnt-1; i++) {
					summer = buf[i] - '0';
					for(int j=cnt-i-2; j>0; j--) {
						summer *= 10;
					}
					ChapSum += summer;
				}
			}
			else {
				for (int i=0; i<cnt-1; i++) {
					summer = buf[i] - '0';
					for (int j=cnt-i-2; j>0; j--) {
						summer *= 10;
					}
					VerseSum += summer;
				}
			}
	
			if(!flag) flag = 1;
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

			if (flag) cntWd++;
		}
		for (int i=0; i<cnt; i++) {
			buf[i] = 0x00;
		}
	}
	cnt = Int2String(ChapSum, cSum);
	write(1, cSum, cnt);
	write(1, " ", 1);
	cnt = Int2String(VerseSum, vSum);
	write(1, vSum, cnt);
	write(1,  " ", 1);
	cnt = Int2String(cntWd, cWd);
	write(1, cWd, cnt);
	write(1, "\n", 1);

	close(fd);
	return 0;
}


int isnum(char inpt) {
	return inpt == '0' || inpt == '1' || inpt == '2' || inpt == '3' || inpt == '4' || inpt == '5' || inpt == '6' || inpt == '7' || inpt == '8' || inpt == '9';
}

int Int2String(int inpt, char* rString) {
	char iString[20];
	int cnt=0;
	while(inpt > 0) {
		iString[cnt ++] = inpt%10 + '0';
		inpt /= 10;
	}
	iString[cnt] = '\0';
	// 1 2 3 4 5 => 5 4 3 2 1 : cnt==5
	// 0 1 2 3 4    0 1 2 3 4
	for(int i=0; i<cnt; i++) {
		rString[i] = iString[cnt-i-1];
	}
	rString[cnt] = '\0';
	return cnt;
}
