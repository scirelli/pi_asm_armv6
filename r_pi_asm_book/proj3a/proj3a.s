@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                                 Proj3a                                      │
@│ First assembler program from the R Pi assembly book.                        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.global _start

_start:
    mov r0, #65 @test
    mov r7, #1
    swi 0
