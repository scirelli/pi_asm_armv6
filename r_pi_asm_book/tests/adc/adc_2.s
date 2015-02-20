@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              adc.s                                          │
@│ Test adc operation. Add with carry. This adds what is in the given          │
@│ registers along with the carry bit.                                         │
@│ This program will add two 96bit numbers. Which requires using three register│
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov   r2, #0xFFFFFFFF   @ lower 3rd of number 1
    mov   r3, #0xFFFFFFFF   @ mid 3rd of number 1
    mov   r4, #0x1          @ hi 3rd of number 1
    
    mov   r5, #0xFFFFFFFF   @ lower 3rd of number 2
    mov   r6, #0xFFFFFFFF   @ mid 3rd of number 2
    mov   r7, #0xFF         @ hi 3rd of number 2
    
    adds  r0, r2, r5
    adcs  r1, r3, r6
    adcs  r8, r4, r7
exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

@ Lower 3rd
@ r2 + r5     = 1111 1111 1111 1111 1111 1111 1111 1111
@             + 1111 1111 1111 1111 1111 1111 1111 1111
@             = 0000 0000 0000 0000 0000 0000 0000 0000 c=1 @ Caused a carry
@ Mid 3rd
@ r3 + r6 + c = 1111 1111 1111 1111 1111 1111 1111 1111
@             + 1111 1111 1111 1111 1111 1111 1111 1111
@             = 0000 0000 0000 0000 0000 0000 0000 0000 c=1 @ Caused a carry
@             + 0000 0000 0000 0000 0000 0000 0000 0001     @ add the previous carry
@             = 0000 0000 0000 0000 0000 0000 0000 0001
@ Hi 3rd
@ r4 + r7 + c = 0000 0000 0000 0000 0000 0000 0000 0001
@             + 0000 0000 0000 0000 0000 0000 1111 1111
@             = 0000 0000 0000 0000 0000 0001 0000 0000
@             + 0000 0000 0000 0000 0000 0000 0000 0001     @ add the previous carry
@             = 0000 0000 0000 0000 0000 0001 0000 0001

@Final number = 0x00000101 00000001 00000000 
