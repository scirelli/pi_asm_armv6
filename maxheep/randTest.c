#include <time.h>
#include <stdlib.h>
#include <stdio.h>

int main( int argc, char *argv[] )
{
    srand(time(NULL));
    int r = rand();
    float f = (float)r/(float)RAND_MAX;
    printf("%f\n", f);
    printf("%d", RAND_MAX);
    return 0;
}
