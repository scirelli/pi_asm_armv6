@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              add.s                                          │
@│ Test add operations.                                                        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r0, #0
    mov   r1, #1
    mov   r2, #0xFFFFFFFF
    adds  r0, r1, r2
    
    moveq r0, #4          @ Z, zero set?
    movne r0, #5          @ Z, zero not set?
    movvs r0, #6          @ V, Overflow set?
    @movvc r0, #7          @ V, Overflow not set?
    @movcs r0, #8          @ C, Carry set?
    @movcc r0, #9          @ C, Carry not set?
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.
