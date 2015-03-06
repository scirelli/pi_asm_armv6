@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              read.s                                         │
@│ Read text from the keyboard.                                                │
@└─────────────────────────────────────────────────────────────────────────────┘
.GLOBAL _start

_start:
_read:
    mov r7, #3            @ Syscall number 3. Which is read to file descriptor
    mov r0, #0            @ the file descriptor 0, stdin. 1 stdout, 0 stdin, 2 stderror
    mov r2, #1            @ read first 1 characaters
    ldr r1, =string       @ Load r1 with the address of the string placed at string:
    SWI 0                 @ cause a software interrupt

_toUpper:
    ldr r1, =string       @ address of string:
    ldr r0, [r1]          @ load the first char in r0
    orr r0, r0, #0x20     @ make it upper case
    str r0, [r1]          @ str what's in r0 at location [r1]
_write:
    mov r7, #4            @ syscall number 4. print
    mov r0, #1            @ to Stdout
    mov r2, #1            @ string is 19 characters long
    ldr r1,=string        @ string at string.
    SWI 0

_exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

.data                     @ This informs the assembler that what follows should be treated as a subsection containing data, as apposed to assembly code.
string:
    .ascii "            "
.text                     @ This informs the assembler that what follows is assembly code

@ r0 = determins input stream, 0 for stdin
@ r1 = the address of the buffer for the string of read characters to be placed
@ r2 = the number of chars to be read
@ r7 = the number of the syscall. 3
@
@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ ASCII │ Value │ Binary      │
@├─────────────────────────────┤
@│   A   │ 0x41  │  0100 0001  │ 
@│   a   │ 0x61  │  0110 0001  │
@│ diff  │ 0x20  │  0010 0000  │
@└─────────────────────────────┘
@
@ 0110 0001  a
@ 1001 1110  invert
@ 0010 0000  orr 0x20
@ 1011 1110  invert
@ 0100 0001  A
@
@
@ 0100 0001  A
@ 1101 1111  0x20 invert 0xCF 
@ 0110 0001  XOR = a
@ 
@
@
@
@
@
@
@
@
@
@
@
