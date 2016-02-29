	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d,%d,%X,%d\000"
	.text
	.align	2
	.global	steve
	.type	steve, %function
steve:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r3, [fp, #-20]
	mov	r3, r2
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	str	r2, [sp, #0]
	ldr	r0, .L3
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.align	2
	.global	main
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]

	mov	r0, #0
	mov	r1, #0
	mov	r2, #43
	mov	r3, #5
	bl	steve

	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wgetch
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L8:
	.align	2
.L7:
	.word	stdscr
	.size	main, .-main
