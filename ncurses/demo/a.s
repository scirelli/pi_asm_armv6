.LC0:
	.ascii	"o\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-12]
	bl	initscr
	bl	noecho
	mov	r0, #0
	bl	curs_set
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L2
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L3
.L2:
	mvn	r3, #0
.L3:
	str	r3, [fp, #-20]
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L4
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L5
.L4:
	mvn	r3, #0
.L5:
	str	r3, [fp, #-24]
.L9:
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wclear
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r2, .L10+4
	bl	mvprintw
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	ldr	r0, .L10+8
	bl	usleep
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L6
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bge	.L7
.L6:
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
	b	.L9
.L7:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L9
.L11:
	.align	2
.L10:
	.word	stdscr
	.word	.LC0
	.word	30000
