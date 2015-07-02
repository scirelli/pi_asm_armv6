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
.ALIGN 4
.TEXT
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

.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ testInsert()                                    │
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
        BL binTree_insert
        ADD r7, r7, #1
    .LforCondCheck:
    CMP r7, r6
    BLO .LforLoop

.LtestInsert_end:
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


.LtestMinSort_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
