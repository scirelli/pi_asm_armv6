#include <stdio.h>
#include <stdlib.h>

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

int main( int argc, char *argv[] )
{
    int i=0;
    i = MAX(argc, 5);
    return i;
}
