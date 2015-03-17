@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              div.s                                          │
@│ Test a division algorithm.                                                  │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
                         @ 3/4  3 dividend, 4 divisor = quotient .75
    mov   r1, #3         @ Dividend is in r1.
    mov   r2, #4         @ Divisor is in r2. 
                         @ At the end r3 will hold the quotient, r1 the remainder, and r2 the original divisor
    mov   r4, r2         @ Put the divisor in R4
    cmp   r4, r1, lsr #1 @ Then double it until 2 * r4 > divisor
div1:
    movls r4, r4, lsl #1 @
    cmp   r4, r1, lsr #1 @
    bls   div1
    mov   r3, #0         @ Initialize the quotient
div2:
    cmp   r1, r4         @ can we subtract r4?
    subcs r1, r1, r4     @ if we can, do so
    adc   r3, r3, r3     @ doublt quotient, add new bit
    mov   r4, r4, lsr #1 @ Halve r4
    cmp   r4, r2         @ Loop until we've gone past the original divisor
    bhs   div2           @ branch high or save >= unsigned

    mov   r6, r3         @ quotient
    mov   r6, r1         @ remainder
print:                   @ r6 should be number to print
                         @ need to preserve these r0 r1 r2 r6 r7 r8 r9 r10
    @mov r6, #251         @ The number to print is in r6
                         @ 0000 0000 0000 0000 0000 0000 1111 1011
    mov r10, #1          @ setup the mask
    mov r9,r10, LSL #31  @ logical shift left the value in r10 and store it in r9
                         @ 1000 0000 0000 0000 0000 0000 0000 0000
    ldr r1, =string      @ r1 has the address of teh string buffer

_bits:
    tst   r6, r9           @ tst/and number, mask
                           @ z flag = 1
    moveq r0, #48          @ ASCII '0'
    movne r0, #49          @ ASII '1'
    str   r0, [r1]         @ store '1' in teh string for printing
    mov   r8, r6           @ presever the number we want to print
    bl    _write           @ branch with a link to the next instruction. Branch to _write to write a '1' to console
    mov   r6, r8           @ move teh preserved number back into r6    
    movs  r9, r9, lsr #1   @ logical shift right r9 by 1. Set flags on move. So if we shift off the right most end the zero flag will be set
    bne   _bits            @ branch if z flag is not set (0)
    mov   r0, #10
    str   r0, [r1]
    bl    _write
    b     exit

_write:
    mov r0, #1           @ stdout file decriptor
    mov r2, #1           @ number of chars to write
    mov r7, #4           @ sys call code, write to file
@   mov r1, =string      @ never changed so don't need this line
    SWI 0
    mov pc, lr           @ move link register value into the program counter

.data
string: .ascii " "

.text
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

@   0.75
@  ______
@ 4|3.00
@   0
@   30
@   28
@    20
@    20
@
@
@
@
@
@
