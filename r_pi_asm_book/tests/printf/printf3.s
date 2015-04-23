@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             printf3.s                                       │
@│ Use GCC to compile and link a program that uses libc. Use more than three   │
@│ parameters to printf                                                        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main

main:
    PUSH {lr}          @ use a pseudo directive to ppreserver link register
    LDR  r0, =string

    MOV  r1, #1        @ params to the function.
    MOV  r2, #2 
    MOV  r3, #3 

    LDR  r7, =value1
    LDR  r8, [r7]       @ load the 4th value
    PUSH {r8}

    LDR  r7, =value2
    LDR  r8, [r7]       @ load the 5th value
    PUSH {r8}

    LDR  r7, =value3
    LDR  r8, [r7]       @ load the 5th value
    PUSH {r8}
    
    MOV  r8, #seven
    PUSH {r8}

    BL   printf        @ call to libc printf
    ADD  sp, sp, #16
    POP  {pc}
_exit:
    MOV pc, lr         @ another way to exit


.data

string: .asciz "Values are: %d, %d, %d and %d.\n"
value1: .word 4
value2: .word 5
value3: .word 6

.EQU seven, 7
