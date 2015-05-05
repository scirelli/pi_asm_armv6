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
	.file	"struct.c"
	.section	.rodata
	.align	2
.LC0:
	.word	1
	.word	2
	.text
	.align	2
	.global	main
	.type	main, %function
main:
                @ args = 0, pretend = 0, frame = 16
                @ frame_needed = 1, uses_anonymous_args = 0
                @ link register save eliminated.
	str	fp, [sp, #-4]!
                @ add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]

	ldr	r2, .L3
	sub	r3, fp, #12
	ldmia	r2, {r0, r1}  @ loads r2 into r0 and r1. Increment ascending
	stmia	r3, {r0, r1}  @ strs r0 and r1 into r3
	mov	r3, #2
    @str r3, [r2]
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]     @ loads #2
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
                                @	str	r3, [fp, #-12]
                                @	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
