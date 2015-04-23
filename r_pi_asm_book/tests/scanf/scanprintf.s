@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             scanprintf.s                                    │
@│ Use GCC to compile and link a program that uses libc.                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    PUSH {lr}
    SUB SP, SP, #4     @ Make room on the stack
    LDR r0, =messagein
    BL printf
    LDR r0, =scanformat
    MOV r1, SP
    BL scanf
    LDR r1, [SP]
    LDR r0, =messageout
    BL printf
    ADD sp, sp, #4
    POP {PC}
_exit:
    MOV pc, lr         @ another way to exit

addr_messin: .word messagein
addr_format: .word scanformat
addr_messout: .word messageout

.data

messagein: .asciz "Enter your number: "
scanformat: .asciz "%d"
messageout: .asciz "Your number was 0x%X\n"
