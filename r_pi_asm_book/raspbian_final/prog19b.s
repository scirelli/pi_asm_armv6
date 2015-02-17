/****  Printing a string using libc and ****/
/****  passing parameters to function   ****/
/****  for use in printf               ****/
 
	.global main
	.func main
main:
	PUSH {LR}	@ use pseudo directive
	LDR R0, =string	@ R0 points to string
	MOV R1, #10	@ first value in R1
	MOV R2, #15	@ second value in R2
	MOV R3, #25	@ result in R3
	BL printf	@ Call libc
	POP {PC}	@ restore PC with pseudo

_exit:
	MOV PC, LR       @ simple exit

.data
string:
	.asciz "If you add %d and %d you get %d.\n"

