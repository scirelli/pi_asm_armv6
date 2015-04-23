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
	.file	"mkdir_c.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"tempdir\000"
	.align	2
.LC1:
	.ascii	"mkdir failed!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L3
	ldr	r1, .L3+4
	bl	mkdir
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L1
	ldr	r0, .L3+8
	bl	puts
.L1:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	329
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
