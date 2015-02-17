/* Use of byte and equ to sum a set of numbers */

	.global _start
_start:

	LDR R1, =values
	LDR R2, =endvalues
	MOV R0, #0

_loop:
	LDRB R3, [R1], #increment
	ADD R0, R0, R3
	CMP R1, R2
	BNE _loop
	
_exit:
	MOV R7, #1
	SWI 0		
	
.data
.equ increment, 1 

values:
	.byte 1,2,3,4,5,6,7,8,9
endvalues:

