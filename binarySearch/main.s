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
.balign 4
.data
arrayBuffer: .SKIP 13*4   @ For printing ints 

.section	.rodata
arrayBufferSz: .word 13
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
sNodeHeight: .asciz "Node height: %d\n"
sNodeWeight: .asciz "Node Weight: %d\n"
sNodeValue:  .asciz "Node%d's value is '%d'\n"
sLRNode5:    .asciz "Left rotate Node5.\n"
sRRNode5:    .asciz "Right rotate Node5.\n"
sInOrder:    .asciz "Inorder traversal:\n"
sRtnChar:    .asciz "\n\r"
sTestLR:     .asciz "testLeftRotate()\n"
sTestRR:     .asciz "testRightRotate()\n"
sTestBal:    .asciz "testBalanceRightRotate()\n"
sTestBalL:   .asciz "testBalanceLeftRotate()\n"
sBal:        .asciz "Balance:\n"
sTestIns:    .asciz "Test Insert()\n"
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

    @ BL testInsert
    @ MOV r4, r0
    @ BL testMinSort
    @ MOV r0, r4
    @ BL testMaxSort

    @ BL testNodeHeight

    @ BL testNodeWeight

    @ LDR r0, =sRtnChar
    @ BL printf
    @ LDR r0, =sTestLR
    @ BL printf
    @ BL testLeftRotate

    @ LDR r0, =sRtnChar
    @ BL printf

    @ LDR r0, =sTestRR
    @ BL printf
    @ BL testRightRotate

    @ LDR r0, =sTestBal
    @ BL printf
    @ BL testBalanceRightRotate

    @ LDR r0, =sTestBalL
    @ BL printf
    @ BL testBalanceLeftRotate

    LDR r0, =sTestIns
    BL printf
    BL testInsertAVL
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
    SUB sp, #NODE_SIZE*3         @ Make room on the stack for 3 nodes. 48
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

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testLeftRotate()                                │
@└─────────────────────────────────────────────────┘  
.FUNC testLeftRotate
testLeftRotate:
    STMFD sp!, {r4,r5,fp,lr}     @ Keep the stack 8byte aligned
    MOV fp, sp                   @ l,r,d,h
    SUB sp, #NODE_SIZE*5         @ Make room on the stack for 5 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │ Node4 │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │ Node5 │
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
    @ Tree structure should look like
    @
    @           N5            LR     N4
    @         /    \               /    \
    @        N3    N4             N5    N1
    @             /  \           /  \
    @            N2   N1        N3  N2
    @

    MOV r0, sp                   @ Get a ptr to Node5
    MOV r2, #2
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node5's height
    MOV r2, #5
    STR r2, [r0, #NODE_DATA]     @ Set Node5's data to 5
    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node4
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node4 as right node of Node5

    MOV r2, #1                   @ Set the height for Node4
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node4's height
    MOV r2, #4
    STR r2, [r1, #NODE_DATA]     @ Set Node4's data to 4
    ADD r2, sp,  #NODE_SIZE*3    @ Get the Address of Node2
    STR r2, [r1, #NODE_LEFT]     @ Store it as the left node of Node4
    MOV r3, #NULL
    STR r3, [r2, #NODE_LEFT]     @ Make Node2's left and right node's null
    STR r3, [r2, #NODE_RIGHT]
    STR r3, [r2, #NODE_HEIGHT]   @ Set Node2's height to 0
    MOV r3, #2
    STR r3, [r2, #NODE_DATA]     @ Set Node2's data to 2

    ADD r2, sp,  #NODE_SIZE*4    @ Get the Address of Node1
    STR r2, [r1, #NODE_RIGHT]    @ Store it as the right node of Node4
    MOV r3, #NULL
    STR r3, [r2, #NODE_LEFT]     @ Make Node1's left and right node's null
    STR r3, [r2, #NODE_RIGHT]
    STR r3, [r2, #NODE_HEIGHT]   @ Set Node1's height to 0
    MOV r3, #1                   @ Set Node1's data to 1
    STR r3, [r2, #NODE_DATA]

    ADD r1, r1,  #NODE_SIZE      @ Get the address of Node3
    STR r1, [r0, #NODE_LEFT]     @ Set Node5's left node to Node3
    MOV r2, #NULL                @ Set height for Node3
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height of Node3
    STR r2, [r1, #NODE_LEFT]     @ Make sure Node3's left and right children are null
    STR r2, [r1, #NODE_RIGHT]
    MOV r2, #3                   @ Set Node3's data to 3
    STR r2, [r1, #NODE_DATA]

    BL avlTree_nodeHeight        @ Test to see if we can get Node5's height
    MOV r1, r0
    LDR r0, =sNodeHeight
    BL printf
    
    LDR r0, [sp, #NODE_RIGHT]    @ Test to see if we can get Node4's height
    BL avlTree_nodeHeight
    MOV r1, r0
    LDR r0, =sNodeHeight
    BL printf
    
    MOV r1, sp                   @ Get Node5
    LDR r1, [r1, #NODE_DATA]
    LDR r0, =sLRNode5
    BL printf

    MOV r0, sp                   @ Get Node5
    BL avlTree_leftRotate        @ Left Rotate node5
    MOV r4, r0                   @ Node4 should be the new root. Tmp store Node4
    LDR r2, [r4, #NODE_DATA]     @ r0 should be Node4 now.
    LDR r0, =sNodeValue          
    MOV r1, #4
    BL printf

    LDR r0, [r4, #NODE_RIGHT]    @ Get Node4's right node, Node1
    LDR r2, [r0, #NODE_DATA]     @ r0 should be Node1 now.
    MOV r1, r2
    LDR r0, =sNodeValue
    BL printf

    LDR r0, [r4, #NODE_LEFT]     @ Get Node4's left node, Node5
    LDR r2, [r0, #NODE_DATA]     @ r0 should be Node5 now.
    MOV r1, r2
    LDR r0, =sNodeValue
    BL printf
    
    MOV r0, r4
    LDR r1, =arrayBuffer
    MOV r2, #5
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #5
    BL array_print

    MOV sp, fp
.LendOf_testLeftRotate:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,r5,fp,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testRightRotate()                               │
@└─────────────────────────────────────────────────┘  
.FUNC testRightRotate
testRightRotate:
    STMFD sp!, {r4,r5,fp,lr}     @ Keep the stack 8byte aligned
    MOV fp, sp
    SUB sp, #NODE_SIZE*5         @ Make room on the stack for 5 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │ Node4 │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │ Node5 │
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
    @ Tree structure should look like
    @
    @           N5        RR         N3
    @         /    \               /    \
    @        N3    N4             N2     N5
    @       /  \                        /  \
    @      N2   N1                     N1  N4
    @ 2,3,1,5,4

    MOV r0, sp                   @ Get a ptr to Node5
    MOV r2, #2
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node5's height
    MOV r2, #5
    STR r2, [r0, #NODE_DATA]     @ Set Node5's data to 5
    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node4
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node4 as right node of Node5

    MOV r2, #0                   @ Set the height for Node4
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node4's height
    MOV r2, #4
    STR r2, [r1, #NODE_DATA]     @ Set Node4's data to 4
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make Node4's left and right node's null
    STR r2, [r1, #NODE_RIGHT]

    ADD r1, sp,  #NODE_SIZE*2    @ Get the Address of Node3
    MOV r2, #3
    STR r2, [r1, #NODE_DATA]     @ Set Node3's data to 3
    STR r1, [r0, #NODE_LEFT]     @ Store Node3 as the left node of Node5

    ADD r0, sp,  #NODE_SIZE*3    @ Get the Address of Node2
    STR r0, [r1, #NODE_LEFT]     @ Store Node2 as the left node of Node3
    MOV r2, #2
    STR r2, [r0, #NODE_DATA]
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node2's left and right node's null
    STR r2, [r0, #NODE_RIGHT]
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node2's height to 0

    ADD r0, sp,  #NODE_SIZE*4    @ Get the Address of Node1
    STR r0, [r1, #NODE_RIGHT]    @ Store it as the right node of Node3
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node1's left and right node's null
    STR r2, [r0, #NODE_RIGHT]
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node1's height to 0
    MOV r2, #1                   @ Set Node1's data to 1
    STR r2, [r0, #NODE_DATA]

    LDR r0, =sInOrder
    BL  printf

    MOV r0, sp                   @ Inorder traversal of this new tree before rotation
    LDR r1, =arrayBuffer
    MOV r2, #5
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #5
    BL array_print

    LDR r0, =sRRNode5
    BL  printf

    MOV r0, sp                   @ Get Node5
    BL avlTree_rightRotate       @ Right Rotate node5
    MOV r4, r0                   @ Node4 should be the new root. Tmp store Node4

    LDR r0, =sInOrder
    BL  printf
                                 @ Inorder traversal after rotation.
    MOV r0, r4                   @ Node4 should be the new root. Tmp store Node4
    LDR r1, =arrayBuffer
    MOV r2, #5
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #5
    BL array_print

    MOV sp, fp
.LendOf_testRightRotate:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,r5,fp,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testBalanceRightRotate()                        │
@└─────────────────────────────────────────────────┘  
.FUNC testBalanceRightRotate
testBalanceRightRotate:
    STMFD sp!, {r4,r5,fp,lr}     @ Keep the stack 8byte aligned
    MOV fp, sp
    SUB sp, #NODE_SIZE*6         @ Make room on the stack for 5 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │ Node3 │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │ Node4 │
        @├───────┤<- sp-4              ├───────┤
        @│  FP   │                     │ Node5 │
        @├───────┤<- sp-8   ^sp+40     ├───────┤
        @│ Node0 │                     │       │
        @├───────┤<- sp-24  ^sp+24     ├───────┤
        @│ Node1 │                     │       │
        @├───────┤<- sp-40  ^sp+18     ├───────┤
        @│ Node2 │                     │       │
        @├───────┤<- sp-56  ^sp+8      ├───────┤
        @│       │                     │       │
    @ Tree structure should look like
    @
    @           N5        RR         N3
    @         /    \               /    \
    @        N3    N4             N2     N5
    @       /  \                 /      /  \
    @      N2   N1              N0     N1  N4
    @     /
    @    N0
    @ 2,3,1,5,4

    MOV r0, sp                   @ Get a ptr to Node5
    MOV r2, #3
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node5's height
    MOV r2, #5
    STR r2, [r0, #NODE_DATA]     @ Set Node5's data to 5

    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node4
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node4 as right node of Node5
    MOV r2, #4
    STR r2, [r1, #NODE_DATA]     @ Set Node4's data to 4
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make Node4's left and right node's null
    STR r2, [r1, #NODE_RIGHT]
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node4's height

    ADD r1, sp,  #NODE_SIZE*2    @ Get the Address of Node3
    MOV r2, #3
    STR r2, [r1, #NODE_DATA]     @ Set Node3's data to 3
    STR r1, [r0, #NODE_LEFT]     @ Store Node3 as the left node of Node5
    MOV r2, #2
    STR r2, [r1, #NODE_HEIGHT]   @ Set Node3's height

    ADD r0, sp,  #NODE_SIZE*3    @ Get the Address of Node2
    STR r0, [r1, #NODE_LEFT]     @ Store Node2 as the left node of Node3
    MOV r2, #2
    STR r2, [r0, #NODE_DATA]
    MOV r2, #1
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node2's height to 0
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node2's left and right node's null
    STR r2, [r0, #NODE_RIGHT]

    ADD r0, sp,  #NODE_SIZE*4    @ Get the Address of Node1
    STR r0, [r1, #NODE_RIGHT]    @ Store it as the right node of Node3
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node1's left and right node's null
    STR r2, [r0, #NODE_RIGHT]
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node1's height to 0
    MOV r2, #1                   @ Set Node1's data to 1
    STR r2, [r0, #NODE_DATA]

    ADD r0, sp,  #NODE_SIZE*5    @ Get the Address of Node0
    ADD r1, sp,  #NODE_SIZE*3    @ Get the Address of Node0
    STR r0, [r1, #NODE_LEFT]     @ Store it as the left node of Node2
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node0's left and right node's null
    STR r2, [r0, #NODE_RIGHT]
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node0's height to 0
    STR r2, [r0, #NODE_DATA]

    LDR r0, =sInOrder
    BL  printf

    MOV r0, sp                   @ Inorder traversal of this new tree before rotation
    LDR r1, =arrayBuffer
    MOV r2, #6
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #6
    BL array_print

    LDR r0, =sBal
    BL  printf

    MOV r0, sp                   @ Get Node5
    BL avlTree_balance           @ Right Rotate node5 using balance function
    MOV r4, r0                   @ Node4 should be the new root. Tmp store Node4

    LDR r0, =sInOrder
    BL  printf
                                 @ Inorder traversal after rotation.
    MOV r0, r4                   @ Node4 should be the new root. Tmp store Node4
    LDR r1, =arrayBuffer
    MOV r2, #6
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #6
    BL array_print

    MOV sp, fp
.LendOf_testBalanceRightRotate:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,r5,fp,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testBalanceLeftRotate()                         │
@└─────────────────────────────────────────────────┘  
.FUNC testBalanceLeftRotate
testBalanceLeftRotate:
    STMFD sp!, {r4,r5,fp,lr}     @ Keep the stack 8byte aligned
    MOV fp, sp
    SUB sp, #NODE_SIZE*6         @ Make room on the stack for 5 nodes
                                 @
    @ Build the nodes on the stack
        @┍━━━━━━━┑                     │       │
        @│ Stack │                     │ Node3 │
        @├───────┤<- sp                ├───────┤
        @│  LR   │                     │ Node4 │
        @├───────┤<- sp-4              ├───────┤
        @│  FP   │                     │ Node5 │
        @├───────┤<- sp-8   ^sp+40     ├───────┤
        @│ Node0 │                     │       │
        @├───────┤<- sp-24  ^sp+24     ├───────┤
        @│ Node1 │                     │       │
        @├───────┤<- sp-40  ^sp+18     ├───────┤
        @│ Node2 │                     │       │
        @├───────┤<- sp-56  ^sp+8      ├───────┤
        @│       │                     │       │
    @ Tree structure should look like
    @
    @           N5        LR         N4
    @          /  \                 /  \
    @        N3    N4             N5    N1
    @             /  \           /  \     \
    @            N2   N1        N3  N2     N0
    @                  \                   
    @                   N0
    @ 3,5,2,4,1,0

    MOV r0, sp                   @ Get a ptr to Node5
    MOV r2, #3
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node5's height
    MOV r2, #5
    STR r2, [r0, #NODE_DATA]     @ Set Node5's data to 5

    ADD r1, sp,  #NODE_SIZE*2    @ Get the Address of Node3
    MOV r2, #3
    STR r2, [r1, #NODE_DATA]     @ Set Node3's data to 3
    STR r1, [r0, #NODE_LEFT]     @ Store Node3 as the left node of Node5
    MOV r2, #NULL
    STR r2, [r1, #NODE_HEIGHT]   @ Set Node3's height
    STR r2, [r1, #NODE_LEFT]     @ Make Node4's left and right node's null
    STR r2, [r1, #NODE_RIGHT]

    ADD r1, sp,  #NODE_SIZE      @ Get the location of Node4
    STR r1, [r0, #NODE_RIGHT]    @ Store the address of Node4 as right node of Node5
    MOV r2, #4
    STR r2, [r1, #NODE_DATA]     @ Set Node4's data to 4
    MOV r2, #2
    STR r2, [r1, #NODE_HEIGHT]   @ Store the height into Node4's height

    ADD r0, sp,  #NODE_SIZE*3    @ Get the Address of Node2
    STR r0, [r1, #NODE_LEFT]     @ Store Node2 as the left node of Node4
    MOV r2, #2
    STR r2, [r0, #NODE_DATA]
    MOV r2, #NULL
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node2's height to 0
    STR r2, [r0, #NODE_LEFT]     @ Make Node2's left and right node's null
    STR r2, [r0, #NODE_RIGHT]

    ADD r0, sp,  #NODE_SIZE*4    @ Get the Address of Node1
    STR r0, [r1, #NODE_RIGHT]    @ Store it as the right node of Node4
    MOV r2, #NULL
    STR r2, [r0, #NODE_LEFT]     @ Make Node1's left and right node's null
    STR r2, [r0, #NODE_RIGHT]
    STR r2, [r0, #NODE_HEIGHT]   @ Set Node1's height to 0
    MOV r2, #1                   @ Set Node1's data to 1
    STR r2, [r0, #NODE_DATA]

    ADD r1, sp,  #NODE_SIZE*5    @ Get the Address of Node0
    STR r1, [r0, #NODE_RIGHT]    @ Store it as the left node of Node1
    MOV r2, #NULL
    STR r2, [r1, #NODE_LEFT]     @ Make Node0's left and right node's null
    STR r2, [r1, #NODE_RIGHT]
    STR r2, [r1, #NODE_HEIGHT]   @ Set Node0's height to 0
    STR r2, [r1, #NODE_DATA]

    LDR r0, =sInOrder
    BL  printf

    MOV r0, sp                   @ Inorder traversal of this new tree before rotation
    LDR r1, =arrayBuffer
    MOV r2, #6
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #6
    BL array_print

    LDR r0, =sBal
    BL  printf

    MOV r0, sp                   @ Get Node5
    BL avlTree_balance           @ Left Rotate node5 using balance function
    MOV r4, r0                   @ Node4 should be the new root. Tmp store Node4

    LDR r0, =sInOrder
    BL  printf
                                 @ Inorder traversal after rotation.
    MOV r0, r4                   @ Node4 should be the new root. Tmp store Node4
    LDR r1, =arrayBuffer
    MOV r2, #6
    MOV r3, #0
    BL avlTree_minSort

    LDR r0, =arrayBuffer
    MOV r1, #6
    BL array_print

    MOV sp, fp
.LendOf_testBalanceLeftRotate:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,r5,fp,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testInsert()                                    │
@│  Tree structure should look like
@│ 15, 3, 7, 1, 7, 0, 8, 5, 44, 16, 34, 67, 23 
@│
@│                 23        
@│             /         \           
@│           16          67     
@│          /           /       
@│         5           34       
@│    /          \       \                        
@│   0           8        44      
@│    \         /  \    
@│     1       7    15   
@│      \     /     
@│       3   7      
@│             
@│ 0,1,2,3,5,7,7,8,15,16,23,34,44,67            
@│             
@│             
@└─────────────────────────────────────────────────┘  
.FUNC testInsertAVL
testInsertAVL:
    STMFD sp!, {r4-r7,fp,lr}        @ Keep the stack 8byte aligned
    MOV fp, sp
    SUB sp, sp, #NODE_SIZE          @ Make room for root node

    LDR r4, =testData               @ Use the test array to create an avl tree
    LDR r5, =testDataSz
    LDR r5, [r5]
    SUBS r5, r5, #1                 @ Start from the back of the array testDataSz - 1

    MOV r0, sp                      @ Create the root node
    LDR r1, [r4, r5, LSL #2]
    STR r1, [r0, #NODE_DATA]
    MOV r1, #NULL
    STR r1, [r0, #NODE_RIGHT]
    STR r1, [r0, #NODE_LEFT]
    STR r1, [r0, #NODE_HEIGHT]

    MOV r6, sp
    BAL .LLoopCheck
    .LinsertLoop:
        MOV r0, r6
        LDR r1, [r4, r5, LSL #2]
        BL avlTree_insert
        CMP r0, #NULL
            MOVNE r6, r0
    .LLoopCheck:
    SUBS r5, r5, #1
    BPL .LinsertLoop
    
    MOV r0, r6
    LDR r1, =arrayBuffer
    LDR r2, =arrayBufferSz
    MOV r3, #0
    BL avlTree_minSort
    

    LDR r0, =arrayBuffer
    MOV r1, #13
    BL array_print

    MOV sp, fp
.LendOf_testInsertAVL:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r7,fp,lr}
    BX lr
.ENDFUNC 
