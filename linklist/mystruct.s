.DATA
node:
    .WORD 0
    .WORD 0
p_head:
    .WORD 0
.TEXT
.ALIGN 2
.GLOBAL main
.FUNC main

main:
    STMFD sp!, {r4-r12,LR}      @ Store registerst that need to be preserved including the link reg.
    
    MOV r0, #1
    LDR r1, =node
    STR r0, [r1]

    MOV r0, #2
    STR r0, [r1,#4]
    
    MOV r0, #4                  @ size of block, 4 bytes
    BL  malloc
    LDR r1, =p_head
    STR r0, [r1]
    MOV r0, #5
    STR r0, [r1] 
    LDR r2, [r1]
exit:
    LDMFD sp!, {r4-r12,LR}      @ Restore the registers and link reg.
    MOV PC, LR
