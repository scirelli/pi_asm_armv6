@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    main.s                                                   │
@│ Main for stoi                                                               │
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.data
arrayBuffer: .SKIP 13*4   @ For printing ints 
.section	.rodata
arrayBufferSz: .word 13
zeroCharCode:.byte 48
testData:
    .byte 48+1
    .byte 48+5 
    .byte 48+3 
    .byte 48+5
    .byte 48+6 
    .byte 48+7
    .byte 48+8
    .byte 48+5
    .byte 48+6
    .byte 48+2
    .byte 48+3
    .byte 48+4
    .byte 48+7
testDataSz:
    .word 13
sArray_n:      .asciz "Array:\n"
sArray:        .asciz "Array: "
sLook:         .asciz "Looking for %d.\n"
sTestIns:      .asciz "Test binarySearch()\n"
sFound:        .asciz "Found %d at [%d].\n"
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
    

.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

