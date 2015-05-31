#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] )
{
    char *str = "%d,";
    char *str2 = "\n\r";
    int i=0;
    for( i=0; i<1000; i++ ){
        printf(str,i);
        if( i%50 == 0 )
        {
            printf(str2);
        }
    }
    return 0;
}
