#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
	int cpy = open(argv[1], O_RDONLY);
	int tar = open(argv[2], O_WRONLY | O_CREAT);
	char wd;

	while(cpy>0 && read(cpy, &wd, 1)>0) {
		write(tar, &wd, 1);
	}
	close(cpy);
	close(tar);
	return 0;
}

