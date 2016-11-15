//Demo.c
#include <ncurses.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define DELAY 30000
int main( int argc, char *argv[] )
{
    initscr();
    noecho();
    curs_set(FALSE);
    printf("\n'%d'\n", sizeof(ACS_ULCORNER));
    printf("\n'%X'\n", ACS_ULCORNER);
    sleep(1);
    endwin(); //Restore normal terminal behavior
}
