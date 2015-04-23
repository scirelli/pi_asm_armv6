	.global	main
	.func	main
main:
    PUSH {lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [r1, #8]
	bl	puts
	mov	r0, #0 
	sub	sp, fp, #4
    POP {lr}
