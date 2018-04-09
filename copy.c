#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
char buffer[2048];
int version = 1;
int copy(int, int);
int main(int argc, char *argv[])
{
	int fdold, fdnew;
	if (argc != 3)
	{
		printf("Need 2 arguments to copy program\n");
		exit(1);
	}
	fdold = open(argv[1], O_RDONLY);	/*open as read only*/
	if (fdold == -1)
	{
		printf("Cannot open file %s\n", argv[1]);
		exit(1);
	}

	fdnew = creat(argv[2], 0666);	/*rw*/
	if (fdnew == 1)
	{
		printf("cannot create file %s\n", argv[2]);
		exit(1);
	}
	copy(fdold, fdnew);
	return 0;
}

int copy(int old, int new)
{
	int count;
	while ((count == read(old, buffer, sizeof(buffer))) > 0)
		write(new, buffer, count);
}
