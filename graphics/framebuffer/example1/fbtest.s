	.section	.rodata
	.align	2
.LC0:
	.ascii	"/dev/fb0\000"
	.align	2
.LC1:
	.ascii	"Error: cannot open framebuffer device.\000"
	.align	2
.LC2:
	.ascii	"The framebuffer device opened.\000"
	.align	2
.LC3:
	.ascii	"Error reading variable screen info.\000"
	.align	2
.LC4:
	.ascii	"Display info %dx%d, %d bpp\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4            @ fbfd
	sub	sp, sp, #176          @ fb_var_screeninfo var_info; // 44 words
	str	r0, [fp, #-176]
	str	r1, [fp, #-180]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, .L6
	mov	r1, #2
	bl	open
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L2
	ldr	r0, .L6+4
	bl	puts
	mov	r3, #1
	b	.L5
.L2:
	ldr	r0, .L6+8
	bl	puts
	sub	r3, fp, #168          @ var_info
	ldr	r0, [fp, #-8]         @ fbfd
	mov	r1, #17920            @ FBIOGET_VSCREENINFO
	mov	r2, r3
	bl	ioctl
	mov	r3, r0
	cmp	r3, #0
	beq	.L4
	ldr	r0, .L6+12
	bl	puts
.L4:
	ldr	r1, [fp, #-168]
	ldr	r2, [fp, #-164]
	ldr	r3, [fp, #-144]
	ldr	r0, .L6+16
	bl	printf
	ldr	r0, [fp, #-8]
	bl	close
	mov	r3, #0
.L5:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	main, .-main
