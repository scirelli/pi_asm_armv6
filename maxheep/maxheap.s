@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                     maxheap.s                                               │
@│ Playing witih maxheaps.                                                     │
@│ Heap sort                                                                   │
@│ Heap represented in an array                                                │
@│ root of tree is first element in the array (i=0)                            │
@│ parent(i) = floor( (i-1)/2 )                                                │
@│ left(i) = 2i + 1                                                            │
@│ right(i) = 2i + 2                                                           │
@│   0   1  2  3  4  5  6  7  8                                                │
@│ [ 15, 3, 7, 1, 7, 0, 8, 5, 44 ]                                             │
@│                                                                             │
@│                           ( )0                                              │
@│                     ( )1        ( )2                                        │
@│                ( )3     ( )4 ( )5   ( )6                                    │
@│            ( )7   ( )8                                                      │
@│                                                                             │
@│  Max Heap                                                                   │
@│  The key of a node is >= the keys of it's children.                         │
@│                                                                             │
@│  Min Heap                                                                   │ 
@│  The key of a node is <= the keys of it's children.                         │
@│                                                                             │ 
@└─────────────────────────────────────────────────────────────────────────────┘  
@ array is 10 integeers, int is 4 bytes. 4*10
.DATA
arraySz=10
array: .SKIP 40 
s_digit: .asciz "%d\n\r"
.TEXT
.ALIGN 2

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}

    LDR r0, =array
    MOV r1, #arraySz
    BL array_fill_random

    LDR r0, =array
    MOV r1, #arraySz
    BL array_print

    MOV r0, #2                      @ Test right
    BL right
    MOV r1, r0
    LDR r0, =s_digit
    BL printf

    MOV r0, #2                      @ Test left
    BL left
    MOV r1, r0
    LDR r0, =s_digit
    BL printf

    MOV r0, #2                      @ Test  parent
    BL parent
    MOV r1, r0
    LDR r0, =s_digit
    BL printf
end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ right()                                         │
@│ param(r0): node index to get the right child of.│
@│ return: index of the right child.               │
@└─────────────────────────────────────────────────┘  
.FUNC right
right:
    STMFD sp!, {lr}
    MOV r1, #2
    ADD r0, r1, r0, LSL #1            @ 2*i+2
right_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ left()                                          │
@│ param(r0): node index to get the left child of. │
@│ return: index of the left child.                │
@└─────────────────────────────────────────────────┘  
.FUNC left
left:
    STMFD sp!, {lr}
    MOV r1, #1
    ADD r0, r1, r0, LSL #1            @ 2*i+1
left_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ parent()                                        │
@│ param(r0): node index to get the parent of.     │
@│ return: index of the parent.                    │
@└─────────────────────────────────────────────────┘  
.FUNC parent
parent:
    STMFD sp!, {lr}

    CMP r0, #0
    BEQ parent_end

    SUB r0, r0, #1 
    LSR r0, #1                       @ (i-1)/2

parent_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC
