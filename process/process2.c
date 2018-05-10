#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

int main(int argc, char **argv)
{
	int p, i=5;
	p=fork();
	if(p == 0)
		printf("Child process: %d\n", ++i);
	else if(p > 0)
		printf("Parent process: %d\n", i);	
	else
		printf("Error\n");
	return 0;
}

