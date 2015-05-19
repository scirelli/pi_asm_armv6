#include <stdio.h>

int main( int argc, char *argv[] ){
    int cnt = 0;
    char *param = argv[cnt];

    while( cnt < 10 && param )
    {
        printf("%d", cnt );
        cnt++;
        param = argv[cnt];
    }
}
