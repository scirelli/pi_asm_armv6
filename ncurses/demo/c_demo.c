//Demo.c
#include <ncurses.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define DELAY 30000
int main( int argc, char *argv[] )
{
    int x=0, y=0, max_x=0,max_y=0;

    initscr();
    noecho();
    curs_set(FALSE);
    getmaxyx(stdscr, max_y, max_x);
    printf("%d", max_x);

    sleep(1);
    endwin(); //Restore normal terminal behavior
}
