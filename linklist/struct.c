#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int x;
    int y;
} point;

int main( int argc, char *argv[] ){
    point p = { 1, 2 };
    int *p_int;

    p.x = 2;
    p.x = p.x - p.y;
    
    p_int = (int*)malloc(sizeof(int));

    return p.x;
}
