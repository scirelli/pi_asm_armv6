.LC0:
	.asciz	"Num=%d\tDen=%d\tQuo=%d\tMod=%d\n"
.LC1:
	.asciz	"Mod=%d\n"
loopCnt=5
.text
.align	2

.GLOBAL	main
.FUNC main
main:
	stmfd	sp!, {lr}

    i    .req r7    @ map register equates 
    j    .req r8
    num  .req r0 
    den  .req r1 
    mod  .req r2

    MOV i, #loopCnt
    MOV j, #loopCnt

    .Lloop:
        MOV  num, j
        MOV  den, i    
        BL idiv

        LDR r0, =.LC1
        BL printf

        SUBS j, j, #1
        BNE .Lloop
    MOV j, #loopCnt
    SUBS i, i, #1
    BNE .Lloop

    @UDIV r3, r1, r2        @  100/50 = 2
    @MLS  r1, r2, r3,  r1   @  100 - 50*(2) = 0
ldmfd	sp!, {pc}
