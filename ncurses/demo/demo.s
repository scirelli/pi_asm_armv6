@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    demo.s                                                   │
@│ Main ncurses demo.                                                          │
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.data
.section	.rodata
DELAY:      .word 30000

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
sBall19:    .asciz "●"
sBall20:    .asciz "◑"
sBall21:    .asciz "◇"
sBall22:    .asciz "◊"
sBall23:    .asciz "○"
sBall24:    .asciz "◎"
sBall25:    .asciz "☺"
sBall26:    .asciz "☻"
sBall27:    .asciz "☼"
sBall28:    .asciz "★"
sBall29:    .asciz "☆"
sBall30:    .asciz "◆"
sBall31:    .asciz "◐"

Padding:
sPaddleCapT1: .asciz "▲"
sPaddleCapB1: .asciz "▼" 
sPaddleCapT2: .asciz "△"
sPaddleCapB2: .asciz "▽"
sPaddleCapT3: .asciz "∆"
sPaddleCapB3: .asciz "∇"

Paddles:
sPaddle1:    .asciz "▓"
sPaddle2:    .asciz "▐"
sPaddle3:    .asciz "░"
sPaddle4:    .asciz "▒"
sPaddle5:    .asciz "▓"

Borders:
sBorder1:    .asciz "#"
sBorder2:    .asciz "◘"
sBorder3:    .asciz "◙"
sBorder4:    .asciz "H"
sBorder5:    .asciz "X"

sBLANK:      .ascii "\0"
sSPACE:      .asciz " "

.ALIGN 4
.TEXT

@ Keys
KEY_END=0550
KEY_EXIT=0551
KEY_SPACE=0x20
KEY_ESC=0x1B


@ Alias some stuff
BORDER=sBorder1
BALL=sBall1
EXIT_KEY=KEY_ESC

@############# Macros ######################
@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ DRAWBALL()                                      │
@│ param(p0): int: x position.                     │
@│ param(p1): int: y position.                     │
@│ param(p2): *char: The ball string.              │
@│ return null                                     │
@└─────────────────────────────────────────────────┘  
.MACRO DRAWBALL $p0 $p1 $p2
    MOV r0, \$p1  @ y
    MOV r1, \$p0  @ x
    MOV r2, \$p2
    BL mvprintw
