/* Printing two floating point numbers */
	
	.global	main
	.func main
main:
	SUB SP, SP, #16		@ Make space on stack
	
	LDR R1, addr_value1	@ Get addr of value1
	VLDR S14, [R1]
	VCVT.F64.F32 D0, S14

	LDR R1, addr_value2	@ Get addr of value2
	VLDR S15, [R1]
	VCVT.F64.F32 D1, S15

	LDR R0, =string		@ point R0 to string
	VMOV R2, R3, D0		@ first value
	VSTR D1, [SP]		@ second on stack
	BL printf		
	ADD SP, SP, #16		@ restore stack

	MOV R7, #1		@ Exit Syscall
	SWI 0	


addr_value1:	.word value1
addr_value2:	.word value2

	.data
value1:	.float 1.54321
value2:	.float 5.1
string:	.asciz "The FP values are %f and %f\n"

