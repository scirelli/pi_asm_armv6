/** Printing a string using printf **/
/** and passing parameters to it   **/
/** via registers and the stack   **/
 
	.global main
	.func main
main:
	PUSH {LR}		@ use pseudo directive
	LDR R0, =string		@ R0 points to string
	MOV R1, #1		@ first value in R1
	MOV R2, #2		@ second value in R2
	MOV R3, #3		@ result in R3
	LDR R7,=value1		@ get address of param
	LDR R8, [R7]		@ load value1 into R8
	PUSH {R8}		@ put on stack
	LDR R7,=value2		@ repeat for value2
	LDR R8, [R7]
	PUSH {R8}
	LDR R7,=value3		@ repeat for value3
	LDR R8, [R7]
	PUSH {R8}
	BL printf		@ Call libc
	ADD SP, SP, #12		@ balance stack
	POP {PC}		@ restore PC

_exit:
	MOV PC, LR		@ simple exit

	.data
string:	.asciz "Values are: %d, %d, %d and %d\n"
value1:	.word 4
value2:	.word 5
value3: .word 6

