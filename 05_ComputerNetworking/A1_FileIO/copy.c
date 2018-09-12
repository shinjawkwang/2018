#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>


int main(int argc, char** argv) {
	/* 
		* fName: file name 
		* nName: new name 
		* buf: used when copying
		* cpy, tar, log_: file streams
		* mod: for giving authority
		*/
	char fName[100], nName[100];
	char buf[1024] = {0x00,};
	int cpy, tar, log_;
	int mod = 0777;


	/* 
		* input file name && new name 
		* User can input them either through arguments or strings in running.
		*/
	if(argc == 1) {
		printf("Input the file name: ");
		scanf("%s", fName);
		printf("Input the new name: ");
		scanf("%s", nName);
	}
	else {
		strcpy(fName, argv[1]);
		strcpy(nName, argv[2]);
	}


	/* open filestreams */
	cpy = open(fName, O_RDONLY);
	tar = open(nName, O_WRONLY | O_CREAT);
	log_ = open("log.txt", O_WRONLY | O_CREAT);


	/* copy file by buffer && write log.txt */
	while (cpy > 0 && read(cpy, &buf, 1024) > 0) {
		write(tar, &buf, 1024);
	}
	write(log_, &("file copy is done"), 20);
	

	/* close filestream => save to directory */
	close(cpy);
	close(tar);
	close(log_);


	/* give authority to created files */
	chmod(nName, mod);
	chmod("log.txt", mod);


	return 0;
}
