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

typedef struct index {
	int Chap;
	int Verse;
	int byte;
	struct index *next;
} child;

typedef struct indexlist {
	struct index *head;
	int size;
} children;

typedef struct word {
	char *wd;
	struct indexlist *children;
	struct word *next;
} parent;

typedef struct wordlist {
	struct word *head;
	int size;
} parentList;

children* initialIndexList() {
	children *a = (children *)malloc(sizeof(children));
	a->head = NULL;
	a->size = 0;
	return a;
}

parentList* initialWordList() {
	parentList *a = (parentList *)malloc(sizeof(parentList));
	a->head = NULL;
	a->size = 0;
	return a;
}

void insertIndex(children *list, child *idx) {
	child *cur;
	if(list->size == 0) {
		list->head = idx;
	}
	else {
		cur = list->head;
		while(cur->next != NULL) {
			cur = cur->next;
		}
		cur->next = idx;
	}
	list->size ++;
}

void insertWord(parentList *list, parent *wd) {
	parent *cur;
	if(list->size == 0) {
		list->head = wd;
	}
	else {
		cur = list->head;
		while (cur->next != NULL) {
			cur = cur->next;
		}
		cur->next = wd;
	}
	list->size ++;
}

child* initialIndex(int ch, int ver, int bt) {
	child *a = (child *)malloc(sizeof(child));
	a->Chap = ch;
	a->Verse = ver;
	a->byte = bt;
	a->next = NULL;
	return a;
}

parent* initialWord(char *wd, children *idxList) {
	parent *a = (parent *)malloc(sizeof(parent));
	a->wd = wd;
	a->children = idxList;
	a->next = NULL;
	return a;
}

int isnum(char inpt) {
	return inpt == '0' || inpt == '1' || inpt == '2' || inpt == '3' || inpt == '4' || inpt == '5' || inpt == '6' || inpt == '7' || inpt == '8' || inpt == '9';
}

int isalphabet(char inpt) {
	return ('a' <= inpt && inpt <= 'z') || ('A' <= inpt && inpt <= 'Z') || inpt == '-' || inpt == '\'';
}

int strlength(char *str) {
	int i = 0;
	while (str[i] != '\0') {
		i++;
	}
	return i;
}

char* strcopy(char *cpy) {
	int size = strlength(cpy);
	char *tar = (char *)malloc(sizeof(char) * (size+1));
	for(int i=0; i<size; i++) {
		tar[i] = cpy[i];
	}
	tar[size] = '\0';
	return tar;
}

int strcompare(char *a, char *b) {
	int size_a = strlength(a);
	int size_b = strlength(b);

	if(size_a != size_b) {
		return 0;
	}
	else {
		for(int i=0; i<size_a; i++) {
			if('A'<=a[i] && a[i]<='Z') {
				a[i] += 32;
			}
			if('A'<=b[i] && b[i]<='Z') {
				b[i] += 32;
			}
		}
	
		for(int i=0; i<size_a; i++) {
			if(a[i] != b[i]) {
				return 0;
			}
		}
		return 1;
	}
}

