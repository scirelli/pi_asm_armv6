@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              sub.s                                          │
@│ Test sub operations.                                                        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r0, #0
    mov   r1, #0xFFFFFFF0
    mov   r2, #0xFFFFFFFF
    subs  r0, r1, r2
    
    @moveq r0, #4          @ Z, zero set?
    @movne r0, #5          @ Z, zero not set?
    @movcs r0, #8         @ C, Carry set?
    movcc r0, #9         @ C, Carry not set? For subtraction the carry works in the opposite way. It is set to 0 if there is a carry. Almost like the carry bit is being used during the subtraction. 10 - 9, a 1 is pulled from the 10s column to do the subtraction of 0-9.
    movmi r0, #10        @ N, Negative
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

@ Rules of Binary Subtraction
@ 0 - 0 = 0
@ 0 - 1 = 1, and borrow 1 from the next more significant bit
@ 1 - 0 = 1
@ 1 - 1 = 0

@ Where two's complement comes from http://www.cs.cornell.edu/~tomf/notes/cps104/twoscomp.html#fromtwo
@ To negate a number we subtract that number from 0. -10 = 0 - 10. Carries are -1 from the next highest number
@ Do the same in binary. 0100 1011 = 75
@            
@  11111 111 
@   0000 0000
@ - 0100 1011
@ = 1011 0101
@
@ If we wanted we could go further, but there would be no point. Inside of a computer the result of this computation would be assigned to an eight bit variable, so any bits beyond the eighth would be discarded.
@ With the fact that we'll simply disregard any extra digits in mind, what difference would it make to the end result to have subtracted 01001011 from 100000000 (a one bit followed by 8 zero bits) rather than 0? There is none. If we do that, we wind up with the same result:
@   1 0000 0000
@ -   0100 1011
@ = 0 1011 0101
@
@ In the case of 8-bit numbers, it will answer just as well if we subtract our number from (1 + 11111111) rather than 100000000. 1 + 11111111 = 100000000
@   1111 1111
@ - 0100 1011
@ = 1011 0100
@ + 0000 0001
@ = 1011 0101

@ In binary, when we subtract a number A from a number of all 1 bits, what we're doing is inverting the bits of A. So the subtract operation is the equivalent of inverting the bits of the number. Then, we add one.

@  0111 1111  @ 127
@ +1111 1111  @ -1
@= 10111 1110
