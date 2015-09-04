@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                           Binary Search                                     │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Implementing https://www.grc.com/miscfiles/binarysearch.png in ARMv6        │
@│                                                                             │
@└─────────────────────────────────────────────────────────────────────────────┘
.TEXT


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
@│ r1: array, pointer to the array to search.                                  │
@│ r3 arrayLen, unsigned int. Length of the array.                             │
@│ return: pointer to the new item found.                                      │
@└─────────────────────────────────────────────────────────────────────────────┘
.GLOBAL binarySearch
.FUNC binarySearch
binarySearch:
    STMFD sp!, {r4,lr}

    
.LbinarySearch_exit
@ ─────────────────────────────────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC
