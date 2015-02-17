/*** Conditional execution in VFP code ***/
	
	.global	main
	.func main
main:
	
	LDR R1, addr_value1	@ Get addr value1
	VLDR S14, [R1]
	VCVT.F64.F32 D1, S14

	LDR R1, addr_value2	@ Ger addr value 2
	VLDR S15, [R1]
	VCVT.F64.F32 D2, S15

	VCMP.F32 S14, S15	@ Compare S14 and S15
	VMRS APSR_nzcv, FPSCR	@ Copy flag set across
	
	MOVEQ R0, #0	@ If C=1, R0=0
	MOVNE R0, #255	@ If C=0, R0=255
		
	MOV PC, LR

addr_value1:	.word value1
addr_value2:	.word value2

	.data
value1:	.float 1.54321
value2:	.float 5.1



