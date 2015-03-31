@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                             stack.s                                         │
@│ play with statcks!                                                          │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    LDR r0, =start
    LDR r1, =dest
_pushdata:
    LDMIA r0,  {r2-r8}    @ increment after
    STMFD sp!, {r2-r8}    @ Full descending

    LDMIA r1,  {r2-r8}
    STMFD sp!, {r2-r8}
_popdata:
    LDMFD sp!, {r2-r8}    @ 
    STMIA r0,  {r2-r8}

_exit:
    MOV r7, #1
    SWI 0

.data
start:
    .word 0x00000001
    .word 0x00000002
    .word 0x00000003
    .word 0x00000004
    .word 0x00000005
    .word 0x00000006
    .word 0x00000007
dest:
    .word 0x00000008
    .word 0x00000009
    .word 0x0000000A
    .word 0x0000000B 
    .word 0x0000000C
    .word 0x0000000D
    .word 0x0000000E
