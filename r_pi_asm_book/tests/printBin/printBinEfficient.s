@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   printBin                                                  │
@│ Prints a number in binary                                                   │
@└─────────────────────────────────────────────────────────────────────────────┘  

.GLOBAL _start

_start:
    mov r6, #251         @ The number to print is in r6
                         @ 0000 0000 0000 0000 0000 0000 1111 1011
    mov r10, #1          @ setup the mask
    mov r9,r10, LSL #31  @ logical shift left the value in r10 and store it in r9
                         @ 1000 0000 0000 0000 0000 0000 0000 0000
    ldr r1, =string      @ r1 has the address of teh string buffer

_bits:
    tst   r6, r9           @ tst/and number, mask
                           @ z flag = 1
    moveq r0, #48          @ ASCII '0'
    movne r0, #49          @ ASII '1'
    str   r0, [r1]         @ store '1' in teh string for printing
    mov   r8, r6           @ presever the number we want to print
    bl    _write            @ branch with a link to the next instruction. Branch to _write to write a '1' to console
    mov   r6, r8           @ move teh preserved number back into r6    
    movs  r9, r9, lsr #1  @ logical shift right r9 by 1. Set flags on move. So if we shift off the right most end the zero flag will be set
    bne   _bits            @ branch if z flag is not set (0)

_exit:
    mov r7, #1           @ sys exit code
    SWI 0

_write:
    mov r0, #1           @ stdout file decriptor
    mov r2, #1           @ number of chars to write
    mov r7, #4           @ sys call code, write to file
@   mov r1, =string      @ never changed so don't need this line
    SWI 0
    mov pc, lr           @ move link register valule into the program counter

.data
string: .ascii " "
