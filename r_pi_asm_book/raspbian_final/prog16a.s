/**** Block copy routine ****/
/*                          */
	.global _start
_start:
	LDR R0, =start	@ load locations
	LDR R1, =end	@ of both strings
	LDR R2, =dest	@ addr of destination

_blockcopy:
	LDMIA R0!, {R3-R4}
	STMIA R2!, {R3-R4}
	CMP R0, R1
	BNE _blockcopy	
		
_exit:
	MOV R7, #1
	SWI 0


.section .data
start:
	.word 0xFFFFFFFF
	.word 0xFFFFFFFF
end:
	.word 0
	.word 0
dest:
	.word 0
	.word 0                  

