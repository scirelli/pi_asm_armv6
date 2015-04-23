@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             float.s                                         │
@│ Test floating point numbers and print them                                  │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    PUSH {lr}
    
    MRC p15, 0, r0, c1, c2, 2   @ r0 = Access Control Register
    ORR r0, #0xF00000  @ Enale Single & Double Precision
    MCR p15, 0, r0, c1, c0, 2   @ Access control register = r0
    MOV r0, #0x40000000          @ r0 = enable VFP
    FMXR fpexc, r0              @ FPEXC = r0

    LDR r1, =value1    @
    VLDR s14, [r1]         @ Move the float to register s14
    VCVT.F64.F32 d5, s14   @ Convert the float to a double for printf
    LDR r0, =string        @
    VMOV r2, r3, d5        @ load d5 into registers r3 and r2. d5 is a double (2 words)
    BL printf              @ call printf
    POP {PC}
_exit:
    MOV r7, #1
    SWI 0

addr_format: .word value1

.data

value1: .float 1.54321
string: .asciz "Floating point value is: %f\n"
