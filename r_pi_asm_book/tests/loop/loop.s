@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              loop.s                                         │
@│ Practice looping                                                            │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r0, #1
loop:
    add r0, r0, #1    @ increment count
    cmp r0, #50        @ Compare with  limit
    ble loop          @ branch <=

    mov   r0, #50
loopfaster:
    subs r0, r0, #1
    bne loopfaster     @ Loop if not zero

exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.
