#include <ncurses.h>

int main(int argc, char *argv[])
{
	initscr();			/* Start curses mode 		*/
	cbreak();			/* Line buffering disabled, Pass on
					 * everty thing to me 		*/
	keypad(stdscr, TRUE);		/* I need that nifty F1 	*/

    box(stdscr,0,0);
	refresh();
		
	endwin();			/* End curses mode		  */
	return 0;
}
