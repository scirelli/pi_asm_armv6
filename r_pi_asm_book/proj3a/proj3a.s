@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                                 Proj3a                                      │
@│ First assembler program from the R Pi assembly book.                        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov r0, #65
    mov r7, #1
    swi 0        @Supervisor call exceptoin. 24-bit bitfield encoded in instruction. SVC currently.
