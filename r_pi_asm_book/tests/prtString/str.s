@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              str.s                                          │
@│ Print a string to stdout.                                                   │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
    mov r7, #4            @ Syscall number 4. Which is write to file descriptor
    mov r0, #1            @ the file descriptor 1, stdout. 1 stdout, 0 stdin, 2 stderror
    mov r2, #11           @ char length of the string
@   mov r3, #0x000000A0
@   mov r4, #0x61
@   str r4, [r3, #4]
    ldr r1, =string2      @ string located at string:

    SWI 0                 @ cause a software interrupt

_exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

.data                     @ This informs the assembler that what follows should be treated as a subsection containing data, as apposed to assembly code.
string:
    .ascii "Hello World String\n" @ 19 chars
string2:
    .ascii "Hello Steve"          @ 11 chars

.text                     @ This informs the assembler that what follows is assembly code

@ r0 = determins output stream, 1 for stdout
@ r1 = the address of the string of characters
@ r2 = the number of characters to be written
@ r7 = the number of the syscall.
@
@
@
@
@
@
@
