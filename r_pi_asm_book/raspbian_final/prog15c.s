 /**** Use post-indexed addr to concat strings ****/
/*                                               */
	.global _start
_start:
	LDR R2, =string1	@ load locations
	LDR R3, =string2	@ of both strings
_loop:
	LDRB R0, [R3], #1	@ Get string2 byte & +1
 	CMP R0, #0		@ is it end of string?
	BNE _loop		@ no, then get next byte
	SUB R3, R3, #1		@ Yes, decrement back 1	
		
_copyloop:
	LDRB R0, [R2], #1	@ get byte from string 1
	STRB R0, [R3], #1	@ add to end of string 2
	CMP R0, #0		@ is it 0?
	BNE _copyloop		@ if not get next char	
	
_write:
	MOV R0, #1		@ is 0 so print new
	LDR R1, =string2
	MOV R2, #24
	MOV R7, #4
	SWI 0

_exit:
	MOV R7, #1
	SWI 0

.data
string1:
	.asciz "ABCDEFGHIJKL"
string2:
	.asciz "012345678910"
padding:
	.ascii "            "                    

