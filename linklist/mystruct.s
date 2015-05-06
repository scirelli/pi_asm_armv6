.DATA
node:
    .WORD 0
    .WORD 0
.TEXT
.ALIGN 2
.GLOBAL main
.FUNC main

main:
    STMFD sp!, {r4-r12,LR}      @ Store registerst that need to be preserved including the link reg.


exit:
    LDMFD sp!, {r4-r12,LR}      @ Restore the registers and link reg.
    MOV PC, LR
