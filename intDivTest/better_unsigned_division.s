@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                better_unsigned_division.s                                   │
@│ Testing an algorithm for integer division.                                  │
@│ thinkingeek.com/2013/08/11/arm-assembler-raspberry-pi-chapter-15            │
@└─────────────────────────────────────────────────────────────────────────────┘  

.TEXT
.GLOBAL better_unsigned_division 
.FUNC better_unsigned_division 
better_unsigned_division :
    r0_Ni .req r0
    r1_D  .req r1
    r3_Di .req r3
    r2_Q  .req r2
    /* r0 contains N and Ni */
    /* r1 contains D */
    /* r2 contains Q */
    /* r3 will contain Di */

    MOV r3_Di, r1_D                   /* r3  r1 */
    CMP r3_Di, r0_Ni, LSR #1          /* update cpsr with r3 - r0/2 */
    .Lloop2:
        MOVLS r3_Di, r3_Di, LSL #1    /* if r3 <= 2*r0 (C=0 or Z=1) then r3  r3*2 */
        CMP r3_Di, r0_Ni, LSR #1      /* update cpsr with r3 - (r0/2) */
        BLS .Lloop2                   /* branch to .Lloop2 if r3 <= 2*r0 (C=0 or Z=1) */

    MOV r2_Q, #0                      /* r2  0 */

    .Lloop3:
        CMP r0_Ni, r3_Di              /* update cpsr with r0 - r3 */
        SUBHS r0_Ni, r0_Ni, r3_Di     /* if r0 >= r3 (C=1) then r0  r0 - r3 */
        ADC r2_Q, r2_Q, r2_Q          /* r2  r2 + r2 + C.  Note that if r0 >= r3 then C=1, C=0 otherwise */

        MOV r3_Di, r3_Di, LSR #1      /* r3  r3/2 */
        CMP r3_Di, r1_D               /* update cpsr with r3 - r1 */
        BHS .Lloop3                   /* if r3 >= r1 branch to .Lloop3 */
@ ─────────────────────────────────────────────────
    bx lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): array of char*.                      │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}
    
    MOV r0, #10
    MOV r1, #2
    BL better_unsigned_division
.Lend:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