.ENDM
@###########################################

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): char * argv[]                        │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
FALSE=0
NULL=0
TRUE=1
main:
    STMFD sp!, {r4-r12,lr}          @ Keep 8byte aligned
    MOV fp, sp
                                    @ max_x,max_y,dirx,diry,x,y
    SUB sp, sp, #20                 @ Make room for max_y and max_x, and direction x and y. See EOF for pic of the stack, for a refresher.
                                    @ fp-4 = max_x; fp-8 = max_y
                                    @ fp-12 = direction
    max_x=-4;  max_y=-8;            @ offset for max_x and max_y from the fp
    dir_x=-12; dir_y=-16;           @ offset for dir_x, dir_y from the fp
    MOV   r0, #1                    @ dir_y
    MOV   r1, #1                    @ dir_x = 1;
    MOV   r2, #0                    @ max_y = 0;
    MOV   r3, #0                    @ max_x = 0;
    STMDB fp, {r0,r1,r2,r3}         @ store it. with out write back, so fp does not move.
                                    @ STMDB = STMFD. When this is written it's written r2,r1,r0 in memory. This then looks correct when looking up from the sp. SP see the values from r0,r1,r2
    LDR r4, =DELAY                  @ Loads the delay time. &delay
    LDR r4, [r4]                    @ delay's value.

                                    @ Setup ncurses 
    BL initscr                      @ Call the initialization functions. Returns a WINDOW *w
    MOV r1, #TRUE
    BL nodelay                      @ nodelay( w, TRUE );
    BL noecho                       @ Turns off char echoing when users types a key
    BL cbreak                       @ How ctrl+z ctrl+c are handle. raw() passes them directly to the program instead of interpreting them first

    MOV r0, #FALSE                  @ Hide the cursor.
    BL curs_set

    LDR r0, =stdscr
    MOV r1, #TRUE
    BL keypad                       @ Allows function keys like F1 and arrow keys

    BL getmaxxy   
    STR r0, [fp,#max_x]             @ max_x = r0
    STR r1, [fp,#max_y]             @ max_y = r1
    MOV r9, r0                      @ max_x
    MOV r10, r1                     @ max_y

    MOV r5, #2                      @ x: start it at x=2
    MOV r6, #2                      @ y: start it at y=2
    
    LDR r7, [fp,#dir_x]             @ dir_x
    LDR r8, [fp,#dir_y]             @ dir_y

    BL clear
    
    LDR r0, =BORDER             @ get the address of the boarder string. &border
    BL drawBorder
    .Linf_while:
        LDR r2, =sSPACE
        DRAWBALL r5,r6,r2

        ADD r5, r5, r7              @ Move the ball in some dirction
        ADD r6, r6, r8              @ x+1,y+1

        CMP   r5, r9                @ Make sure x position stays within the screen
        MVNGE r7, r7                @ Make sure x<max_x. If x>=max_x reverse direction. negate the number
        ADDGE r7, r7, #1
        SUBGE r5, r9, #1            @ and set x < max_x

        CMP r5, #0                  @ Make sure x position stays within the screen
        MVNLE r7, r7                @ If x<=0 reverse direction
        ADDLE r7, r7, #1            @ If x<=0 reverse direction
        MOVLE r5, #1                @ and set x > 0

        CMP r6, r10                 @ Make sure y position stays within the screen
        MVNGE r8, r8                @ If y>= max_y reverse direction
        ADDGE r8, r8, #1
        SUBGE r6, r10, #1            @ set y<max_y

        CMP r6, #0                  @ Make sure y position stays within the screen
        MVNLE r8, r8                @ If y<=0 reverse direction
        ADDLE r8, r8, #1
        MOVLE r6, #1                @ and set y > 0

        LDR r2, =BALL               @ get the address of teh ball string. &ball
        DRAWBALL r5,r6,r2

        BL refresh

        MOV r0, r4                  @ r4 is DELAY 
        BL usleep
        BL getch
        CMP r0, #EXIT_KEY
    BNE .Linf_while

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
    @ ADD  r0, r0, #1

    LDRH r1, [r2, #4]               @ the lower half is y
    SXTH r1, r1
    @ ADD  r1, r1, #1
    
.Lgetmaxxy_end:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ drawBorder()                                    │
@│ param(r0): optional. char to use.               │
@│ return                                          │
@└─────────────────────────────────────────────────┘  
.FUNC drawBorder
drawBorder:
    STMFD sp!, {r4-r8,lr}       @ Keep 8byte aligned

    MOV r4, r0                  @ Back up the char

    BL getmaxxy
    MOV r5, r0                  @ max_x
    MOV r6, r1                  @ max_y

    MOV r7, #0                  @ loop index
    .Lhorizontal:
        MOV r0, #0  @ y
        MOV r1, r7  @ x
        MOV r2, r4
        BL mvprintw

        MOV r0, r6  @ y
        MOV r1, r7  @ x
        MOV r2, r4
        BL mvprintw

        ADD r7, r7, #1
    CMP r7, r5
    BLS .Lhorizontal 

    MOV r7, #0                  @ loop index
    .Lvertical:
        MOV r0, r7  @ y
        MOV r1, #0  @ x
        MOV r2, r4
        BL mvprintw

        MOV r0, r7  @ y
        MOV r1, r5  @ x
        MOV r2, r4
        BL mvprintw

        ADD r7, r7, #1
    CMP r7, r6
    BLS .Lvertical
.Lend:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r8,pc}
.ENDFUNC





@####################################################################################
@##################################### Notes ########################################
@####################################################################################
@
@ 
@ Bit=1, Nibble = 4bits, Byte = 8bits, Halfword = 16bits, Word = 32bits, Doubleword = 64bits*/
@ Memory is address in byte blocks
@
@    MOV fp, sp
@    
@    SUB sp, sp, #12                 @ Make room for max_y and max_x, and direction. See EOF for pic of the stack, for a refresher.
                                     @ fp-4 = max_x; fp-8 = max_y
                                     @ fp-12 = direction
@    max_x=-4; max_y=-8;             @ offset for max_x and max_y from the fp
@    MOV   r0, #1                    @ max_x = 0;
@    MOV   r1, #0                    @ max_y = 0;
@    MOV   r2, #0
@    STMDB fp, {r0,r1,r2}            @ store it. with out write back, so fp does not move.
                                     @ STMDB = STMFD. When this is written it's written r2,r1,r0 in memory. This then looks correct when looking up from the sp. SP see the values from r0,r1,r2
@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│What the stack looks like at the start of the program.  │
@└────────────────────────────────────────────────────────┘
@           ┍━━━━━━┑  
@           ├──────┤ ---------------------
@ 0xbefff170│ 0xXX │ <-SP(r13), FP(r11)                     Some notes for addressing. For a full stack you don't count the byte you are on.
@           ├──────┤ --------------------- byte             
@ 0xbefff16f│ 0x00 │
@           ├──────┤ --------------------- Halfword
@ 0xbefff16e│ 0x00 │ 
@           ├──────┤
@ 0xbefff16d│ 0x00 │
@           ├──────┤ --------------------- Word
@ 0xbefff16c│ 0x00 │ max_x= FP-4                            But when you write to an address, you start at the byte the address is pointing at.
@           ├──────┤
@ 0xbefff16b│ 0x00 │
@           ├──────┤
@ 0xbefff16a│ 0x00 │
@           ├──────┤
@ 0xbefff169│ 0x00 │
@           ├──────┤
@ 0xbefff168│ 0x00 │ max_y= FP-8
@           ├──────┤
@ 0xbefff167│ 0x01 │
@           ├──────┤
@ 0xbefff166│ 0x00 │
@           ├──────┤
@ 0xbefff165│ 0x00 │   
@           ├──────┤
@ 0xbefff164│ 0x00 │ <-SP(r13) direction= FP-12   
@           ├──────┤
@ 0xbefff163│      │   
@           ├──────┤
@ 0xbefff162│      │   
@           ├──────┤
@ 0xbefff161│      │   
@           ├──────┤
@ 0xbefff160│      │     
@           ├──────┤
@ 0xbefff15f│      │
@           ├──────┤
@ 0xbefff15e│      │
@           ├──────┤
@ 0xbefff15d│      │
@           ├──────┤
@ 0xbefff15c│      │   
@           ├──────┤
@ 0xbefff15b│      │    
@           ├──────┤
@ 0xbefff15a│      │   
@           ├──────┤
@ 0xbefff159│      │   
@           ├──────┤
@ 0xbefff158│      │
@           ├──────┤
@ 0xbefff157│      │
@           ├──────┤
@ 0xbefff156│      │   
@           ├──────┤
@ 0xbefff155│      │    
@           ├──────┤
@ 0xbefff154│      │   
@           ├──────┤
@ 0xbefff153│      │   
@           ├──────┤
@ 0xbefff152│      │
@           ├──────┤
@ 0xbefff151│      │
@           ├──────┤
@ 0xbefff150│      │   
@           ├──────┤
@ 0xbefff14f│      │    
@           ├──────┤
@ 0xbefff14e│      │   
@           ├──────┤
@ 0xbefff14d│      │   
@           ├──────┤
@ 0xbefff14c│      │   
@           ├──────┤
@ 0xbefff14b│      │   
@           └──────┘
@
