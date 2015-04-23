@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             scanf.s                                         │
@│ Use GCC to compile and link a program that uses libc.                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    PUSH {lr}
    SUB SP, SP, #4     @ Make room on the stack
    LDR r0, =scanformat
    MOV r1, sp
    BL scanf
    LDR r2, [sp]
    LDR r3, =number
    STR r2, [r3]
    ADD sp, sp, #4
    POP {PC}
_exit:
    MOV pc, lr         @ another way to exit

addr_format: .word scanformat
addr_number: .word number

.data

number: .word 0
scanformat: .asciz "%d"
