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
	.file	"intModTest.c"
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-9]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
