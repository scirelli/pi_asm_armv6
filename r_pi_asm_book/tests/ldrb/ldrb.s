@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              div.s                                          │
@│ Test a division algorithm.                                                  │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    LDR r1, =string     @1st string address
    LDR r3, =numbers    @2nd string address
    MOV r2, #26         @chars in teh strings
_loop:
    LDRB r0, [r1,r2]    @get byte r1+r2
    STRB r0, [r3,r2]    @ save byte in r3 + r2
    SUBS r2, #1         @ decrement and set flags
    BPL _loop           @ loop while positive or zero

_write:
    mov r0, #1           @ stdout file decriptor
    LDR r1, =numbers
    mov r2, #26
    mov r7, #4           @ sys call code, write to file
    SWI 0

.data
string: .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ\0" 
numbers: .ascii "01234567891011121314151617\0"

.text
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.
