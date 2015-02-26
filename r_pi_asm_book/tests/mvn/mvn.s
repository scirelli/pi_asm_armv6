@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              mvn.s                                          │
@│ Test mvn operation. This is move negate. It negates the number on move.     │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r0, #0
    mvn   r1, #0x09
    add   r1, r1, #0x01 @ r1 = -9
    mov   r0, r1

    add   r0, r1, #0x09
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

@  0000 1001  @ 0x09
@! 1111 0110
@+ 0000 0001
@= 1111 0111  @-9 or 247
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
