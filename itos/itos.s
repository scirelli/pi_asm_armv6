@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                           Int to String                                     │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Converts a integer to a string.                                             │
@│                                                                             │
@└─────────────────────────────────────────────────────────────────────────────┘
.data
stringBuffer: .SKIP 20   @ 20 chars enough for a 64 bit integer
.byte 0                  @ null terminated string
.balign 4
.TEXT
nStringBufferSz=20

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
@│                               itos                                          │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Converts the passed in integer to a string.                                 │
@│─────────────────────────────────────────────────────────────────────────────│
@│ r0: integer                                                                 │
@│ return: pointer to a string buffer.                                         │
@└─────────────────────────────────────────────────────────────────────────────┘
.GLOBAL itos
.FUNC itos
    negate    .req r4
    strBuffer .req r5
    digit     .req r6
    int       .req r7
    NULL=0
    FALSE=0
    TRUE=1
    zeroCharCode=48
    minusSign=45
    base=10
itos:
    STMFD sp!, {r4-r9,fp,lr}                    @ keep 8byte aligned
    MOV fp, sp 
    
    MOV digit, #0                               @ var digit = 0,
    MOV negate, #FALSE                          @
    LDR strBuffer, =stringBuffer                @ 
    ADD strBuffer, strBuffer, #nStringBufferSz  @ Point it at the last char/byte in the buffer, before the null byte

    CMP r0, #0
        MOVLT negate, #TRUE
        MOVLT r1, #-1
        MULLT int, r0, r1
        MOVGE int, r0                           @ else

    BAL .Lcondition_check
    .Lwhile_HI_zero:                            @ while( int > 0 ){
        MOV r0, int
        MOV r1, #base                           @    digit = int%10;
        bl	__aeabi_idivmod
        MOV digit, r1
        MOV r0, int
        MOV r1, #base
        bl	__aeabi_idiv
        MOV int, r0                             @    int= ~~(int/10);
        ADD  r8, digit, #zeroCharCode           @    str = digit + str;
        STRB r8, [strBuffer], #-1
    .Lcondition_check:
    CMP int, #0
        BHI .Lwhile_HI_zero                     @ }
    
    .Lreturn_value:                             @ return str;
        MOV r0, strBuffer
        CMP negate, #TRUE
            MOVEQ r1, #minusSign
            STREQB r1, [r0]   
        ADDNE r0, r0, #1
    
.Litos_exit:
@ ─────────────────────────────────────────────────────────────────────────────
    LDMFD sp!, {r4-r9,fp,pc}
.ENDFUNC
