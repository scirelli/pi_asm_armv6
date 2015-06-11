@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                       unsigned_division.s                                   │
@│ Testing an algorithm for integer division.                                  │
@│ thinkingeek.com/2013/08/11/arm-assembler-raspberry-pi-chapter-15            │
@└─────────────────────────────────────────────────────────────────────────────┘  

.TEXT

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ unsigned_division()                             │
@└─────────────────────────────────────────────────┘  
.GLOBAL unsigned_division 
.FUNC unsigned_division 
unsigned_division :
    PUSH {r4, lr}
    r0_N .req r0 /* r0 contains N */
    r1_D .req r1 /* r1 contains D */
    r2_Q .req r2 /* r2 contains Q */
    r3_R .req r3 /* r3 contains R */
    r4_i .req r4 /* loop index */

    MOV r2_Q, #0                 /* r2  0 */
    MOV r3_R, #0                 /* r3  0 */

    MOV r4_i, #32                /* r4  32 */
    B .Lloop_check1
    .Lloop1:
        MOVS r0_N, r0_N, LSL #1    /* r0  r0 << 1 updating cpsr (sets C if 31st bit of r0 was 1) */
        ADC r3_R, r3_R, r3_R       /* r3  r3 + r3 + C. This is equivalent to r3  (r3 << 1) + C */

        CMP r3_R, r1_D             /* compute r3 - r1 and update cpsr */
        SUBHS r3_R, r3_R, r1_D     /* if r3 >= r1 (C=1) then r3  r3 - r1 */
        ADC r2_Q, r2_Q, r2_Q       /* r2  r2 + r2 + C. This is equivalent to r2  (r2 << 1) + C */
    .Lloop_check1:
        SUBS r4_i, r4_i, #1        /* r4  r4 - 1 */
        BPL .Lloop1                /* if r4 >= 0 (N=0) then branch to .Lloop1 */
@ ─────────────────────────────────────────────────
    POP {r4, PC}
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
    BL unsigned_division
.Lend:
@ ─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
