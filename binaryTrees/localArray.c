#include <stdio.h>
#include <stdlib.h>

int func( int c ){
    int b[] = {15, 3, 7, 1, 7, 0, 8, 5, 44, 16, 34, 67, 23};
    int n = 0;
    for( int i=0; i<13; i++){
        n += b[i] + c;
    }
    return n;
}

int main( int argc, char *argv[] )
{
    printf("%d", func(argc));
    return 0;
}
