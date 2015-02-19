@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              cmn.s                                          │
@│ Test cmn operations. In this program I use cmn which does an ADDS operation │
@│ but disregards the answer, only setting the Status Flag Register.           │
@│ Here cmn adds 1 and -2 if r1 is taken as a negative number using 2's complem│
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov  r0, #0x00000001 @ #<number> can only be a byte (8bits)
    mov  r1, #0x7FFFFFFE @ -2 if you use two's compliment.
    cmn  r0, r1          @ The CMN instruction adds the value of Operand2 to the value in Rn. This is the same as an ADDS instruction, except that the result is discarded.
                         @ In certain circumstances, the assembler can substitute CMN for CMP, or CMP for CMN. Be aware of this when reading disassembly listings. See Instruction substitution for details.
    bmi  negativeflagset @ Branch if negative flag is set
    bpl  notnegative     @ bpl - branch if pl (positive or zero) not negative. Brnach if negative flag is not set
    b    end
negativeflagset:
    mov  r0, #0          @ Set the exit code of this program to 0
    b    end
notnegative:
    add   r0, r0, r1     @ Set the exit code to the result of the subtraction.
    @mvn   r0, r0         @ mov not. Move the inverted rhs to to the lhs
    @add   r0, r0, #1

end:
    mov  r7, #1          @ For some reason required or u get a segmanet fault
    SWI  0

@ Two's compiment with 8bits
@  r0 = 0000 0001 @ #1
@  r1 = 1000 0010 @ #0x7E
@  r1 = 0111 1101 @ negate it
@     + 0000 0001 @ add 1
@     = 0111 1110 @ twos complement
@  r0 + (-r1) = 0000 0001
@             + 0111 1110
@             = 0111 1111
@             = 127
@             = 1000 0000 
@             + 0000 0001 
@             = 1000 0001 @ two's complement
@             = -1

@ Two's compiment with 32 bits
@ 1000 0000 0000 0000 0000 0000 0000 0010    @ -2
@ 0111 1111 1111 1111 1111 1111 1111 1101    @ invet
@ 0000 0000 0000 0000 0000 0000 0000 0001    @ +1 
@ 0111 1111 1111 1111 1111 1111 1111 1110    @ 0x7FFFFFFE = two's compliment 
@ 0000 0000 0000 0000 0000 0000 0000 0001    @ Now that we have -2 in two's compliment add 1 to it, the add opperation we want to do. 1 + -2
@ 0111 1111 1111 1111 1111 1111 1111 1111    @ 0x7FFFFFFF the asnwer.
@ 1000 0000 0000 0000 0000 0000 0000 0000    @ invert. two's compliment the answer to get it represented in signed form
@ 0000 0000 0000 0000 0000 0000 0000 0001    @ +1
@ 1000 0000 0000 0000 0000 0000 0000 0001    @ -1 as the asnwer
