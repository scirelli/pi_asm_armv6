@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                          movblock.s                                         │
@│ Test moving blocks of memory.                                               │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    LDR r0, =start
    LDR r1, =end
    LDR r2, =dest
_blockcopy:
    LDMIA r0!, {r3-r4}
    STMIA r2!, {r3-r4}
    CMP r0, r1
    BNE _blockcopy
_exit:
    MOV r7, #1
    SWI 0

.data
start:
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
end:
    .word 0
    .word 0
dest:
    .word 0
    .word 0
