	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"func.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r0, #1
	bl	add
	str	r0, [fp, #-8]
	ldr	r0, .L3
	ldr	r1, [fp, #-8]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	main, .-main
	.align	2
	.global	add
	.type	add, %function
add:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [fp, #-16]
	cmp	r3, #10
	bgt	.L8
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	mov	r0, r3
	bl	add
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	add, .-add
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
