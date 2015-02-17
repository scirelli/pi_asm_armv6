#include <sys/stat.h>
#include <stdio.h>

void main()
{
int status = mkdir("tempdir", 0511);
	if (status != 0) {
		printf ("mkdir failed!\n");
	}
}

