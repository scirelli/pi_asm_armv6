	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	initscr
	bl	start_color
	bl	cbreak
	bl	noecho
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #0
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L3
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #43
	mov	r2, #5
	bl	whline
.L3:
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wgetch
	bl	endwin
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	stdscr
