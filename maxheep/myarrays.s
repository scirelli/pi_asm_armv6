@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    maxheap.s                                                │
@│ Playing witih arrays and maxheaps.                                          │
@└─────────────────────────────────────────────────────────────────────────────┘  
@ array is 10 integeers, int is 4 bytes. 4*10
.DATA
arraySz=10
array: .SKIP 40
s_digit: .asciz "%d,"
.TEXT

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
main:
    STMFD sp!, {r4-r12,lr}
    
    LDR r0, =array
    MOV r1, #0
    .Lfill_array:
        STR r1, [r0], #+4
        ADD r1, r1, #1
        CMP r1, #arraySz
    BLO .Lfill_array
    LDR r0, =array
    MOV r1, #arraySz
    BL array_print
end:
    LDMFD sp!, {r4-r12,pc}


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_print()                                   │
@│ prints an array of intergers.                   │
@│ param(r0): pointer to the array to print.       │
@│ param(r1): length of the array.                 │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_print
array_print:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.

    MOV r5, r0
    MOV r6, r1
    MOV r7, #0

    .Larray_print_loop:
       CMP r7, r6
       BHS .Larray_print_return
       ADD r7, r7, #1
       LDR r1, [r5], #+4
       LDR r0, =s_digit
       BL  printf
    BAL .Larray_print_loop

    .Larray_print_return:
@ ─────────────────────────────────────────────────
LDMFD sp!, {pc}                @ Restore the registers and link reg.
