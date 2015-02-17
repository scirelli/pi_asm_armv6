/* Printing a floating point number */
	
	.global main
	.func main
main:
	
	LDR R1, addr_value1	@ Get addr of value1
	VLDR S14, [R1]		@ Move value1 into S14
	VCVT.F64.F32 D5, S14	@ Convert to B64

	LDR R0, =string		@ point R0 to string
	VMOV R2, R3, D5		@ Load value
	BL printf		@ call function
	
	MOV R7, #1		@ Exit Syscall
	SWI 0

addr_value1:  
	.word value1

	.data
value1:	.float 1.54321
string:	.asciz "Floating point value is: %f\n"

