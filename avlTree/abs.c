#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main( int argc, char* argv[] )
{
    int v;           // we want to find the absolute value of v
    unsigned int r;  // the result goes here 
    v=10;
    //                         4           8
    int const mask = v >> sizeof(int) * CHAR_BIT - 1;
    r = (v + mask) ^ mask;
    
    printf("%d\n", CHAR_BIT);
    printf("%d\n", sizeof(int));
    printf("%d\n", r);
    return 0;
}
