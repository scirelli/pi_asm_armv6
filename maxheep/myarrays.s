@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    myarrays.s                                               │
@│ Playing witih arrays.                                                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
@ array is 10 integeers, int is 4 bytes. 4*10
.DATA
arraySz=10
array: .SKIP 40
s_digit: .asciz "%d\n\r"
s_digit_comma: .asciz "%d,"
RAND_MAX=2147483647

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

    LDR r0, =array
    MOV r1, #arraySz
    BL array_fill_random

    LDR r0, =array
    MOV r1, #arraySz
    BL array_print
end:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_fill()                                    │
@│ Fills an array will consecutive numbers.        │
@│ param(r0): Pointer to the the array to fill.    │
@│ param(r1): Length of the array.                 │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_fill 
.FUNC array_fill
array_fill:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.

    MOV r2, #0
    .Lfill_array:
        STR r2, [r0], #+4
        ADD r2, r2, #1
        CMP r2, r1
    BLO .Lfill_array
@ ─────────────────────────────────────────────────
LDMFD sp!, {pc}                @ Restore the registers and link reg.
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_fill_random()                             │
@│ Fills an array with randome ints                │
@│ param(r0): pointer to the array to fill.        │
@│ param(r1): The size of the array.               │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_fill_random
.FUNC array_fill_random
array_fill_random:
    STMFD sp!, {r4,lr}         @ Store registerst that need to be preserved including the link reg.
    
    MOV r4, r0
    MOV r5, r1

    MOV r6, #0
	MOV	r0, #0
	bl	time
	bl	srand
    .Lfill_array_rand:
        bl	rand

        FMSR s15, r0           @ Moves an ARM register to a VFP single-precision register
        FUITOS s14, s15        @ Convert unsigned integer to floating-point (s) for single-precision floating point
        MOV r1, #RAND_MAX
        FMSR s15, r1           @
        FUITOS s15, s15        @ Float, convert unsigned integer to float single-precision
        FDIVS  s15, s14, s15   @ Divide. 
        FMRS r0, s15

        STR r0, [r4], #+4
        ADD r6, r6, #1
        CMP r6, r5
    BLO .Lfill_array_rand
@ ─────────────────────────────────────────────────
LDMFD sp!, {r4,pc}             @ Restore the registers and link reg.
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_print()                                   │
@│ prints an array of intergers.                   │
@│ param(r0): pointer to the array to print.       │
@│ param(r1): length of the array.                 │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_print
.FUNC array_print
array_print:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.

    MOV r5, r0
    SUBS r1, r1, #1
    BMI .Larray_print_return
    MOV r6, r1
    MOV r7, #0

    .Larray_print_loop:
       CMP r7, r6
       BHS .Larray_print_last_element
       ADD r7, r7, #1
       LDR r1, [r5], #+4
       LDR r0, =s_digit_comma
       BL  printf
    BAL .Larray_print_loop

    .Larray_print_last_element:
       LDR r1, [r5]
       LDR r0, =s_digit
       BL  printf
    .Larray_print_return:
@ ─────────────────────────────────────────────────
LDMFD sp!, {pc}                @ Restore the registers and link reg.
.ENDFUNC
