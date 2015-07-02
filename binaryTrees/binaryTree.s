@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                binaryTrees.s                                                │
@│ Playing witih binary trees.                                                 │
@│                                                                             │
@│ To the left is <= to the right is >                                         │
@│                                                                             │
@│ Node:                                                                       │
@│      rightChild                                                             │
@│      leftChild                                                              │
@│      uintData                                                               │
@│                                                                             │
@└─────────────────────────────────────────────────────────────────────────────┘

NODE_RIGHT=0
NODE_LEFT=4
NODE_DATA=8
NODE_SIZE=12
NULL=0

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ node_create()                                   │
@│ return: pointer to the new node.                │
@└─────────────────────────────────────────────────┘  
.GLOBAL node_create
.FUNC node_create
node_create:
    STMFD sp!, {lr}
    MOV r0, #NODE_SIZE
    BL malloc
                            @ Zero the node. 
    MOV r1, #NULL
    MOV r2, #NULL
    MOV r3, #NULL
    STM r0, {r1-r3}
.Lnode_create_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ node_createWithValue()                          │
@│ param(r0): The value to store in the node.      │
@│ return: pointer to the new node.                │
@└─────────────────────────────────────────────────┘  
.GLOBAL node_createWithValue
.FUNC node_createWithValue
node_createWithValue:
    STMFD sp!, {r4,lr}

    MOV r4, r0
    MOV r0, #NODE_SIZE
    BL malloc
                            @ Zero the node. 
    MOV r1, #NULL 
    MOV r2, #NULL
    MOV r3, r4 
    STM r0, {r1-r3}
.Lnode_createWithValue_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ binTree_insert()                                │
@│ param(r0): rootNode to insert to.               │
@│ param(r1): The data to insert.                  │
@│ return: A pointer to the new node.              │
@└─────────────────────────────────────────────────┘  
.GLOBAL binTree_insert
.FUNC binTree_insert
binTree_insert:
    STMFD sp!, {r4-r5,lr}
    
    MOV r4, r0
    MOV r5, r1

    LDR r2, [r4, #NODE_DATA]          @ Load root data
    
    .Lif_dataTest: 
    CMP r5, r2                        @ Check if data is <= or > this node value
    BHI .Lelse_GreaterThan            @ if value > node.value
    .Lthen_lessThanEq:                @ if value <= node.value
        LDR r3, [r4,#NODE_LEFT]       @    get the left node
        .Lif_hasLeftChild:            @
        CMP r3, #NULL                 @    Check if there's a child here.
        BNE .Lelse_LeftRecurse        @    if node.left != null
        .Lthen_noChildDoLeftInsert:   @    if node.left == null
            BL node_create            @    new Node()
            STR r5, [r0, #NODE_DATA]  @  newNode.value = r5
            STR r0, [r4, #NODE_LEFT]
            B .Lendif_hasLeftChild
        .Lelse_LeftRecurse:
            LDR r0, [r4, #NODE_LEFT]
            MOV r1, r5
            BL binTree_insert
        .Lendif_hasLeftChild:
        B .Lendif_DataTest
    .Lelse_GreaterThan:
        LDR r3, [r4,#NODE_RIGHT]
        CMP r3, #NULL
        BNE .Lelse_rightRecurse
        .Lthen_noChildDoRightInsert:
            BL node_create            @    new Node()
            STR r5, [r0, #NODE_DATA]  @  newNode.value = r5
            STR r0, [r4, #NODE_RIGHT]
            B .Lendif_DataTest
        .Lelse_rightRecurse:
            LDR r0, [r4, #NODE_RIGHT]
            MOV r1, r5
            BL binTree_insert
    .Lendif_DataTest:
.LbinTree_insert_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ binTree_minSort()                               │
@│    Recursive version.                           │
@│ param(r0): rootNode.                            │
@│ param(r1): Array buffer.                        │
@│ param(r2): Array buffer size.                   │
@│ param(r3): Array buffer current index.          │
@│ return: Amount of buffer used.                  │
@└─────────────────────────────────────────────────┘  
.GLOBAL binTree_minSort
.FUNC binTree_minSort
binTree_minSort:
    STMFD sp!, {r4,lr}          @ Stack is supposed to be 8byte aligned.
    
    LDR r4, [r0, #NODE_LEFT]    @ Travers left child frist
    CMP r4, #NULL
    BEQ .LbinTree_leftChildisNull
        MOV r0, r4
        BL binTree_minSort
    .LbinTree_leftChildisNull:

    LDR r4, [r0, #NODE_DATA]    @ Push the value onto the buffer
    STR r4, [r1, r3, LSL #2] 
    ADD r3, r3, #1

    LDR r4, [r0, #NODE_RIGHT]
    CMP r4, #NULL
    BEQ .LbinTree_rightChildisNull
        MOV r0, r4
        BL binTree_minSort
    .LbinTree_rightChildisNull:

.LbinTree_minSort_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ binTree_minSortItter()                          │
@│    Recursive version.                           │
@│ param(r0): rootNode.                            │
@│ param(r1): Array buffer.                        │
@│ param(r2): Array buffer size.                   │
@│ param(r3): Array buffer current index.          │
@│ return: Amount of buffer used.                  │
@└─────────────────────────────────────────────────┘  
.GLOBAL binTree_minSortItter
.FUNC binTree_minSortItter
binTree_minSortItter:
    STMFD sp!, {r4,lr}          @ Stack is supposed to be 8byte aligned.
    
    LDR r4, [r0, #NODE_LEFT]    @ Travers left child frist


.LbinTree_minSortItter_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC
