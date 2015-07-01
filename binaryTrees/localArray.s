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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"localArray.c"
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	mov	r8, r0
	ldr	r6, .L5
	sub	sp, sp, #60
	add	r5, sp, #4
	ldmia	r6!, {r0, r1, r2, r3}
	mov	ip, sp
	add	r7, sp, #52
	mov	r4, #0
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	ldr	r6, [r6, #0]
	stmia	r5!, {r0, r1, r2, r3}
	str	r6, [r5, #0]
.L2:
	ldr	r3, [ip, #4]!
	add	r3, r8, r3
	cmp	ip, r7
	add	r4, r4, r3
	bne	.L2
	mov	r0, r4
	add	sp, sp, #60
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	func, .-func
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r7, r0
	ldr	r5, .L10
	sub	sp, sp, #60
	add	r4, sp, #4
	ldmia	r5!, {r0, r1, r2, r3}
	mov	ip, sp
	add	r6, sp, #52
	mov	lr, #0
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	r5, [r5, #0]
	stmia	r4!, {r0, r1, r2, r3}
	str	r5, [r4, #0]
.L8:
	ldr	r3, [ip, #4]!
	add	r3, r7, r3
	cmp	ip, r6
	add	lr, lr, r3
	bne	.L8
	mov	r1, lr
	ldr	r0, .L10+4
	bl	printf
	mov	r0, #0
	add	sp, sp, #60
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LC1
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
.LC0:
	.word	15
	.word	3
	.word	7
	.word	1
	.word	7
	.word	0
	.word	8
	.word	5
	.word	44
	.word	16
	.word	34
	.word	67
	.word	23
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"%d\000"
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
