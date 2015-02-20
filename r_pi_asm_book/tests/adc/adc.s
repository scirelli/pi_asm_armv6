@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              adc.s                                          │
@│ Test adc operation. Add with carry. This adds what is in the given          │
@│ registers along with the carry bit.                                         │
@│ This program will add two 64bit numbers. Which requires using two registers │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r2, #0xFFFFFFFF   @ low half of number 1
    mov   r3, #0x1          @ hi half of number 1
    
    mov   r4, #0xFFFFFFFF   @ low half of number 2
    mov   r5, #0xFF         @ hi half of number 2
    
    adds  r0, r2, r4        @ add the two hi halves. Setting the carry bit if there is a carry
    adcs  r1, r3, r5        @ add the two hi halves along with the carry bit from the previous instruction. Setting the carry flag if there is a carry.

exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.
