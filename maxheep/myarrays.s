@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    myarrays.s                                               │
@│ Playing witih arrays.                                                       │
@└─────────────────────────────────────────────────────────────────────────────┘  
@ array is 10 integeers, int is 4 bytes. 4*10
.DATA
@arraySz=1024
@array: .SKIP 4096 
s_digit: .asciz "%d\n\r"
s_digit_comma: .asciz "%d,"
RAND_MAX=2147483647

.TEXT
.ALIGN 2

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main() REMOVED this file has become a lib file  │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
@.GLOBAL main
@.FUNC main
@main:
@    STMFD sp!, {r4-r12,lr}
@
@    LDR r0, =array
@    MOV r1, #arraySz
@    BL array_fill_random
@
@    LDR r0, =array
@    MOV r1, #arraySz
@    BL array_print
@end:
@ ─────────────────────────────────────────────────
@    LDMFD sp!, {r4-r12,lr}
@    BX lr
@.ENDFUNC

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
@│ Fills an array with random ints from 0 to the   │
@│ size of the array.                              │
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
        
        FMSR s14, r5           @ W're going to fill the array with random numbers between 0 and the size of the array.
        FUITOS s14, s14
        FMULS s15, s14, s15    @ Floating-point multiply. S for single precision. D for double.

        FTOUIZS s15, s15       @ Convert from floating-point to unsigned integer, Z means round down to zero (floor). S for single-precision
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
       
       MOV r0, r6
       MOV r1, #10
       BL mod

       LDRNE r0, =s_digit_comma
       LDREQ r0, =s_digit
       LDR r1, [r5], #+4
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

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_swap()                                    │
@│ Swaps two elements of an array. Swaps a and b.  │
@│ param(r0): pointer to the array.                │
@│ param(r1): Index to element a.                  │
@│ param(r2): Index to element b.                  │
@│ param(r3): Size of an element.                  │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_swap
.FUNC array_swap
array_swap:
    STMFD sp!, {r4,r5,lr}      @ Store registerst that need to be preserved including the link reg.
    
    MUL r1, r1, r3
    MUL r2, r2, r3
    LDR r5, [r0,r1]            @ Temp for value a
    LDR r4, [r0,r2]            @ Temp for value b
    STR r4, [r0,r1]
    STR r5, [r0,r2]

.Larray_swap_return:
@ ─────────────────────────────────────────────────
LDMFD sp!, {r4,r5,pc}          @ Restore the registers and link reg.
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ array_ofWrdSwap()                               │
@│ Swaps two elements of an array. Swaps a and b.  │
@│ Elements are treated as pointers size 4bytes.   │
@│ param(r0): pointer to the array.                │
@│ param(r1): Index to element a.                  │
@│ param(r2): Index to element b.                  │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.GLOBAL array_ofWrdSwap
.FUNC array_ofWrdSwap
array_ofWrdSwap:
    STMFD sp!, {r4,lr}         @ Store registerst that need to be preserved including the link reg.
    
    LDR r3, [r0,r1, LSL #2]    @ Temp for value a
    LDR r4, [r0,r2, LSL #2]    @ Temp for value b
    STR r4, [r0,r1, LSL #2]
    STR r3, [r0,r2, LSL #2]

.Larray_ofWrdSwap_return:
@ ─────────────────────────────────────────────────
LDMFD sp!, {r4,pc}             @ Restore the registers and link reg.
.ENDFUNC
