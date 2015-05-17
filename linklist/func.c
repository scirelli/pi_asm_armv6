#include <stdio.h>

int testFunc( int i, int g )
{
    return i+g;
}
int main( int argc, char *argv )
{
    int b;
    b = testFunc( 0, 1 );
    return 0;
}
