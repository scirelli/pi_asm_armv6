.LC0:
	.ascii	"%d\000"
	.text
    .fpu vfp
	.align	2
	.global	main
	.func main
main:
	stmfd	sp!, {fp, lr}

	ldr	r0, =.LC0
    MOV  r1, #100
    MOV  r2, #50     
                           @ 100%50

    UDIV r3, r1, r2        @  100/50 = 2
    MLS  r1, r2, r3,  r1   @  100 - 50*(2) = 0

	bl	printf
ldmfd	sp!, {fp, pc}
