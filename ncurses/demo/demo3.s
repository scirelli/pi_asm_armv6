	.section	.rodata
	.align	2
.LC0:
	.ascii	"(%d,%d)\000"
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
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]

	bl	initscr
	bl	noecho
	mov	r0, #0
	bl	curs_set

	ldr	r3, .L7
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L2

	ldr	r3, .L7
	ldr	r3, [r3, #0]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L3
.L2:
	mvn	r3, #0

.L3:
	str	r3, [fp, #-8]
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L4

	ldr	r3, .L7
	ldr	r3, [r3, #0]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L5

.L4:
	mvn	r3, #0

.L5:
	str	r3, [fp, #-12]
	bl	endwin

	ldr	r0, .L7+4
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	bl	printf

	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L8:
	.align	2
.L7:
	.word	stdscr
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
