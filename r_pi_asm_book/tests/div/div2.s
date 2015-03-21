@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              div.s                                          │
@│ Test a division algorithm.                                                  │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
                         @ 30/9  30 dividend, 9 divisor = quotient 3.333
    mov   r1, #30        @ Dividend is in r1.
    mov   r2, #9         @ Divisor is in r2. 
                         @ At the end r3 will hold the quotient, r1 the remainder, and r2 the original divisor
    mov   r4, r2         @ Put the divisor in R4
                         @ r4 = 9
    cmp   r4, r1, lsr #1 @ Divide r1 by 2
                         @ 0001 1110
                         @ 0000 1111
                         @ r4=9; r1=30/2
                         @ 9 - 15
                         @ = -6 carry clear, zero clear
div1:
    movls r4, r4, lsl #1 @ if r4 <= r1/2 then r4 = 2*r4. Carry clear or zero set
                         @    then r4 = 18
                         @ r4 = 18
    cmp   r4, r1, lsr #1 @  r4 - r1
                         @  18 - 15 = 3  
                         @ carry set, zero is clear
    bls   div1           @ is carry clear, is zero set
    mov   r3, #0         @ Initialize the quotient
                         @ r1=30
                         @ r2=9
                         @ r3=0
                         @ r4=18
div2:
    cmp   r1, r4         @ can we subtract r4?
                         @ 30 - 18 = 12  carry 1, zero is clear
                         @    12-9=3
    subcs r1, r1, r4     @ if we can, do so. In subtraction the carry is set when there is no carry
                         @ r1=12
                         @   r1=3
    adc   r3, r3, r3     @ doublt quotient, add new bit
                         @ r3 + r3 + carry
                         @ 0 + 0 + 1 = 1
                         @ r3=1
                         @ 1 + 1 + 1 = 3
                         @   r3=3
    mov   r4, r4, lsr #1 @ Halve r4
                         @ r4 = 18/2 = 9
                         @ r4=9
                         @   r4=4
    cmp   r4, r2         @ Loop until we've gone past the original divisor
                         @ r4 - r2
                         @ 9 - 9 = 0
    bhs   div2           @ branch high or same >= unsigned
                         @ carry set? 
                         @ zero set? yes
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

@ 
@ 
@ 
@ 
@ 
@ 1111 1111 1111 1111 1111 1111 1111 1010 
@
@ 0000 0110
@ 1111 1001
@ 0000 0001
@ 1111 1010
@
@   3   
@  _______
@ 9|30
@   27
@   ___
@    3
@
@
@
@
@
@
