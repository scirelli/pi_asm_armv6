@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                              read.s                                         │
@│ Read text from the keyboard.                                                │
@└─────────────────────────────────────────────────────────────────────────────┘  
.GLOBAL _start

_start:
_read:
    mov r7, #3            @ Syscall number 3. Which is read to file descriptor
    mov r0, #0            @ the file descriptor 0, stdin. 1 stdout, 0 stdin, 2 stderror
    mov r2, #5            @ read first 5 characaters
    ldr r1, =string       @ string placed at string:
    SWI 0                 @ cause a software interrupt

_write:
    mov r7, #4            @ syscall number 4. print
    mov r0, #1            @ to Stdout
    mov r2, #19           @ string is 19 characters long
    ldr r1,=string        @ string at string.
    SWI 0

_exit:
    mov   r7, #1          @ exit through syscall
    SWI   0               @ Software Interrupt. Call the Kernal to do some work.

.data                     @ This informs the assembler that what follows should be treated as a subsection containing data, as apposed to assembly code.
string:
    .ascii "Hello World String\n" @ 19 chars
string2:
    .ascii "Hello Steve"          @ 11 chars
.text                     @ This informs the assembler that what follows is assembly code

@ r0 = determins input stream, 0 for stdin
@ r1 = the address of the buffer for the string of read characters to be placed
@ r2 = the number of chars to be read
@ r7 = the number of the syscall. 3
@
@
@
@
@
@
@
