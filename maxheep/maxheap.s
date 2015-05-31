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

    LDR r0, =array
    MOV r1, #arraySz
    BL array_fill
    LDR r0, =array
    MOV r1, #0
    MOV r2, #8
    MOV r3, #4
    BL array_ofWrdSwap
    LDR r0, =array
    MOV r1, #arraySz
    BL array_print
.Lend:
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
.Lright_end:
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
.Lleft_end:
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
    BEQ .Lparent_end

    SUB r0, r0, #1 
    LSR r0, #1                       @ (i-1)/2
.Lparent_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ maxHeapify()                                    │
@│ param(r0): The array to heappify.               │
@│ param(r1): Index of the tree to heapfiy.        │
@│ param(r2): Length of the array.                 │
@│ param(r3): Size of an element in the array.     │
@│ return: index of the parent.                    │
@└─────────────────────────────────────────────────┘  
.FUNC maxHeapify
maxHeapify:
    STMFD sp!, {r4-r8,lr}

    MOV r5, r0
    MOV r0, r1
    BL  left
    MOV r6, r0              @ lft

    MOV r0, r1
    BL right
    MOV r7, r0              @ rght

    CMP r6, r2              @ lft >= a.length
    BHS .LmaxHeapify_end
    CMP r6, #0              @ lft < 0
    BLO .LmaxHeapify_end
    
    CMP r7, r2              @ rght >= a.length
    BHS .LmaxHeapify_end
    CMP r7, 0               @ rght < 0
    BLO .LmaxHeapify_end

.LmaxHeapify_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r8,pc}
.ENDFUNC
