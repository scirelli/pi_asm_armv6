@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   Ssuffix.s                                                 │
@│ Test the 'S' suffix which updates the Status Register.                      │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov  r0, #2
    mov  r1, #1
    subs r0, r0, r1
    BEQ  try1
    BNE  try2
try1:
    mov r0, #2
    b   end
try2:
    mov r0, #3

end:
    mov  r7, #1      @ exit through syscall
    SWI  0
