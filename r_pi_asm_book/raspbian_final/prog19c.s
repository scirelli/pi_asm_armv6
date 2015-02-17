/******  Reading a number using scanf    *****/
/******  via registers and the stack     *****/
 
	.global main
	.func main
main:
	PUSH {LR}
	SUB SP, SP, #4		@ Make room on stack
	LDR R0, addr_format	@ get addr of format
	MOV R1, SP		@ place SP in R1 and
	BL scanf		@ store entry on stack
	LDR R2, [SP]
	LDR R3, addr_number
	STR R2, [R3]
	ADD SP, SP, #4
	POP {PC}		@ restore PC

 _exit:
 	MOV PC, LR       	@ simple exit

/* as scanf needs addresses of strings we */ 
/* assemble them in the text area         */

addr_format:	.word scanformat
addr_number:	.word number

 	.data
number:		.word 0
scanformat:	.asciz "%d"

