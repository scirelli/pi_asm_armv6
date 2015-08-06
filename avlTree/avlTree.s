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

@###################################################
@                 MACROS                           #
@###################################################
.MACRO MAX $p0, $p1, $p2
    CMP   \$p1, \$p2
    MOVLE \$p0, \$p2
    MOVGT \$p0, \$p1
.ENDM

.MACRO ABS $p0, $p1                          @ http://graphics.stanford.edu/~seander/bithacks.html#IntegerAbs
    MOV   \$p0, \$p1, ASR #31                @ int v;           // we want to find the absolute value of v
    ADD   \$p1, \$p1, \$p0                   @ unsigned int r;  // the result goes here 
    EOR   \$p0, \$p0, \$p1                   @                            4            8
.ENDM                                        @ int const mask = v >> sizeof(int) * CHAR_BIT - 1;
                                             @ r = (v + mask) ^ mask;                                        
@##################################################

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
    ADD r0, r0, #1
@ ─────────────────────────────────────────────────
    LDMFD sp!, {fp,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_nodeWeight()                            │
@│ param(r0): Node to get the weight of.           │
@│ return: Returns the weight of a node.           │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_nodeWeight
.FUNC avlTree_nodeWeight
avlTree_nodeWeight:
    STMFD sp!, {r4,lr}
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
    
    SUB r1, r1, r2                 @ weight = heightLeft - heightRight
    MOV r0, r1
@─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_leftRotate()                            │
@│ You do a left rotate when the node is 'heavy'   │
@│ on the right                                    │
@│                                                 │
@│         (x)        Left Rotate x        (y)     │     
@│        /   \                           /    \   │ 
@│     /A\     (y)                      (x)     /C\│
@│            /    \                   /   \       │    
@│          /B\    /C\                /A\  /B\     │   
@│     AxByC                =          AxByC       │
@│                                                 │
@│ param(r0): Node to do the left rotate around.   │
@│ return: A node. The new root node.              │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_leftRotate
.FUNC avlTree_leftRotate
avlTree_leftRotate:
    STMFD sp!, {r4,lr}
                                       @ nodeX = r0
    LDR r1, [r0, #NODE_RIGHT]          @ nodeY = r1 = nodeX.right
    
    CMP r1, #NULL                      @ if( nodeY == null ) return nodeX
    BEQ .LendOf_avlTree_leftRotate

    LDR r2, [r1, #NODE_LEFT]           @ nodeX.right = nodeY.left
    STR r2, [r0, #NODE_RIGHT]

    STR r0, [r1, #NODE_LEFT]           @ nodeY.left = nodeX

    LDR r2, [r0, #NODE_HEIGHT]         @ nodeX.height--
    SUB r2, r2, #1
    STR r2, [r0, #NODE_HEIGHT]

    MOV r0, r1                         @ nodeY.height = nodeHeight(nodeY)
    MOV r4, r1                         @ store it temp. for function call
    BL avlTree_nodeHeight
    STR r0, [r4, #NODE_HEIGHT]

    MOV r0, r4                         @ return nodeY

.LendOf_avlTree_leftRotate:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_rightRotate()                           │
@│ You do a right rotate when the node is 'heavy'  │
@│ on the left.                                    │
@│                                                 │ 
@│      (x)       Right rotate x       (y)         │
@│     /    \                         /   \        │
@│  (y)     /C\                   /A\     (x)      │ 
@│  /   \                                /    \    │
@│ /A\  /B\                            /B\    /C\  │
@│   AyBxC             =          AyBxC            │
@│ In order traversal is still the same            │
@│ param(r0): Node to do the right rotate around.  │
@│ return: A node. The new root node               │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_rightRotate
.FUNC avlTree_rightRotate
avlTree_rightRotate:
    STMFD sp!, {r4-r6,lr}
                                @ nodeX = r0
    LDR r1, [r0, #NODE_LEFT]    @ r1 = nodeY = nodeX.left;
    LDR r2, [r1, #NODE_RIGHT]   @ nodeX.left = nodeY.right;
    STR r2, [r0, #NODE_LEFT]

    STR r0, [r1, #NODE_RIGHT]   @ nodeY.right = nodeX;

    MOV r4, r0
    MOV r5, r1
    BL avlTree_nodeHeight       @ nodeX.height = nodeHeight(nodeX)
    STR r0, [r4, #NODE_HEIGHT]

    @ LDR r2, [r0, #NODE_HEIGHT]  @ nodeX.height--;
    @ SUB r2, r2,  #1
    @ STR r2, [r0, #NODE_HEIGHT]
    
    MOV r0, r5                  @ nodeY.height = nodeHeight(nodeY);
    BL avlTree_nodeHeight
    STR r0, [r5, #NODE_HEIGHT]

    MOV r0, r5                  @ return nodeY;
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_avlTree_balance()                       │
@│ param(r0): Root node or node to start balancing.│
@│ return: The new root node. If needed or the     │
@│ balanced tree.                                  │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_balance
.FUNC avlTree_balance
avlTree_balance:
    STMFD sp!, {r4,lr}

   MOV r4, r0                                           @ r4 = root node
   BL avlTree_nodeWeight                                @ r0 = weight = nodeWeight(node);
   ABS r1, r0                                           @ r1 = abs(weight)

   CMP r1, #1
   BHI .Lif_abs_weight_gt_1
   BAL .LendOf_avlTree_balance_rtn_null
   .Lif_abs_weight_gt_1:                                @ if( Math.asb(weight)  > 1 ){//unblanced
       CMP r0, #1                    
       BGT .Lif_node_is_left_heavy                      @     if( weight > 1 ){//node is left heavy
       BAL .Lelse_node_is_right_heavy
       .Lif_node_is_left_heavy:
           LDR r0, [r4, #NODE_LEFT]                     @         weight = nodeWeight(node.left);
           BL avlTree_nodeWeight                                         

           CMP r0, #0                                   @         if( weight >= 0 ){//node's left child is left heavy or balanced
           BGE .Lif_left_child_left_heavy_or_balanced 
           BAL .Lelse_left_child_right_heavy
           .Lif_left_child_left_heavy_or_balanced:
               MOV r0,r4
               BL avlTree_rightRotate                   @             return rightRotate(node);
               BAL .LendOf_avlTree_balance_rtn_val      @
           .Lelse_left_child_right_heavy:               @         }else if( weight < 0 ){//node's left child is right heavy
               MOV r0, r4                               @             node.left = leftRotate( node.left );
               LDR r0, [r0, #NODE_LEFT]
               BL avlTree_leftRotate
               MOV r1, r0
               MOV r0, r4
               STR r1, [r0, #NODE_LEFT]
               
               BL avlTree_rightRotate                   @             return rightRotate( node  );
           BAL .LendOf_avlTree_balance_rtn_val
       BAL .LendOf_avlTree_balance_rtn_null             @         }
       .Lelse_node_is_right_heavy:                      @     }else if( weight < 0 ){//node is right heavy
       .Lif_node_is_right_heavy:                                 
           LDR r0, [r4, #NODE_RIGHT]                    @         weight = nodeWeight(node.right);
           BL avlTree_nodeWeight
       
           CMP r0, #0                                   @         if( weight >= 0 ){//node's right child is left heavy or balanced
           BGE .Lif_right_child_left_heavy_or_balanced
           BAL .Lelse_right_child_left_heavy_or_balanced
           .Lif_right_child_left_heavy_or_balanced:
               LDR r0, [r4, #NODE_RIGHT]                @             node.right = rightRotate( node.right );
               BL avlTree_rightRotate
               STR r0, [r4, #NODE_RIGHT]
               MOV r0, r4
               BL avlTree_leftRotate
               BAL .LendOf_avlTree_balance_rtn_val      @             return leftRotate( node  );
           .Lelse_right_child_left_heavy_or_balanced:   @         }else if( weight < 0 ){//node's right child is right heavy
               MOV r0, r4                               @             return leftRotate(node);
               BL avlTree_leftRotate
               BAL .LendOf_avlTree_balance_rtn_val      @         }
                                                        @     }
                                                        @ }
   .LendOf_avlTree_balance_rtn_null:
   MOV r0, #NULL                    @ return null;
   .LendOf_avlTree_balance_rtn_val:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ avlTree_insert()                                │
@│ param(r0): rootNode to insert to.               │
@│ param(r1): The data to insert.                  │
@│ return: null or a new root node if balance      │
@│ causes a new root to be created.                │
@└─────────────────────────────────────────────────┘  
.GLOBAL avlTree_insert
.FUNC avlTree_insert
avlTree_insert:
    STMFD sp!, {r4,r5,lr}
   
                                            @ var newChild = null;
    LDR r2, [r0, #NODE_DATA]                @ if( value <= node.value ){
    CMP r1, r2
    BLE .Lif_val_LE_nodeval
    BAL .Lelse_if_val_HI_nodeval
    .Lif_val_LE_nodeval:
        LDR r2, [r0, #NODE_LEFT]            @     if( !node.left ){
        CMP r2, #NULL 
        BNE .Lif_left_not_null
        BAL .Lelse_left_is_null
        .Lif_left_not_null:
            MOV r4, r0
            MOV r0, r1
            BL node_createWithValue         @         node.left = new Node(value);
            STR r0, [r4, #NODE_LEFT]
            MOV r0, r4                      @         node.height = nodeHeight(node);
            BL avlTree_nodeHeight
            STR r0, [r4, #NODE_HEIGHT]
        BAL .LendOf_insert_rtn_null         @         return null;
        .Lelse_left_is_null:                @     }else{
            MOV r4, r0
            LDR r0, [r0, #NODE_LEFT]
            BAL avlTree_insert              @         newChild = insert( node.left, value );
            CMP r0, #NULL                   @         if( newChild ){
            STRNE r0, [r4, #NODE_LEFT]      @             node.left = newChild;
                                            @         }
            MOV r0, r4
            BL avlTree_balance              @         newChild = balance(node);
            MOV r5, r0
            MOV r0, r4
            BL avlTree_nodeHeight           @         node.height = nodeHeight(node)//don't think i need this anymore;
            STR r0, [r4, #NODE_HEIGHT]
            MOV r0, r5                      @         return newChild;
        BAL .LendOf_insert                  @     }
      .Lelse_if_val_HI_nodeval:             @ }else if( value > node.value ){
            MOV r4, r0
            LDR r0, [r0, #NODE_RIGHT]       @     if( !node.right ){
            CMP r0, #NULL
            BEQ .Lelse_nodeRight_is_null
                MOV r0, r1
                BL node_createWithValue     @         node.right = new Node(value);
                STR r0, [r4, #NODE_RIGHT]
                MOV r0, r4                  @         node.height = nodeHeight(node);
                BL avlTree_nodeHeight
                STR r0, [r4, #NODE_HEIGHT]
           BAL .LendOf_insert_rtn_null     
           .Lelse_nodeRight_is_null         @     }else{
               MOV r4, r0                   @         newChild = insert(node.right, value);
               LDR r0, [r0, #NODE_RIGHT]
               CMP r0, #NULL                @         if( newChild ){
               STRNE r0, [r4, #NODE_RIGHT]  @             node.right = newChild;
                                            @         }
               MOV r0, r4                   @         newChild = balance(node);
               BL avlTree_balance
               MOV r5, r0                   @         node.height = nodeHeight(node); //don't think i need this anymore
               MOV r0, r4
               BL avlTree_nodeHeight
               STR r0, [r4, #NODE_HEIGHT]
               MOV r0, r5
                                            @     }
                                            @ }
    BAL .LendOf_insert                      @ return newChild;
    .LendOf_insert_rtn_null:
    MOV r0, #NULL
    .LendOf_insert:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,r5,pc}
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
