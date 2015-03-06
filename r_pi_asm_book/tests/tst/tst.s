@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   tst.s                                                     │
@│ Test the tst instruction                                                    │
@└─────────────────────────────────────────────────────────────────────────────┘  

.GLOBAL _start

_start:
    mov r0, #0
    mov r1, #0
    tst r0,r1    @ beforms a logical AND. Updating the zero flag. Tests if a particular bit is set
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
