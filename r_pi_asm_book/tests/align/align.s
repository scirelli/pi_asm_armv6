@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                               align.s                                       │
@│ play with alignment                                                         │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

.text

    _start:
        LDR r1, =values
        LDR r2, =endvalues
        mov r0, #0
        BAL _loop
    _string:
        .ascii "12345"
    .align 4
    _loop:
        LDRB r3, [r1], #increment @ uses write back to increment address
        ADD r0, r0, r3            @
        CMP r1, r2                @ r1 is the address of values; r2 is the address of endvalues
        BNE _loop
    _exit:
        MOV r7, #1
        SWI 0

.data

    .equ increment, 1
    values:
        .byte 1,2,3,4,5,6,7,8,9
    endvalues:
