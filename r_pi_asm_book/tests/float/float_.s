.LC0:
	.ascii	"%f\000"
.text
	.align	2

	.global	main
	.func main
main:
    PUSH {r0-r3,lr}
    LDR r3, .L3
	flds	s15, .L3             @ floating-point load {s} for single percision
	fcvtds	d7, s15              @ floating-point convert double-precision from single-precision
	ldr	r0, .L3+4                @ load the format
	fmrrd	r1, r2, d7           @ From double-percision register to ARM registers. Transfer contents between two ARM registers and double-precision floating-point register
	bl	printf
	mov	r0, #0
    POP {r0-r3,pc}
.L4:
	.align	2
.L3:
	.word	1086324736
	.word	.LC0
