@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    main.s                                                   │
@│ Main for binary trees.                                                      │
@│   0   1  2  3  4  5  6  7  8   9   10  11  12                               │
@│ [ 15, 3, 7, 1, 7, 0, 8, 5, 44, 16, 34, 67, 23 ]                             │
@│                                                                             │
@│                              (15)                                           │
@│                      (3)               (44)                                 │
@│                (1)         (7)      ( )    ( )                              │
@│            (0)    ( )    (7)  (8)                                           │
@│                       (5)                                                   │
@│                                                                             │
@│                           ( )0                                              │
@│                     ( )1        ( )2                                        │
@│                ( )3     ( )4 ( )5   ( )6                                    │
@│            ( )7   ( )8                                                      │
@└─────────────────────────────────────────────────────────────────────────────┘
.section	.rodata
testData:
    .word 15
    .word 3 
    .word 7 
    .word 1
    .word 7 
    .word 0
    .word 8
    .word 5
    .word 44
    .word 16
    .word 34
    .word 67
    .word 23
testDataSz:
    .word 13
arrayBuffer: .SKIP 13*4
sNodeHeight: .asciz "Node height: %d\n"
sNodeWeight: .asciz "Node Weight: %d\n"
.ALIGN 4
.TEXT

NODE_RIGHT=0
NODE_LEFT=4
NODE_DATA=8
NODE_HEIGHT=12
NODE_SIZE=16
NULL=0

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}

    BL testInsert
    MOV r4, r0
    BL testMinSort
    MOV r0, r4
    BL testMaxSort

    BL testNodeHeight

    BL testNodeWeight
.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testInsert()                                    │
@│ param(r0):                                      │
@│ return: Root node of the tree.                  │
@└─────────────────────────────────────────────────┘  
.FUNC testInsert
testInsert:
    STMFD sp!, {r4-r12,lr}

    LDR r5, =testData

    LDR r0, [r5] 
    BL node_createWithValue
    MOV r4, r0
    
    LDR r6, =testDataSz
    LDR r6, [r6]
    MOV r7, #1                       @ Start from 1 because we used the first value when creating the root node.
    B .LforCondCheck
    .LforLoop:
        MOV r0, r4
        LDR r1, [r5, r7, LSL #2] 
        BL avlTree_insert
        ADD r7, r7, #1
    .LforCondCheck:
    CMP r7, r6
    BLO .LforLoop

.LtestInsert_end:
    MOV r0, r4
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testMinSort()                                   │
@│ param(r0): rootNode of the tree.                │
@└─────────────────────────────────────────────────┘  
.FUNC testMinSort
testMinSort:
    STMFD sp!, {r4-r12,lr}
    MOV fp, sp
    SUB sp, sp, #56                             @ Make room for the buffer
    
    MOV r1, sp 
    MOV r2, #13
    MOV r3, #0
    BL avlTree_minSort
    
    MOV r0, sp
    MOV r1, #13
    BL array_print

    MOV sp, fp                                  @ Reset the stack pointer
    MOV r0, #0
.LtestMinSort_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testMaxSort()                                   │
@│ param(r0): rootNode of the tree.                │
@└─────────────────────────────────────────────────┘  
.FUNC testMaxSort
testMaxSort:
    STMFD sp!, {r4-r12,lr}
    MOV fp, sp
    SUB sp, sp, #56                             @ Make room for the buffer
    
    MOV r1, sp 
    MOV r2, #13
    MOV r3, #0
    BL avlTree_maxSort

    MOV r0, sp
    MOV r1, #13
    BL array_print

    MOV sp, fp                                  @ Reset the stack pointer
    MOV r0, #0
.LtestMaxSort_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testNodeHeight()                                │
@└─────────────────────────────────────────────────┘  
.FUNC testNodeHeight
testNodeHeight:
    STMFD sp!, {fp,lr}           @ Keep the stack 8byte aligned
    MOV fp, sp                   @ l,r,d,h
    SUB sp, #48                  @ Make room on the stack for 3 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │       │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │       │
        @├───────┤<- sp-4              ├───────┤
        @│  FP   │                     │       │
        @├───────┤<- sp-8   ^sp+40     ├───────┤
        @│ Node1 │                     │       │
        @├───────┤<- sp-24  ^sp+24     ├───────┤
        @│ Node2 │                     │       │
        @├───────┤<- sp-40  ^sp+18     ├───────┤
        @│ Node3 │                     │       │
        @├───────┤<- sp-56  ^sp+8      ├───────┤
        @│       │                     │       │

    MOV r0, sp                   @ Get a ptr to Node3

    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node2
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node2 as right node of Node3
    MOV r2, #1                   @ Make up a height for Node2
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node2's height
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make sure node left and right are null for Node2
    STR r2, [r1, #NODE_RIGHT]    @ Make sure node left and right are null for Node2
    
    ADD r1, r1,  #NODE_SIZE      @ Get the address of Node1
    STR r1, [r0, #NODE_LEFT]     @ Set Node3's left node to Node1
    MOV r2, #3                   @ Make up a height for Node1
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height of Node3
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make sure Node1's left and right children are null
    STR r2, [r1, #NODE_RIGHT]
    
    BL avlTree_nodeHeight
    MOV r1, r0
    LDR r0, =sNodeHeight
    BL printf

    MOV sp, fp
.LtestNodeHeight_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {fp,lr}
    BX lr
.ENDFUNC
@┌──────┐
@└──────┘

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testNodeWeight()                                │
@└─────────────────────────────────────────────────┘  
.FUNC testNodeWeight
testNodeWeight:
    STMFD sp!, {fp,lr}           @ Keep the stack 8byte aligned
    MOV fp, sp                   @ l,r,d,h
    SUB sp, #48                  @ Make room on the stack for 3 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │       │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │       │
        @├───────┤<- sp-4              ├───────┤
        @│  FP   │                     │       │
        @├───────┤<- sp-8   ^sp+40     ├───────┤
        @│ Node1 │                     │       │
        @├───────┤<- sp-24  ^sp+24     ├───────┤
        @│ Node2 │                     │       │
        @├───────┤<- sp-40  ^sp+18     ├───────┤
        @│ Node3 │                     │       │
        @├───────┤<- sp-56  ^sp+8      ├───────┤
        @│       │                     │       │

    MOV r0, sp                   @ Get a ptr to Node3

    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node2
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node2 as right node of Node3
    MOV r2, #3                   @ Make up a height for Node2
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node2's height
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make sure node left and right are null for Node2
    STR r2, [r1, #NODE_RIGHT]    @ Make sure node left and right are null for Node2
    
    ADD r1, r1,  #NODE_SIZE      @ Get the address of Node1
    STR r1, [r0, #NODE_LEFT]     @ Set Node3's left node to Node1
    MOV r2, #1                   @ Make up a height for Node1
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height of Node3
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make sure Node1's left and right children are null
    STR r2, [r1, #NODE_RIGHT]
    
    BL avlTree_nodeWeight
    MOV r1, r0
    LDR r0, =sNodeWeight
    BL printf

    MOV sp, fp
.LtestNodeWeight_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {fp,lr}
    BX lr
.ENDFUNC