int Int2String(int inpt, char* rString) {
	char iString[20];
	int cnt=0;
	if(inpt == 0) {
        rString[0] = '0';
        rString[1] = '\0';
        return 1;
    }
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

parent * searchWord(parentList *list, char *tar) {
	parent *cur = list->head;
	while(cur != NULL) {
		if(strcompare(cur->wd, tar)) {
			return cur;
		}
		cur = cur->next;
	}
	return NULL;
}

int removeColon(char *copy) {
	int size = strlength(copy);
	char *tar;
	size --;
	tar = (char *)malloc(sizeof(char) * size);
	for(int i=0; i<size; i++) {
		tar[i] = copy[i];
	}
	int result = 0;
	for (int i=size; i>0; i--) {
		int summer = tar[size-i] - '0';
		for (int j=0; j<i-1; j++) {
			summer *= 10;
		}
		result += summer;
	}
	return result;
}


void indexBuilder(const char* inputFileNm, const char* indexFileNm) {
	/* Write your own C code */
	int inptfd, ouptfd;
	char buf[1024] = {0x00,}, *name, tmp[20], *word;
	int cntVerse=0, cntWd=0, cntIdx=0;
	int cnt=0, ChapFlag=1, flag=0, curchap=0, curver=0, curbyte, size, i, testflag;
	char str[20];
	parentList *coreList = initialWordList();
	parent *parent;
	children *idxlist;
	child *idx;
	inptfd = open(inputFileNm, O_RDONLY);
	ouptfd = open(indexFileNm, O_CREAT | O_WRONLY, S_IRWXU | S_IRWXG | S_IRWXO);

	for(cnt=0; inputFileNm[cnt]!='.'; cnt++);
	size = cnt;
	name = (char *)malloc(sizeof(char) * cnt);
	for (int i = 0; i<cnt; i++)
		name[i] = inputFileNm[i];
	name[cnt] = '\0';
	write(ouptfd, name, cnt);
	write(ouptfd, ":", 1);


	while (read(inptfd, buf, 1) > 0) {
		if (buf[0] == '\n') {
			ChapFlag = 1;
			continue;
		}
		else if (buf[0] == ' ') {
			continue;
		}
		else if (isnum(buf[0])) {
			if (ChapFlag) {
				cnt = 1;
				while(buf[cnt-1] != ':') {
					read(inptfd, buf+cnt, 1);
					cnt++;
				}
				buf[cnt] = '\0';
				curchap = removeColon(buf);
				ChapFlag = 0;
			}
			else {
				cnt = 1;
				while(buf[cnt-1] != ':') {
					read(inptfd, buf+cnt, 1);
					cnt++;
				}
				curver = removeColon(buf);
				cntVerse++;
			}
			if (!flag)
				flag = 1;
		}
		else {
			if (ChapFlag) {
				while (buf[0] != '\n') {
					read(inptfd, buf, 1);
				}
				continue;
			}
			else if(!flag) {
				continue;
			}
			else {
				cnt = 0;
				while (buf[cnt] != '\n') {
					cnt ++;
					read(inptfd, buf+cnt, 1);
				}
				buf[cnt+1] = '\0';
				i = 0;
				cnt = 0;
				while(buf[i] != '\0') {
					if(isalphabet(buf[i])) {
						tmp[cnt] = buf[i];
						cnt ++;
						testflag = 0;
					}
					else {
						if(testflag) {
							for(int j=0; j<20; j++) {
								tmp[j] = 0x00;
							}
							i++;
							continue;
						}
						tmp[cnt] = '\0';
						word = strcopy(tmp);
						curbyte = i-strlength(word);
						parent = searchWord(coreList, word);
						idx = initialIndex(curchap, curver, curbyte);
						if(parent == NULL) {
							idxlist = initialIndexList();
							insertIndex(idxlist, idx);
							parent = initialWord(word, idxlist);
							insertWord(coreList, parent);
							cntIdx++;
						}
						else {
							insertIndex(parent->children, idx);
						}
						for(int j=0; j<20; j++) {
							tmp[j] = 0x00;
						}
						cnt = 0;
						cntWd ++;
						testflag = 1;
					}
					i++;
				}
				ChapFlag = 1;
			}
		}
		for (int i = 0; i < 1024; i++) {
			buf[i] = 0x00;
		}
	}
	close(inptfd);

	write(ouptfd, " ", 1);
	cnt = Int2String(curchap, str);
	write(ouptfd, str, cnt);
	write(ouptfd, " ", 1);
	cnt = Int2String(cntVerse, str);
	write(ouptfd, str, cnt);
	write(ouptfd, " ", 1);
	cnt = Int2String(cntIdx, str);
	write(ouptfd, str, cnt);
	write(ouptfd, " ", 1);
	cnt = Int2String(cntWd, str);
	write(ouptfd, str, cnt);

	write(ouptfd, "\n\n", 2);
	
	parent = coreList->head;
	while(parent != NULL) {
		write(ouptfd, parent->wd, strlength(parent->wd));
		write(ouptfd, ": ", 2);
		cnt = Int2String(parent->children->size, str);
		write(ouptfd, str, cnt);
		idx = parent->children->head;
		write(ouptfd, ", ", 2);
		while(idx != NULL) {
			cnt = Int2String(idx->Chap, str);
			write(ouptfd, str, cnt);
			write(ouptfd, ":", 1);
			cnt = Int2String(idx->Verse, str);
			write(ouptfd, str, cnt);
			write(ouptfd, ":", 1);
			cnt = Int2String(idx->byte, str);
			write(ouptfd, str, cnt);
			if(idx->next == NULL) {
				break;
			}
			write(ouptfd, ", ", 2);
			idx = idx->next;
		}
		write(ouptfd, "\n", 1);
		parent = parent->next;
	}
	close(ouptfd);
}
