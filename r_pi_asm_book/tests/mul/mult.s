	.text
	.align	2
	.global	main
main:
	mvn	r3, #2          @ !2 = -3
	mul	r3, r0, r3

	mov	r0, #0
	ldmfd	sp!, {fp}
	bx	lr

@ 0010  @ 2
@ 1101  @

@ 0011
@ 1100
@ 0001
@ 1101
