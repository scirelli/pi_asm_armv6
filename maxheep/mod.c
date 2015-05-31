#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] ){
    unsigned int big = 123%50;
    unsigned int i=0;
    for( i=0; i<100; i++ ){
        big = i%50;
        printf("%d", big);
    }
    return 0;
}
