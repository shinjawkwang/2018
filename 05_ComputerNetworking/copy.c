#include <stdio.h>
#include <string.h>

int main(int agrc, char** argv) {
	/* 
		* fName: file name nName: new name 
		* format: file format(ex. txt, avi, etc...)
		* flag: detect '.' in fName and control loop
		* isTxt: This code will devide files into two group: 1.txt 2.others(binary files)
		*/
	char fName[100], nName[100];
	char format[10];
	int flag = 1, cnt=0, isTxt;


	/* input file name && new name */
	printf("Input the file name: ");
	scanf("%s", fName);
	printf("Input the new name: ");
	scanf("%s", nName);


	/* detect file format: txt or others */
	for(int i=0; i<strlen(fName); i++) {
		if(fName[i] == '.') {
			flag = 0;
			continue;
		}

		if(flag) continue;

		format[cnt++] = fName[i];
	}


	/* when the input file is text file */
	if(!strcmp(format, "txt")) {

	}
	/* when the input file is not file (image or video) */
	else {

	}

	return 0;
}
