#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] )
{
   char s = argv[1][0];
   int c = (short int)s;
   int i = 0;
   int q = 0;

   for( ; i<c; i++ ){
       q = c%i;
   }
   return 0;
}
