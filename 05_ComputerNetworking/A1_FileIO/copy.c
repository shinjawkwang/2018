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
		* buf: buffer that is used when copying
		* cpy, tar, log_: file streams
		* mod: for giving authority
		* buf_size: size of buffer; dynamically changed by file size
		* file_info: for check file size
		* pos: position of bit, used when reading & writing
		*/
	char fName[100], nName[100];
	char buf[1024] = {0x00, };
	int cpy, tar, log_;
	int mod = 0777;
	int buf_size = 1024;
	struct stat file_info;
	int pos;


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
	if(!strcmp(fName, nName)) {
		printf("ERROR: File name and new name are same.\n");
		return 0;
	}


	/* check if file exist, and determine buf_size */
	if (stat(fName, &file_info) < 0) {
		printf("ERROR: File doesn't exist.\n");
		return 0;
	}
	else {
		if(file_info.st_size < 128) {
			buf_size = 8 * file_info.st_size;
		}
	}


	/* open filestreams */
	cpy = open(fName, O_RDONLY);
	tar = open(nName, O_WRONLY | O_CREAT);
	log_ = open("log.txt", O_WRONLY | O_CREAT);


	/* copy file by buffer && write log.txt */
	pos = read(cpy, buf, buf_size);
	while (pos > 0) {
		write(tar, buf, pos);
		pos = read(cpy, buf, buf_size);
	}
	write(log_, "file copy is done", 17);
	

	/* close filestream => save to directory */
	close(cpy);
	close(tar);
	close(log_);


	/* give authority to created files */
	chmod(nName, mod);
	chmod("log.txt", mod);


	return 0;
}
