/*-----------------------------------------------------------
 *
 * SWE2007: Software Experiment 2 (FALL 2018)
 *
 * Skeleton code for PA#1
 * 
 * September 17, 2018.
 * Computer Network Lab, Sungkyunkwan University
 *
 * Student Id   : 2017310528
 * Student Name : 신재광
 *
 *-----------------------------------------------------------
 */
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int strlength(char *str);

int strlengthP(char *str) {
    int cnt=0;
    while(str[cnt] != ':') {
        cnt ++;
    }
    return cnt+1;
}

int strcompareP(char *a, char *b) {
	int size_a = strlengthP(a);
	int size_b = strlengthP(b);

	for(int j=0; j<size_a; j++) {
		if('A'<=a[j] && a[j]<='Z') {
			a[j] += 32;
		}
	}
	for(int j=0; j<size_b; j++) {
		if('A'<=b[j] && b[j]<='Z') {
			b[j] += 32;
		}
	}
	if(size_a != size_b) {
		if(size_a > size_b) {
			for(int j=0; j<size_b; j++) {
				if(a[j] > b[j]) {
					return 1;
				}
				else if(a[j] < b[j]) {
					return -1;
				}
			}
			return 1;
		}
		else {
			for(int j=0; j<size_a; j++) {
				if(a[j] > b[j]) {
					return 1;
				}
				else if(a[j] < b[j]) {
					return -1;
				}
			}
			return -1;
		}
	}
	else {
		for(int j=0; j<size_a; j++) {
			if(a[j] > b[j]) {
				return 1;
			}
			else if(a[j] < b[j]) {
				return -1;
			}
		}
		return 0;
	}
}

int compare (const void *a, const void *b) {
	char *pa = *(char **) a;
	char *pb = *(char **) b;
	return (strcompareP(pa, pb));
}

void indexPrinter(const char* indexFileNm, const char* outputFileNm) {
	/* Write your own C code */
	int inptfd, ouptfd;
	char **buf;
	int nlcnt=0, colcnt=0, max=0, flag=1, i, j, fl;
	char wd;
	inptfd = open(indexFileNm, O_RDONLY);
	ouptfd = open(outputFileNm, O_CREAT | O_WRONLY, S_IRWXU | S_IRWXG | S_IRWXO);
	while(read(inptfd, &wd, 1) > 0) {
		colcnt++;
		if(wd == '\n') {
			if(colcnt > max) {
				max = colcnt;
			}
			colcnt = 0;
			nlcnt++;
		}
	}
	nlcnt -= 2;
	buf = (char **)malloc(sizeof(char*) * nlcnt);
	for(int i=0; i<nlcnt; i++) {
		buf[i] = (char *)malloc(sizeof(char) * max);
	}

	lseek(inptfd, 0, SEEK_SET);

	nlcnt = 0;
	i = 0;
	j = 0;
	while(read(inptfd, &wd, 1) > 0) {
		if(flag) {
			if(nlcnt == 0) {
				write(ouptfd, &wd, 1);				
			}
			if(wd == '\n') {
				nlcnt ++;
			}
			if(nlcnt == 2) {
				flag = 0;
				continue;
			}
		}
		/* sort start */
		else {
			if(wd == '\n') {
				buf[i][j] = '\0';
				i++;
				j=0;
			}
			else {
				buf[i][j] = wd;
				j ++;
			}
		}
	}
	close(inptfd);

	
	fl = i;
	qsort((void *)buf, fl, sizeof(char *), compare);
	for(j=0; j<i; j++) {
		write(ouptfd, buf[j], strlength(buf[j]));
		write(ouptfd, "\n", 1);
	}
	close(ouptfd);
}
