@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              post.s                                         │
@│ Test post-indexed addressing.                                               │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    LDR r2, =string1  @load locations of both strings
    LDR r3, =string2
_loop:                  @ loop to find the end of string2
    LDRB r0, [r3], #1   @ load a byte from the location in r3 then add #1 to it and store it in r3
    CMP r0, #0
    BNE _loop           @ Loop if it's not zero
    SUB r3, r3, #1      @ Go back one chaaracter to overwrite the null char.
_copyloop:              @ Loop to copy string1 to the end of string2
    LDRSB r0, [r2], #1   @ load a byte from the location in r3 then add #1 to it and store it in r
    STRB r0, [r3], #1   @ Store a character at location in r3 then add one to the location in r3 and store it in r3    
    CMP r0, #0
    BNE _copyloop       @ if not zero branch to _copyloop        
_write:
    MOV r0, #1
    LDR r1, =string2
    MOV r2, #24
    MOV r7, #4
    SWI 0
_exit:
    MOV r7, #1
    SWI 0

.data

string1: .asciz "ABCDEFGHIJKL"
string2: .asciz "012345678910"
padding: .ascii "            "
