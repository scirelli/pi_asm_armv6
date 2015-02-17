/**   Printing a string using libc   **/
/**   entry requirements change      **/
/**   and string must end with 0     **/
/**   when using printf function     **/

	.global main
	.func main
main:

	STMFD SP!, {LR}		@ save LR
	LDR R0, =string		@ R0 points to string
	BL printf		@ Call libc
	LDMFD SP!, {PC}	 	@ restore PC

_exit:
	MOV PC, LR       	@ simple exit
.data
string:
	.asciz "Hello World String\n"

values:
	.byte 1,2,3,4,5,6,7,8,9
endvalues:

