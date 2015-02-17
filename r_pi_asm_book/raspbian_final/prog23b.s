/*** Using LEN and STRIDE to sum vectors ***/
	
	.global	main
	.func main
main:

	SUB SP, SP, #24		@ room for printf
	
	LDR R1, addr_value1	@ Get addr of values
	LDR R2, addr_value2
	LDR R3, addr_value3
	LDR R4, addr_value4
	LDR R5, addr_value5

	VLDR S16, [R1]		@ load values into
	VLDR S18, [R1]		@ registers
	VLDR S20, [R1]
	VLDR S22, [R1]
	VLDR S24, [R2]
	VLDR S26, [R3]
	VLDR S28, [R4]
	VLDR S30, [R5]

lenstride:
/* Set LEN=4 0b101 and STRIDE=2 0b11 */
	VMRS R3, FPSCR		@ get current FPSCR
	MOV R4,  #0b11011    @ bit pattern
	MOV R4, R4, LSL #16	@ move across to b21
	ORR R3, R3, R4		@ keep all 1's
	VMSR FPSCR, R3		@ transfer to FPSCR

	VADD.F32 S10, S16, S24	@ Vector addition

convert:
/* Do conversion for printing, making sure not */
/* to corrupt Sx registers by over writing     */

	VCVT.F64.F32 D0, S10	
	VCVT.F64.F32 D1, S12	
	VCVT.F64.F32 D2, S14	
	VCVT.F64.F32 D3, S8
	LDR R0, =string		@ set up for printf
	VMOV R2, R3, D0
	VSTR D1, [SP] 		@ push data on stack
	VSTR D2, [SP, #8]
	VSTR D3, [SP, #16]
	BL	printf
	ADD SP, SP, #24		@ restore stack

_exit:	
	MOV R0, #0
	MOV R7, #1
	SWI 0

addr_value1:	.word value1
addr_value2:	.word value2
addr_value3:	.word value3
addr_value4:	.word value4
addr_value5:	.word value5

	.data
value1:	.float 1.0
value2:	.float 1.25
value3:	.float 1.50
value4: .float 1.75
value5:	.float 2.0

string:	.asciz " S10 is %f\n S12 is %f\n S14 is %f\n S8 is %f\n"





