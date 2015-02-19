@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              bmi.s                                          │
@│ Test bmi and bpl operations.                                                │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov  r0, #1          @ #<number> can only be a byte (8bits)
    mov  r1, #2
    cmp  r0, r1          @ does a notational subtraction. Taking r1 from r2. If the result is negative the N flag of the Status register is set to 1
                         @ The CMP instruction subtracts the value of Operand2 from the value in Rn. This is the same as a SUBS instruction, except that the result is discarded. 
    bmi  negativeflagset @ Branch if negative flag is set
    bpl  notnegative     @ bpl - branch if pl (positive or zero) not negative. Brnach if negative flag is not set
    b    end
negativeflagset:
    mov  r0, #34         @ Set the exit code of this program to 0
    b    end
notnegative:
    sub  r0, r0, r1      @ Set the exit code to the result of the subtraction.

end:
    mov  r7, #1          @ For some reason required or u get a segmanet fault
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

