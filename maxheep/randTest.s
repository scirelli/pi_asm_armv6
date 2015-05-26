.LC0:
	.ascii	"%f\012\000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	bl	rand
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	fmsr	s15, r3	         @ moves a ARM register to a VFP single-percision register
	fsitos	s14, s15         @ convert signed integer to floating-point (s) for single-precision
	flds	s15, .L3         @ Floating-point load
	fdivs	s15, s14, s15    @ floating-point divide
	fcvtds	d7, s15          @ Convert single-percision floating-point to double-precision
	ldr	r0, .L3+4
	fmrrd	r2, r3, d7       @ Transfers contents between two single-precision floating-point registers and two ARM registeres
	bl	printf
	ldr	r0, .L3+8
	mvn	r1, #-2147483648
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	1325400064
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
