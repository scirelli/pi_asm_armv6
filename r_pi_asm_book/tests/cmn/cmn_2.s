@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              cmn.s                                          │
@│ Test cmn operations. In this program I use cmn which does an ADDS operation │
@│ but disregards the answer, only setting the Status Flag Register.           │
@│ Here cmn adds 1 and -2 if r1 is taken as a negative number using 2's complem│
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    cmn  r0, #0

    moveq r0, #1
    movne r0, #2
end:
    mov  r7, #1          @ exit through syscall
    SWI  0

@ 0000 0000  @0
@ 1111 1111  @!0
@         
@ ccccc ccc 
@  1111 1111
@+ 0000 0001
@  0000 0000
