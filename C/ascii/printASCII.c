#include <stdio.h>

int main( int argsc, char* argsv ){
    int i         = 0,
        tableSize = 512;

    for( i=0; i<tableSize; i++ ){
        if( i%4 == 0 ){
            printf("%d: '%c'\n", i, i);
        }else{
            printf("%d: '%c'\t", i, i);
        }
    }

    return 0;
}
