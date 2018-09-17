#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	int fd;
	const char *file_name = NULL;

	if (argc < 2) {
		write(1, "usage: pa0 <src>\n", 17);
		return 1;
	} else {
		file_name = argv[1];
	}

	fd = open(file_name, O_RDONLY);

	/* write your own c code */

	close(fd);
	return 0;
}
