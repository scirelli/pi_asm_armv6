@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             printf2.s                                       │
@│ Use GCC to compile and link a program that uses libc.                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    PUSH {lr}          @ use a pseudo directive to push on to a stack
    LDR  r0, =string
    MOV  r1, #10       @ params to the function.
    MOV  r2, #15
    MOV  r3, #25
    BL   printf        @ call to libc printf
    POP  {pc}
_exit:
    MOV pc, lr         @ another way to exit

.data

string:
    .asciz "If you add %d and %d you get %d.\n"
