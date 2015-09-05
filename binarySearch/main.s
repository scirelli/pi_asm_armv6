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
sBal:        .asciz "Array:\n"
sTestIns:    .asciz "Test binarySearch()\n"
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
    
    MOV r0, #44
    LDR r1, =testData
    LDR r2, =testDataSz
    BL binarySearch
    #BL printf
.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
