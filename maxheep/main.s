@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                     main.s                                                  │
@│ Playing witih maxheaps.                                                     │
@└─────────────────────────────────────────────────────────────────────────────┘  
@ array is 10 integeers, int is 4 bytes. 4*10
.DATA
arraySz=10
bigArraySz=1000
arrayTestSz=10
array: .SKIP 40
arrayTest:
    .word 15
    .word 3
    .word 7
    .word 1
    .word 7
    .word 0
    .word 8
    .word 5
    .word 44
    .word 55
bignum: .word 9999
s_digit:       .asciz "%d\n\r"
s_nl:          .asciz "\n\r"
s_simpleTest:  .asciz "Simple static array test:\n"
s_simpleTest2: .asciz "Simple static random filled array test:\n"
s_simpleTest3: .asciz "Simple dynamic random filled array test of size (%d):\n"
s_simpleTest4: .asciz "Get max value:\n"
s_simpleTest5: .asciz "Remove top value:\n"
.TEXT
.ALIGN 2

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}

    LDR r0,=s_simpleTest
    #BL printf
    BL simpleTest
    LDR r0,=s_nl
    #BL printf

    LDR r0,=s_simpleTest2
    #BL printf
    BL randArrayTest
    LDR r0,=s_nl
    #BL printf

    LDR r0,=s_simpleTest3
    MOV r1, #bigArraySz
    #BL printf
    BL bigRandArrayTest
    LDR r0,=s_nl
    #BL printf

    LDR r0,=s_simpleTest4
    #BL printf
    BL maxItemTest

    LDR r0,=s_simpleTest5
    BL printf
    BL topItemTest
.Lend:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ simpleTest()                                    │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC simpleTest
simpleTest:
    STMFD sp!, {lr}

    LDR r0, =arrayTest
    MOV r1, #arrayTestSz
    BL array_print

    LDR r0, =arrayTest
    MOV r1, #arrayTestSz
    MOV r2, #4
    BL buildMaxHeap

    LDR r0, =arrayTest
    MOV r1, #arrayTestSz
    BL array_print
.LsimpleTest_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ randArrayTest()                                 │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC randArrayTest
randArrayTest:
    STMFD sp!, {lr}
    
    LDR r0, =array
    MOV r1, #arraySz
    BL array_fill_random

    LDR r0, =array
    MOV r1, #arraySz
    BL array_print

    LDR r0, =array
    MOV r1, #arraySz
    MOV r2, #4
    BL buildMaxHeap

    LDR r0, =array
    MOV r1, #arraySz
    BL array_print
.LrandArrayTest_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ bigRandArrayTest()                              │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC bigRandArrayTest
bigRandArrayTest:
    STMFD sp!, {r4,lr}
    lo .req r0;
                            @ Create space for the array
    MOV lo, #bigArraySz 
    MOV r1, #4
    MUL r0, r0, r1
    BL malloc
    MOV r4, r0              @ Keep a reference to the array
    MOV r1, #bigArraySz     @ Fill the array
    BL array_fill_random

    LDR r1, =bignum
    LDR r1, [r1]
    STR r1, [r4,#+20] 

    MOV r0, r4
    MOV r1, #bigArraySz
    BL array_print

    LDR r0,=s_nl
    BL printf

    MOV r0, r4
    MOV r1, #bigArraySz
    MOV r2, #4
    BL buildMaxHeap

    MOV r0, r4
    MOV r1, #bigArraySz
    BL array_print

    MOV r0, r4
    BL free
.LbigRandArrayTest_end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ maxItemTest()                                   │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC maxItemTest
maxItemTest:
    STMFD sp!, {r4-r6,lr}
    array   .req r4;
    arraySz .req r5;
                               @ Create space for the array
    MOV arraySz, #bigArraySz 
    MOV r1, #4
    MUL r0, arraySz, r1
    BL malloc
    MOV array, r0              @ Keep a reference to the array
    MOV r1, #bigArraySz        @ Fill the array
    BL array_fill_random

    MOV r0, array
    MOV r1, #bigArraySz
    BL array_print

    LDR r0,=s_nl
    BL printf

    MOV r0, array
    MOV r1, #bigArraySz
    MOV r2, #4
    BL buildMaxHeap

    MOV r0, array
    MOV r1, #bigArraySz
    BL array_print

    LDR r0,=s_nl
    BL printf

    MOV r0, array
    BL maxHeap_getMax
    MOV r1, r0
    LDR r0,=s_digit
    BL printf

    MOV r0, r4
    BL free
.LmaxItemTest:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ topItemTest()                                   │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.FUNC topItemTest
topItemTest:
    STMFD sp!, {r4-r6,lr}
    array   .req r4;
    arraySz .req r5;
                               @ Create space for the array
    MOV arraySz, #bigArraySz 
    MOV r1, #4
    MUL r0, arraySz, r1
    BL malloc
    MOV array, r0              @ Keep a reference to the array
    MOV r1, #bigArraySz        @ Fill the array
    BL array_fill_random

    MOV r0, array
    MOV r1, #bigArraySz
    BL array_print

    LDR r0,=s_nl
    BL printf

    MOV r0, array
    MOV r1, #bigArraySz
    MOV r2, #4
    BL buildMaxHeap

    MOV r0, array
    MOV r1, #bigArraySz
    BL array_print

    LDR r0,=s_nl
    BL printf

   .Lremove_Max:
        MOV r0, array
        MOV r1, #bigArraySz
        BL maxHeap_removeMax
        MOV r5, r0
        MOV r1, r0
        LDR r0,=s_digit
        BL printf
        CMP r5, #0
    BNE .Lremove_Max

    MOV r0, r4
    BL free
.LtopItemTest:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
.ENDFUNC
