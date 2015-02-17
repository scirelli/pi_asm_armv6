@ Interworking ARM and Thumb code to call printf   

	.global main
	.func main
	.arm
main:
	ADR R5, thumbstart+1
	BX R5		

	.thumb
thumbstart:
	MOV R0, #9	@ Do 9/3
	MOV R1, #3
	MOV R3, #0
loop:
	ADD R3, #1
	SUB R0, R1
	BGE loop
	SUB R3, #1	@ R2=MOD
	ADD R2, R0, R1	@ R3=DIV
	ADR R5, divprint
	BX  R5

thumbreturn:
@ Continue adding code as required
@ Call ARM functions as and when needed	
	ADR R5, exit
	BX R5	@ Return to exit
		
	.arm		
divprint:	
	LDR R0, =string
	MOV R1, R3	@ DIV in R3
		@ MOD in R2 already
	BL printf
	ADR R5, thumbreturn+1
	BX R5

exit:
	MOV R7, #1
	SWI 0

.data
string:	.asciz "Result of 9/3 is: %d MOD %d\n"

