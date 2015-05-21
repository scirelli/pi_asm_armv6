#include<stdio.h>

int main( int argc, char *argv[] ){
    int x = 0;
    x = add( 1 );
    printf("%d", x);
    return 0;
}

int add( int i ){
    int x=0;
    
    for( x=0; x<i; x++ ){
       x += i + x;
    }

    if( i <= 10 ){
        x += add( i + 1);
    }
    return x;
}
