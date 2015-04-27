@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   reverseStr.s                                              │
@│ Reverse a string passed in as param 1                                       │
@└─────────────────────────────────────────────────────────────────────────────┘

.GLOBAL main
.func main

main:
@ r0 has count of params
@ r1 has a char* avgv[]
@     argv[0] has the program's path
@     argv[1] has the user's string

    STMFD sp!, {r4-r12,lr}
    CMP   r0, #2
    BNE   error1
    LDR   r4, [r1,#4]        @ Move up one address, store it in r4
    
    MOV   r5, #0
    STMFD sp!, {r5}          @ end of string maker

reverse:
    LDRB  r5, [r4], #1       @ hi\0
    STMFD sp!, {r5}
    CMP r5, #0               @ Look for the null char
    BNE reverse

    ADD sp, sp, #4           @ skip the null
    LDR   r4, [r1,#4]        @ reset to beginning of the string

writeback:
    LDMFD sp!, {r5}
    STRB r5, [r4], #1
    CMP r5, #0
    BNE writeback

prnt:
    LDR r0, [r1,#4]
    @BL printf
    BAL exit

error1:
   LDR r0, =tomanyparams
   @bl printf

exit:
    LDMFD sp!, {r4-r12,pc}

.data

tomanyparams: .asciz "Program only accepts 1 paramater\n"
formatstr: .asciz "%s"
