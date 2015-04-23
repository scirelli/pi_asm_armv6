.GLOBAL main
.func main
main:
    PUSH {lr}
    MOV r7, #1
    POP {LR}
_exit:
    MOV r7, #1
    SWI 0
