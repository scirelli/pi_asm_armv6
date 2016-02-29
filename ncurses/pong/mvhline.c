#include <ncurses.h>
int steve( int a, int b, char c, int d ){
    printf( "%d,%d,%X,%d", a, b, c, d );
    return 0;
}

int main(int argc, char *argv[])
{   
    /*
    initscr(); 
    start_color();
    cbreak();     
    noecho();

    mvhline(0, 0, '+', 5);
    refresh();

    getch();
    endwin();
    */
    steve(0, 0, '+', 5);
    getch();
    return 0;
}
