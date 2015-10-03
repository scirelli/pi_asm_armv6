#include <ncurses.h>
//#include <unistd.h>

#define DELAY 30000

int main(int argc, char *argv[]) {
    int max_y = 0, max_x = 0;

    initscr();
    noecho();
    curs_set(FALSE);

    // Global var `stdscr` is created by the call to `initscr()`
    getmaxyx(stdscr, max_y, max_x);
    endwin();
    printf("(%d,%d)", max_x,max_y);
}
