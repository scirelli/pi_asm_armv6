.global _start
/*;┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑*/
/*;│                              TURN ON THE OK/ACT LED                                   │*/
/*;└───────────────────────────────────────────────────────────────────────────────────────┘*/

                       /*;Bit=1, Nibble = 4bits, Byte = 8bits, Halfword = 16bits, Word = 32bits, Doubleword = 64bits*/
                       /*;Raspberry is little endian*/
    _start:            /*;Entry point needs to be labeled _start*/
    ldr r0,=0x20200000 /*;load the 0x20200000 (start address of GPIO pins) into r0. ldr loads the value from memory.*/
                       /*;r0 = 0001 0000 0010 0000 0000 0000 0000 0000*/
    mov r1,#1          /*;Move 1 into r1. mov is faster than ldr because it doesn't involve a memery interaction. mov can only be used on values that are 8bits.*/
    lsl r1,#18         /*;Logical shift left: Enables output to the 16th GPIO pin*/
                       /*;(lsl) moves each bit of a bitstring left by a specified number of bits. Zeros are shifted in at the right end of the bitstring. Bits that are shifted off the left end of the bitstring discarded, except that the last such bit can be produced as a carry output.*/
                       /*;r1 = 0000 0000 0000 0100 0000 0000 0000 0000*/
    str r1,[r0,#4]     /*;store r1 at location [r0,#4], at the address in r0 + #4bytes. str reg, [dest,#val]; dest + val*/
                          
                       /*;┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑*/
                       /*;│                       GPIO PIN LAYOUT                             │*/
                       /*;│ There is a set of 24bytes in the GPIO controller which determine  │*/
                       /*;│ the settings of the GPIO pins. The first 4btyes relate to the     │*/
                       /*;│ first 10 GPIO pins, the second 4 relate to the next 10 and so on. │*/
                       /*;│ There are 54 GPIO pins. Within each 4 byte section, every 3 bits  │*/
                       /*;│ relates to a particular GPIO pin. The OK/ACT LED is the 16th pin. │*/
                       /*;│                                                                   │*/
                       /*;│    ┌── 4 ───┐ ┌─── 3 ──┐┌─── 2 ───┐┌── 1 ───┐  Byte boundaries    │*/
                       /*;│    00 000 000 000 000 000 000 000 000 000 000  0  -  9 GPIO pins  │*/
                       /*;│    00 000 000 000 001 000 000 000 000 000 000  10 - 19            │*/
                       /*;│    00 000 000 000 000 000 000 000 000 000 000  20 - 29            │*/
                       /*;│    00 000 000 000 000 000 000 000 000 000 000  30 - 39            │*/
                       /*;│    00 000 000 000 000 000 000 000 000 000 000  40 - 49            │*/
                       /*;│    00 xxx xxx xxx xxx xxx 000 000 000 000 000  50 - 54            │*/
                       /*;└───────────────────────────────────────────────────────────────────┘*/
    mov r1,#1
    lsl r1,#18
    str r1,[r0,#4]

