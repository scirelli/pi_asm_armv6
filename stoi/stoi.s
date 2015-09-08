@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                           String to Int                                     │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Converts a string to an integer.                                            │
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
@│                               stoi                                          │
@│─────────────────────────────────────────────────────────────────────────────│
@│ Converts the passed in string to an integer. String must start with a       │
@│ number. Stops parsing at first non numeric character.                       │
@│─────────────────────────────────────────────────────────────────────────────│
@│ r0: *string, a sequence of ascii characters that are numberic. String       │
@│ assumed to end in null.                                                     │
@│ return: integer that the string represents.                                 │
@└─────────────────────────────────────────────────────────────────────────────┘
.GLOBAL stoi
.FUNC stoi
    string .req r0
    NULL=0
    FALSE=0
    TRUE=1
    zeroCharCode=48
    minusSign=45
    negate .req r1
    retNumber .req r2
stoi:
    STMFD sp!, {r4-r7,fp,lr}                    @ keep 8byte aligned
    MOV fp, sp 
    
    CMP r0, #NULL
        BEQ .Lstoi_exit

    MOV negate, #FALSE                          @    var negate    = false,
    MOV retNumber, #0                           @        rtnNumber = 0,
    MOV r3, #10

    LDRB  r4, [r0], #1                              
    CMP   r4, #minusSign                        @    if( str.charAt(0) == '-' ){
        MOVEQ negate, #TRUE                     @        negate = true;
        LDREQB r4, [r0], #1                     @    }

     BAL .Lwhile_cond_check
    .Lwhile_valid_char:
        SUB r5, r4, #zeroCharCode
        MOV r6, retNumber
        MLA retNumber, r6, r3, r5               @   rtnNumber = rtnNumber*10 + (str.charCodeAt(i) - zeroCharCode);

        LDRB  r4, [r0], #1                      @ Load the next char
    .Lwhile_cond_check:
    CMP r4, #NULL                               @ check for null char
        BEQ .Lreturn_value  
    CMP r4, #zeroCharCode+10                    @ check if char is not a number
        BHI .Lreturn_value  
    CMP r4, #zeroCharCode                       @ check if char is not a number
        BLO .Lreturn_value
    BAL .Lwhile_valid_char                      @    }

    .Lreturn_value:                             @    return rtnNumber
    CMP negate, #TRUE                           @    if( negate ){
        MOVEQ r1, #0
        SUBEQ r0, r1, retNumber                 @        rtnNumber *= -1;
    MOVNE r0, retNumber                         @    }
    
.Lstoi_exit:
@ ─────────────────────────────────────────────────────────────────────────────
    LDMFD sp!, {r4-r7,fp,pc}
.ENDFUNC
