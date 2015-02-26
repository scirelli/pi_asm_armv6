@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              mul.s                                          │
@│ Test mul operation.                                                         │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r0, #1
    mov   r1, #0x09
    mov   r2, #0x08
    mla   r0, r1, r2, r0
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.
