/*---------------------------------------------------------------------------*\

    Project   : ARM Divide Emulation
    Author    : Henry Thomas <http://henri.net>
    Creation  : 12/7/2005
    Copyright 2005 Henry Thomas

\*---------------------------------------------------------------------------*/
.GLOBAL	div
.FUNC div
div:
    num     .req r0     @ map register equates 
    den     .req r1 
    mod     .req r2 
    cnt     .req r3 
    sign    .req r12 

    cmp den, #0                    @ exceptioin if den == zero 
    beq .div0 

    eor sign, num, den             @ sign = num ^ den 
    rsbmi den, den, #0             @ den = -den if den < 0 

    subs mod, den, #1              @ mod = den - 1 
    beq .div1                      @ return if den == 1 

    movs cnt, num                  @ num = -num if num < 0 
    rsbmi num, num, #0 

    cmp num, den                   @ return if num <= den 
    bls .numLeDen 

    tst den, mod                   @ if(den & (den - 1) == 0) 
    beq .powerOf2                  @ den is power of 2 

    clz mod, den 
    clz cnt, num 
    sub mod, mod, cnt 
    rsbs cnt, mod, #31 
    rsb mod, cnt, #32 
    mov mod, num, lsr mod 
    mov num, num, lsl cnt 
    rsb den, den, #0               @ negate den for divide loop 
    adds num, num, num             @ start: num = mod:num / den 
    add cnt, cnt, cnt, lsl #1      @ cnt *= 3  
    add pc, pc, cnt, lsl #2        @ skip cnt iterations 
    nop                            @ nop instruction to take care of pipelining 

    .rept 32                       @ inner loop x 32 
        adcs mod, den, mod, lsl #1 
        subcc mod, mod, den 
        adcs num, num, num 
    .endr 

    cmp sign, #0                   @ negate quotient if sign < 0 
    rsblt num, num, #0 
    bx lr

.div0: 
    mov num, #0 
    bx lr

.div1: 
    cmp sign, #0; 
    rsbmi num, num, #0 
    bx lr

.numLeDen: 
    mov num, #0                    @ quotient = 0 if num < den 
    moveq num, sign, asr #31       @ negate quotient if sign < 0 
    orreq num, num, #1             @ quotient = 1 if num == den 
    bx lr


.powerOf2: 
    clz cnt, den                   @ count bits in den 
    rsb cnt, cnt, #31 

    mov num, num, lsr cnt          @ num >>= cnt 
    cmp sign, #0;
    rsbmi num, num, #0             @ negate quotient if sign < 0
    bx lr
.ENDFUNC


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ mod()                                           │
@│ param(r0): Dividend/numerator.                  │
@│ param(r1): Divisor/denominator.                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL	mod
.FUNC mod
mod:
	STMFD	sp!, {r4,r5,lr}
    numr .req r4; denn .req r5

    MOV numr, r0
    MOV denn, r1

    BL div
    
    MUL r0, denn, r0
    SUB r0, numr, r0

@ ─────────────────────────────────────────────────
LDMFD sp!, {r4,r5,lr}
BX lr
.ENDFUNC

@###################################################
@                 MACROS                           #
@###################################################
.MACRO MAX $p0, $p1, $p2
    CMP   \$p1, \$p2
    MOVLE \$p0, \$p2
    MOVGT \$p0, \$p1
.ENDM

.MACRO ABS $p0, $p1                          @ http://graphics.stanford.edu/~seander/bithacks.html#IntegerAbs
    MOV   \$p0, \$p1, ASR #31                @ int v;           // we want to find the absolute value of v
    ADD   \$p1, \$p1, \$p0                   @ unsigned int r;  // the result goes here 
    EOR   \$p0, \$p0, \$p1                   @                            4            8
.ENDM                                        @ int const mask = v >> sizeof(int) * CHAR_BIT - 1;
                                             @ r = (v + mask) ^ mask;                                        

.MACRO ZERO $p0
    MOV   \$p0, #0
.ENDM

.MACRO HALF $p0
    MOV   \$p0, \$p0, LSR  #1
.ENDM

.MACRO SHALF $p0
    MOV \$p0, \$p0, ASR  #1
.ENDM
@##################################################
