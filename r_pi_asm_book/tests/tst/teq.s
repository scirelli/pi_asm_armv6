@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   teq.s                                                     │
@│ Test the teq instruction                                                    │
@└─────────────────────────────────────────────────────────────────────────────┘  

.GLOBAL _start

_start:
    mov r0, #0x80
    mov r1, #129 @ 
    teq r0,r1    @ performs an EOR. test if r0 is eq to r1
    beq _true
    bne _false

_true:
    mov r0, #1
    b _end
_false:
    mov r0, #0
    b _end

_end:
    mov  r7, #1          @ exit through syscall
    SWI 0
