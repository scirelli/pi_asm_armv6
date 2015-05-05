#include <stdio.h>

typedef struct {
    int x;
    int y;
} point;

int main( int argc, char *argv[] ){
    point p = { 1, 2 };

    p.x = 2;
    p.x = p.x - p.y;

    return p.x;
}
