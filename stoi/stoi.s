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
    zeroCharCode=48
    minusSign=45
    negate .req r1
    retNumber .req r2
    index .req r3
stoi:
    STMFD sp!, {r4,r5,fp,lr}                    @ keep 8byte aligned
    MOV fp, sp 

    MOV negate, #FALSE                          @    var negate    = false,
    MOV retNumber, #0                           @        rtnNumber = 0,
    MOV index, #0                               @        index     = 0,
                                                @        zeroCharCode = '0'.charCodeAt(0);
    LDRB r4, [r0],#1                            @
                                                @    if( str.charAt(0) == '-' ){
                                                @        negate = true;
                                                @        index = 1;
                                                @    }
                                                @
                                                @    for( var i=index,l=str.length; i<l; i++ ){
                                                @        rtnNumber *= 10;
                                                @        rtnNumber += str.charCodeAt(i) - zeroCharCode;
                                                @    }
                                                @    if( negate ){
                                                @        rtnNumber *= -1;
                                                @    }
                                                @    return rtnNumber
.Lstoi_exit:
@ ─────────────────────────────────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC
