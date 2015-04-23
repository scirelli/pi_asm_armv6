@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             printf.s                                        │
@│ Use GCC to compile and link a program that uses libc.                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    STMFD sp!, {lr}    @ save the link register
    LDR   r0, =string  @ point to the string
    BL printf          @ call libc
    LDMFD sp!, {pc}
_exit:
    MOV pc, lr         @ another way to exit

.data

string:
    .asciz "Hello World String\n"
values:
    .byte 1,2,3,4,5,6,7,8,9
endvalues:
