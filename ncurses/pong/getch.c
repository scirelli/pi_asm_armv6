#include <ncurses.h>

int main(){
    int ch;

    initscr();          /* Start curses mode        */
    raw();              /* Line buffering disabled  */
    keypad(stdscr, TRUE);       /* We get F1, F2 etc..      */
    noecho();           /* Don't echo() while we do getch */
    
    while(1){
        printw("Type any character to see it in bold\n");
        ch = getch();
        printf("%c = %d", ch, ch);             

        if(ch == KEY_F(1)){
            endwin();           /* End curses mode        */
            return 0;
        }
        refresh();          /* Print it on to the real screen */
        getch();            /* Wait for user input */
        printw("\n");
    }
    return 0;
}
