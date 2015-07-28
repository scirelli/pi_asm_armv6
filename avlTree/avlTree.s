@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                avlTree.s                                                    │
@│ Playing with balanced binary trees.                                         │
@│                                                                             │
@│ To the left is <= to the right is >                                         │
@│                                                                             │
@│ Node:                                                                       │
@│      rightChild                                                             │
@│      leftChild                                                              │
@│      uintData                                                               │
@│      height     @ signed int                                                │
@│                                                                             │
@└─────────────────────────────────────────────────────────────────────────────┘
.TEXT

NODE_RIGHT=0
NODE_LEFT=4
NODE_DATA=8
NODE_HEIGHT=12
NODE_SIZE=16
NULL=0

.MACRO MAX $p0, $p1, $p2
    CMP   \$p1, \$p2
    MOVLE \$p0, \$p2
    MOVGT \$p0, \$p1
.ENDM

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ node_create()                                   │
@│ return: pointer to the new node.                │
@└─────────────────────────────────────────────────┘  
.GLOBAL node_create
.FUNC node_create
node_create:
    STMFD sp!, {r4,lr}
    MOV r0, #NODE_SIZE
    BL malloc
                            @ Zero the node. 
    MOV r1, #NULL
    MOV r2, #NULL
    MOV r3, #NULL
    MOV r4, #NULL
    STM r0, {r1-r4}
.Lnode_create_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
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
    MOV r4, #NULL
    STM r0, {r1-r4}
.Lnode_createWithValue_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_nodeHeight()                            │
@│ param(r0): Node to get the height of.           │
@│ return: Signed int. The height of the node.     │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_nodeHeight
.FUNC avlTree_nodeHeight
avlTree_nodeHeight:
    STMFD sp!, {fp,lr}             @ Stack is supposed to be 8byte aligned.
    
                                   @ leftH = node.left ? node.left.height : -1
    LDR   r1, [r0, #NODE_LEFT]     @   
    CMP   r1, #NULL
    MOVEQ r1, #-1
    LDRNE r1, [r1, #NODE_HEIGHT]

                                   @ rightH = node.right ? node.right.height : -1
    LDR   r2, [r0, #NODE_RIGHT]    @
    CMP   r2, #NULL
    MOVEQ r2, #-1
    LDRNE r2, [r2, #NODE_HEIGHT]

                                   @ Max( leftH, rightH )
    MAX r0, r1, r2
@ ─────────────────────────────────────────────────
    LDMFD sp!, {fp,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_nodeWeight()                            │
@│ param(r0): Node to get the weight of.           │
@│ return: Returns the weight of a node.           │
@└─────────────────────────────────────────────────┘  
.FUNC avlTree_nodeWeight
avlTree_nodeWeight:
    STMFD sp!, {r4-r5,lr}
    
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_leftRotate()                            │
@│ param(r0): Node to do the left rotate around.   │
@│ return: A node.                                 │
@└─────────────────────────────────────────────────┘  
.FUNC avlTree_leftRotate
avlTree_leftRotate:
    STMFD sp!, {r4-r5,lr}
    
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_rightRotate()                           │
@│ param(r0): Node to do the right rotate around.  │
@│ return: A node.                                 │
@└─────────────────────────────────────────────────┘  
.FUNC avlTree_rightRotate
avlTree_rightRotate:
    STMFD sp!, {r4-r5,lr}
    
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_insert()                                │
@│ param(r0): rootNode to insert to.               │
@│ param(r1): The data to insert.                  │
@│ return: A pointer to the new node.              │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_insert
.FUNC avlTree_insert
avlTree_insert:
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
            BL avlTree_insert
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
            BL avlTree_insert
    .Lendif_DataTest:
.LavlTree_insert_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_minSort()                               │
@│    Recursive version.                           │
@│ param(r0): rootNode.                            │
@│ param(r1): Array buffer.                        │
@│ param(r2): Array buffer size.                   │
@│ param(r3): Array buffer current index.          │
@│ return: Amount of buffer used.                  │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_minSort
.FUNC avlTree_minSort
avlTree_minSort:
    STMFD sp!, {r4,lr}          @ Stack is supposed to be 8byte aligned.
    
    LDR r4, [r0, #NODE_LEFT]    @ Travers left child frist
    CMP r4, #NULL
    BEQ .LavlTree_leftChildisNull
        STMFD sp!, {r0}
        MOV r0, r4
        BL avlTree_minSort
        LDMFD sp!, {r0}
    .LavlTree_leftChildisNull:

    LDR r4, [r0, #NODE_DATA]    @ Push the value onto the buffer
    STR r4, [r1, r3, LSL #2] 
    ADD r3, r3, #1

    LDR r4, [r0, #NODE_RIGHT]
    CMP r4, #NULL
    BEQ .LavlTree_rightChildisNull
        STMFD sp!, {r0}
        MOV r0, r4
        BL avlTree_minSort
        LDMFD sp!, {r0}
    .LavlTree_rightChildisNull:

.LavlTree_minSort_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_maxSort()                               │
@│    Recursive version.                           │
@│ param(r0): rootNode.                            │
@│ param(r1): Array buffer.                        │
@│ param(r2): Array buffer size.                   │
@│ param(r3): Array buffer current index.          │
@│ return: Amount of buffer used.                  │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_maxSort
.FUNC avlTree_maxSort
avlTree_maxSort:
    STMFD sp!, {r4,lr}          @ Stack is supposed to be 8byte aligned.
    
    LDR r4, [r0, #NODE_RIGHT]
    CMP r4, #NULL
    BEQ .LavlTree_maxLeftChildisNull
        STMFD sp!, {r0}
        MOV r0, r4
        BL avlTree_maxSort
        LDMFD sp!, {r0}
    .LavlTree_maxLeftChildisNull:

    LDR r4, [r0, #NODE_DATA]    @ Push the value onto the buffer
    STR r4, [r1, r3, LSL #2] 
    ADD r3, r3, #1

    LDR r4, [r0, #NODE_LEFT]    @ Travers left child frist
    CMP r4, #NULL
    BEQ .LavlTree_maxRightChildisNull
        STMFD sp!, {r0}
        MOV r0, r4
        BL avlTree_maxSort
        LDMFD sp!, {r0}
    .LavlTree_maxRightChildisNull:

.LavlTree_maxSort_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC
