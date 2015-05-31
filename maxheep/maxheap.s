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
.TEXT
.ALIGN 2

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
@.GLOBAL main
@.FUNC main
@main:
@    STMFD sp!, {r4-r12,lr}
@
@    LDR r0, =arrayTest
@    MOV r1, #arraySz
@    BL array_print
@
@    LDR r0, =arrayTest
@    MOV r1, #arraySz
@    MOV r2, #4
@    BL buildMaxHeap
@
@    LDR r0, =arrayTest
@    MOV r1, #arraySz
@    BL array_print
@.Lend:
@ ─────────────────────────────────────────────────
@    LDMFD sp!, {r4-r12,lr}
@    BX lr
@.ENDFUNC

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
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC maxHeapify
maxHeapify:
    STMFD sp!, {r4-r12,lr}
                            @ Move params out of temp space
    MOV r5, r0              @ r5 array
    MOV r6, r1              @ r6 Index of root
    MOV r7, r2              @ r7 Length of array
    MOV r8, r3              @ r8 size of element

.Ltest_left:
                            @ Get the left child index
    MOV r0, r6
    BL  left
    MOV r9, r0              @ lft
                            @Check to make sure it's with in the array bounds
    CMP r9, r7              @ lft >= a.length
    BHS .Ltest_right
    CMP r9, #0              @ lft < 0
    BLO .Ltest_right
                            @ Compare the elements to see which is larger 
    MUL r0, r9, r8          @ lft*elementSz
    LDR r0, [r5,r0]         @ value in lft
    MUL r1, r6, r8          @ root_index*elementSz
    LDR r1, [r5,r1]         @ value in root
    CMP r0, r1              @ lft_value > root_value
    BLO .Ltest_right        @ lft_value < root_value skip
                            @ Params for array_swap
        MOV r0, r5          @ ptr_array
        MOV r1, r9          @ lft_index
        MOV r2, r6          @ root_index
        MOV r3, r8          @ elementSz
        BL array_swap
                            @ Params for maxHeapify
        MOV r0, r5          @ ptr_array
        MOV r1, r9          @ left_index
        MOV r2, r7          @ length of array
        MOV r3, r8          @ elementSz
        BL maxHeapify

.Ltest_right:
                            @ Get the right child's index
    MOV r0, r6
    BL right
    MOV r10, r0             @ rght
                            @Check to make sure it's with in the array bounds
    CMP r10, r7             @ rght >= a.length
    BHS .LmaxHeapify_end
    CMP r10, #0              @ rght < 0
    BLO .LmaxHeapify_end

    MUL r0, r10, r8         @ rght*elementSz
    LDR r0, [r5,r0]         @ value in rght 
    MUL r1, r6, r8          @ root_index*elementSz
    LDR r1, [r5,r1]         @ value in root
    CMP r0, r1              @ rght_value > root_value
    BLO .LmaxHeapify_end    @ rght_value < root_value skip
        MOV r0, r5
        MOV r1, r10
        MOV r2, r6
        MOV r3, r8
        BL array_swap
                            @ Params for maxHeapify
        MOV r0, r5
        MOV r1, r10         @ rght_index
        MOV r2, r7
        MOV r3, r8
        BL maxHeapify
.LmaxHeapify_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ buildMaxHeap()                                  │
@│ param(r0): The array to heapify.                │
@│ param(r1): Length of the array.                 │
@│ param(r2): Size of an element in the array.     │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL buildMaxHeap
.FUNC buildMaxHeap
buildMaxHeap:
    STMFD sp!, {r4-r6,lr}

    MOV r4, r1, LSR #1    @ r4 is loop counter. a.length/2
    SUB r4, r4, #1        @ a.length/2 - 1
    MOV r5, r1            @ r5 length or array
    MOV r6, r2            @ r6 elementSz
    MOV r7, r0            @ store array_ptr in r7 for func call
    .LbuildMaxHeap_loop:
        MOV r0, r7
        MOV r1, r4
        MOV r2, r5
        MOV r3, r6
        BL maxHeapify
        SUBS r4, r4, #1
    BPL .LbuildMaxHeap_loop
.LbuildMaxHeap_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
.ENDFUNC
