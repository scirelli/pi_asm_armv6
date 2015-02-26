@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   subs.s                                                    │
@│ Large number subtraction with a carry                                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov r0, #0x7FFFFFFF   @ low order of first number
    mov r1, #0x0FFFFFFF   @ high order of first number

    mov r2, #0x00FFFFFF   @ low order 2nd number
    mov r3, #0x0000000F   @ high order 2nd number

    subs  r4,r0,r2        @ subs the low order numbers
    subcs r5,r1,r3        @ subc the high order bits

    movcs r0, #15         @ Means there was no carry
    movcc r0, #16         @ Means there was a carry

exit:
    mov r7, #1
    SWI 0
@         c                             c
@  0111 1111 1111 1111 1111 1111 1111 1111 2,147,483,647
@- 0000 0000 1111 1111 1111 1111 1111 1111
@  twos comp
@  1111 1111 0000 0000 0000 0000 0000 0000
@  0000 0000 0000 0000 0000 0000 0000 0001
@  1111 1111 0000 0000 0000 0000 0000 0001
@          0 1111 1111 1111 1111 1111 1110 0x7F000000
@c cccc cccc cccc cccc cccc cccc cccc ccc
@  0111 1111 1111 1111 1111 1111 1111 1111 2,147,483,647
@  1111 1111 0000 0000 0000 0000 0000 0001
@1 1111 1111 0000 0000 0000 0000 0000 0000
@
@
@
@
@
@
@
@
@
@
@
@
@
@
@
@
