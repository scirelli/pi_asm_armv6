/**** Use pre-indexed addr to move chars ****/
/*                                          */

	.global _start
_start:
	
	LDR R1, =string		@ Get 1st string location
	LDR R3, =numbers	@ Get 2nd string location 
	MOV R2, #26		@ chars in alphabet
	
_loop:
	LDRB R0, [R1, R2]	@ get byte at R1+R2
	STRB R0, [R3, R2]	@ save byte to R3+R2
	SUBS R2, R2, #1		@ decrement and flag set
	BPL _loop		@ and loop while positive
	
_write:
	MOV R0, #1
	LDR R1, =numbers
	MOV R2, #26
	MOV R7, #4
	SWI 0

_exit:
	MOV R7, #1
	SWI 0

.data
string:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers:
	.ascii "01234567891011121314151617"

