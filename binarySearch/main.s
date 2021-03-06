@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    main.s                                                   │
@│ Main for binary search.                                                     │
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.data
arrayBuffer: .SKIP 13*4   @ For printing ints 

.section	.rodata
arrayBufferSz: .word 13
testData:
    .word 0
    .word 1 
    .word 3 
    .word 5
    .word 6 
    .word 7
    .word 8
    .word 15
    .word 16
    .word 23
    .word 34
    .word 44
    .word 67
testDataSz:
    .word 13
sArray_n:      .asciz "Array:\n"
sArray:        .asciz "Array: "
sLook:         .asciz "Looking for %d.\n"
sTestIns:      .asciz "Test binarySearch()\n"
sFound:        .asciz "Found %d at [%d].\n"
.ALIGN 4
.TEXT
FIND_ME=67

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}
    
    LDR r0, =sArray
    BL printf
    LDR r0, =testData
    LDR r1, =testDataSz
    LDR r1, [r1]
    BL array_print

    LDR r0, =sLook
    MOV r1, #FIND_ME
    BL printf

    MOV r0, #FIND_ME
    LDR r1, =testData
    LDR r2, =testDataSz           @ Address of the size. It's also placed at the end of the array, so it's the address of the end of the array.
    BL binarySearch

    LDR r1, [r0]
    MOV r2, r0
    LDR r0, =sFound
    BL printf

.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
