@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                           Binary Search                                     │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Implementing https://www.grc.com/miscfiles/binarysearch.png in ARMv6        │
@│                                                                             │
@└─────────────────────────────────────────────────────────────────────────────┘
.TEXT

@############# Macros ######################
.MACRO HALF $p0
    MOV \$p0, \$p0, LSR  #1
.ENDM

.MACRO SHALF $p0
    MOV \$p0, \$p0, ASR  #1
.ENDM

.MACRO ZERO $p0
    MOV \$p0, #0
.ENDM
@###########################################

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                           binarySearch                                      │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Rather than bouncing a probe, this uses the "Binary Chop" method of         │
@│ narrowing the range by moving the left and right walls inward.              │
@│                                                                             │
@│ Given a target value, an array offset and the array's length, this returns  │
@│ the index of the lcoated value within the array.                            │
@│─────────────────────────────────────────────────────────────────────────────│
@│ r0: target, unsigned int. The value to search for.                          │
@│ r1: array, pointer to the array to search. Address of the first element     │
@│ r2 arrayLen, unsigned int. Length of the array. Address of the end of the   │
@│ array.                                                                      │
@│ return: pointer to the new item found.                                      │
@└─────────────────────────────────────────────────────────────────────────────┘
.GLOBAL binarySearch
.FUNC binarySearch
    target .req r0; array .req r1; len .req r2
    ELEMENT_SIZE=4                                @ bytes
binarySearch:
    STMFD sp!, {r4,lr}
    
    .Lwhile_start_LE_end:
        CMP r1, len                               @ while start index <= end index.
        BHI .LendWhile                            @ if start > end exit with not found
        
        ADD r3, r2, r1                            @ r3 will hold the mid point index
        HALF r3
        AND  r3, r3, #-ELEMENT_SIZE               @ Round 
        
        LDR r4, [r3]
        CMP  target, r4
            MOVEQ r0, r3                           @ If target is == mid we're done 
            BEQ   .LbinarySearch_exit
            
            ADDGT r1, r3, #ELEMENT_SIZE            @ If target is > mid
            
            SUBLT r2, r3, #ELEMENT_SIZE            @ If target is < mid
        BAL .Lwhile_start_LE_end
    .LendWhile:
    ZERO r0 
       
.LbinarySearch_exit:
@ ─────────────────────────────────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC
@.unreq target; .unreq array; .unreq len;
