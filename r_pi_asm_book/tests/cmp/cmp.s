@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              cmp.s                                          │
@│ Test cmp operation. In this program I use cmp which does a SUBS operation   │
@│ but disregards the answer. Only setting the Status Flag Register.           │
@│ Here cmp subs r0 and r1.                                                    │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov  r0, #1         @ #<number> imediate value can only be a byte (8bits)
    mov  r1, #2
    cmp  r0, r1         @ does a notational subtraction. Taking r1 from r2. If the result is 0 the Z flag of the Status register is set to 1
                        @ The CMP instruction subtracts the value of Operand2 from the value in Rn. This is the same as a SUBS instruction, except that the result is discarded.
    beq  zeroflagset    @ Branch if equal
    bne  zeroflagnotset @ Branch if negative
    b    end
zeroflagset:
    mov  r0, #0         @ Set the exit code of this program to 0
    b    end
zeroflagnotset:
    sub  r0, r0, r1     @ Set the exit code to the result of the subtraction.

end:
    mov  r7, #1         @ For some reason required or u get a segmanet fault
    SWI  0


@  r0 = 0000 0001
@  r1 = 0000 0010
@ -r1 = 1111 1101 + 0000 0001 = 1111 1110 @twos complement
@  r0 + (-r1) = 0000 0001
@             + 1111 1110
@             = 1111 1111
@             = 255
@             = 0000 0000 + 0000 0001 = 0000 0001 @ two's complement
@             = -1
