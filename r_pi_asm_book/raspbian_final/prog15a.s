/**** using the ADR directive ****/                                           

	.global _start
_start:
	ADR R0, value
	MOV R1, #15

_Exit:
	MOV R7, #1
	SWI 0

value:
	.word 255


