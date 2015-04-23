.LC0:
	.ascii	"%f\000"
.text
	.align	2

	.global	main
	.func main
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L3	@ float
	flds	s15, .L3             @ floating-point load {s} for single percision
	fcvtds	d7, s15              @ floating-point convert double-precision from single-precision
	ldr	r0, .L3+4                @ load the format
	fmrrd	r2, r3, d7           @ From double-percision register to ARM registers. Transfer contents between two ARM registers and double-precision floating-point register
	bl	printf
	mov	r0, #0
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	1086324736
	.word	.LC0
