@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    demo.s                                                   │
@│ Main ncurses demo.                                                          │
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.data
arrayBuffer: .SKIP 13*4   @ For printing ints 
.section	.rodata
arrayBufferSz: .word 13
zeroCharCode:.byte 48
testData:
    .byte 48+1
    .byte 48+5 
    .byte 48+3 
    .byte 48+5
    .byte 48+6 
    .byte 48+7
    .byte 48+8
    .byte 48+5
    .byte 48+6
    .byte 48+2
    .byte 48+3
    .byte 48+4
    .byte 48+7
    .byte 0
testDataSz: .word 13
DELAY:      .word 3000
sArray_n:   .asciz "Array:\n"
Balls:
sBall1:     .asciz "O"
sBall2:     .asciz "©"
sBall3:     .asciz "®"
sBall4:     .asciz "ϴ"
sBall5:     .asciz "∅"
sBall6:     .asciz "Φ"
sBall7:     .asciz "Θ"
sBall8:     .asciz "■"
sBall9:     .asciz "□"
sBall10:    .asciz "▢"
sBall11:    .asciz "▣"
sBall12:    .asciz "▤"
sBall13:    .asciz "▥"
sBall14:    .asciz "▦"
sBall15:    .asciz "▧"
sBall16:    .asciz "▨"
sBall17:    .asciz "▩"
sBall18:    .asciz "▪"
sBall18:    .asciz "●"
sBall18:    .asciz "◐"
sBall18:    .asciz "◑"
sBall18:    .asciz "◇"
sBall18:    .asciz "◊"
sBall18:    .asciz "○"
sBall18:    .asciz "◎"
sBall18:    .asciz "☺"
sBall18:    .asciz "☻"
sBall18:    .asciz "☼"
sBall18:    .asciz "★"
sBall18:    .asciz "☆"
sBall18:    .asciz "◆"

sPaddleCapT1: .asciz "▲"
sPaddleCapB1: .asciz "▼" 
sPaddleCapT2: .asciz "△"
sPaddleCapB2: .asciz "▽"
sPaddleCapT3: .asciz "∆"
sPaddleCapB3: .asciz "∇"

sPaddle1:    .asciz "▓"
sPaddle2:    .asciz "▐"
sPaddle3:    .asciz "░"
sPaddle4:    .asciz "▒"
sPaddle5:    .asciz "▓"

sBorder1:    .asciz "#"
sBorder1:    .asciz "◘"
sBorder1:    .asciz "◙"

.ALIGN 4
.TEXT

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): char * argv[]                        │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
FALSE=0
main:
    STMFD sp!, {r4-r12,lr}          @ Keep 8byte aligned
    MOV fp, sp
    
    SUB sp, sp, #12                 @ Make room for max_y and max_x
                                    @ fp-4 = max_x; fp-8 = max_y
                                    @ fp-12 = direction
    max_x=-4; max_y=-8;             @ offset for max_x and max_y from the fp
    MOV   r0, #0                    @ max_x = 0;
    MOV   r1, #0                    @ max_y = 0;
    MOV   r2, #1
    STMFD fp, {r0,r1,r2}            @ store it.

    LDR r4, =DELAY                  @ Loads the delay time 
    LDR r4, [r4]                    
    LDR r5, =sO                     @ and the "ball" string
    MOV r6, #0
    
    BL initscr                      @ Call the initialization functions
    BL noecho
    MOV r0, #FALSE
    BL curs_set
    
    BL getmaxxy   
    STR r0, [fp,#-4]               @ max_x = r0
    STR r1, [fp,#-8]               @ max_y = r1
    MOV r7, r0
    MOV r8, r1
    MOV r9, #1

    .Linf_while:
        BL clear
        
        MOV r0, #0
        MOV r1, r6
        MOV r2, r5
        BL mvprintw

        BL refresh

        MOV r0, r4
        BL usleep

        BL getmaxxy   
        MOV r7, r0
        MOV r8, r1

        CMP r6, r7
            MOVGE r9, #-1
            BGE .Lmov

        MOV r0, #0
        CMP r6, r0
            MOVLE r9, #1
        .Lmov:
            ADD r6, r6, r9
    BAL .Linf_while

    BL endwin
.Lmain_end:
    MOV sp, fp
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ getmaxxy()                                      │
@│ return r0,r1: x,y                               │
@└─────────────────────────────────────────────────┘  
.FUNC getmaxxy 
getmaxxy:
    STMFD sp!, {r4,lr}          @ Keep 8byte aligned

    LDR  r2, =stdscr                @ getmaxyx get the screens dimentions
    LDR  r2, [r2]                   @ Looks like stdscr points to a 64bit number. 2 words. The demensions are in the lower word.

    LDRH r0, [r2, #6]               @ The first half of the word is x
    SXTH r0, r0
    ADD  r0, r0, #1

    LDRH r1, [r2, #4]               @ the lower half is y
    SXTH r1, r1
    ADD  r1, r1, #1
    
.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,lr}
    BX lr
.ENDFUNC