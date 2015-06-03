.LC0: .asciz	"Num=%d\tDen=%d\tQuo=%d\tMod=%d\n"
.LC1: .asciz	"Mod=%d\n"
.LC2: .asciz    "\n\r"
.LC3: .asciz    "Quotient= %d\n"
loopCnt=5
numerator=10
denominator=2
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

    MOV i, #numerator
    MOV j, #denominator

    .Lloop:
        MOV  num, i
        MOV  den, j    
        BL div
        MOV r1, r0
        MOV r4, r0
        LDR r0, =.LC3
        BL printf
        
        @MUL r4, j, r4   @ get the remainder
        @SUB r1, i, r4
        MOV num, i
        MOV den, j
        BL mod
        MOV r1, r0
        LDR r0, =.LC1
        BL printf

        SUBS j, j, #1
        BNE .Lloop
    MOV j, #denominator
    LDR r0, =.LC2
    BL printf
    SUBS i, i, #1
    BNE .Lloop

    @UDIV r3, r1, r2        @  100/50 = 2
    @MLS  r1, r2, r3,  r1   @  100 - 50*(2) = 0
ldmfd	sp!, {pc}
