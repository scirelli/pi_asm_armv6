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
sPaddle:     .asciz "/\\\n||\n||\n||\n||\n||\n\\/"

Borders:
sBorder1:    .asciz "#"
sBorder2:    .asciz "◘"
sBorder3:    .asciz "◙"
sBorder4:    .asciz "H"
sBorder5:    .asciz "X"

sBLANK:      .ascii "\0"
sSpace:      .asciz " "

.ALIGN 4
.TEXT

@ Keys
KEY_END=0550
KEY_EXIT=0551
KEY_SPACE=0x20
KEY_ESC=0x1B


@ Alias some stuff
BORDER=0x23
PADDLE=sPaddle
BALL=0x4F
SPACE=0x20
EXIT_KEY=KEY_ESC

@############# Objects ######################
Ball_sz=20 @ sizeOf(Ball) = 20
ball_x=0
ball_y=4
ball_vX=8
ball_vY=12
ball_char=16
@############################################

@############# Macros ######################
@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ DRAWBALL()                                      │
@│ Uses registers r0, r1 and r2.                   │
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

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ INIT_NCURSES                                    │
@│ Uses registers r0 and r1                        │
@│ Runs some initialization of ncurses.            │
@└─────────────────────────────────────────────────┘  
.MACRO INIT_NCURSES
                                    @ Setup ncurses 
    BL initscr                      @ Call the initialization functions. Returns a WINDOW *w
    MOV r1, #TRUE
    BL nodelay                      @ nodelay( w, TRUE );
    BL noecho                       @ Turns off char echoing when users types a key
    BL cbreak                       @ How ctrl+z ctrl+c are handle. raw() passes them directly to the program instead of interpreting them first
    BL start_color
    MOV r0, #FALSE                  @ Hide the cursor.
    BL curs_set
.ENDM
@###########################################

.ALIGN	2
.Lstdscr: .WORD stdscr

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
                                    @ max_x,max_y,counter,boardInnerCharCnt
    SUB sp, sp, #56                 @ Make room for max_y and max_x, dir_x, dir_y, counter, and boardInnerCharCnt. See EOF for pic of the stack, for a refresher.
                                    @ fp-4 = max_x; fp-8 = max_y
                                    @ fp-12 = counter; fp-16 = boardInnerCharCnt
                                    @ fp-36 = ball1; fp-56 = ball2
    max_x=-4;  max_y=-8;            @ Create constants for offsets of the variables from the fp
    counter=-12;
    boardInnerCharCnt=-16;
    ball1=-36; ball2=-56; 
                                    @ Initcialize the vairables
    MOV   r0, #0                    @ boardInnerCharCnt = 0;
    MOV   r1, #0                    @ counter = 0;
    MOV   r2, #0                    @ max_y = 0;
    MOV   r3, #0                    @ max_x = 0;
    STMDB fp, {r0-r3}               @ Store it. with out write back, so fp does not move.
                                    @ STMDB = STMFD. When this is written it's written r5,r4,r3,r2,r1,r0 in memory. This then looks correct when looking up from the sp. SP see the values from r0,r1,r2,r3,r4,r5
    
    ADD r0, fp, #ball1              @ &ball1
    MOV r1, #0                      @ x
    MOV r2, #0                      @ y
    MOV r3, #1                      @ vx
    MOV r4, #1                      @ vy
    MOV r5, #BALL                   @ Ball char
    STMEA r0, {r1,r2,r3,r4,r5}

    ADD r0, fp, #ball2              @ &ball2
    MOV r1, #0                      @ x
    MOV r2, #0                      @ y
    MOV r3, #1                      @ vx
    MOV r4, #1                      @ vy
    MOV r5, #SPACE                  @ Ball char
    STMEA r0, {r1,r2,r3,r4,r5}

    LDR r4, =DELAY                  @ Loads the delay time. &delay
    LDR r4, [r4]                    @ Get delay's value.

    INIT_NCURSES                    @ Setup ncurses.

    LDR r0, .Lstdscr               @stdscr is the default window created by the library. Whenever a window is not referenced the library assumes stdscr
    LDR r0, [r0]
    MOV r1, #TRUE
    BL keypad                       @ Allows function keys like F1 and arrow keys
    
    BL getmaxxy   
    STR r0, [fp,#max_x]             @ max_x = r0
    STR r1, [fp,#max_y]             @ max_y = r1
    MOV r5, r0                      @ max_x
    MOV r6, r1                      @ max_y

    ADD r0, fp, #ball2              @ &ball2
    MOV r1, #-1
    STR r5, [r0, #ball_x]
    STR r1, [r0, #ball_vY]
                                    @ Get the number of characters inside the boarder
    SUB r0, r5, #1                  @ Don't include the border
    SUB r1, r6, #1
    MUL r2, r0, r1
    STR r2, [fp, #boardInnerCharCnt]

    ADD r0, fp, #ball1              
    MOV r1, #1                      @ x: start it at x=2, y=2
    STR r1, [r0,#ball_x]
    STR r1, [r0,#ball_y]

    BL clear
    
    @LDR r0, =BORDER                 @ get the address of the boarder string. &border
    @BL drawBorder

    LDR r0, .Lstdscr
    LDR r0, [r0]
    MOV r1, #0
    MOV r2, #0
    MOV r3, #0
    STR r3, [sp, #-4]!
    STR r3, [sp, #-4]!
    STR r3, [sp, #-4]!
    STR r3, [sp, #-4]!
    STR r3, [sp, #-4]!             @             1       2    3    4   5   6   7   8   9
    BL wborder                     @ wborder(local_win, ' ', ' ', ' ',' ',' ',' ',' ',' ');
    @BL box     

    LDR r7, [fp,#counter]
    LDR r8, [fp,#boardInnerCharCnt]

                                   @ r4=DELAY; r5=max_x; r6=max_y; r7=counter; r8=boardInnerCharCnt
    .Linf_while:
        CMP r7, r8
          BLO .Lif_counter_LessThan_BoardInnerCharCnt
            ADD r0, fp, #ball2
            MOV r1, r5
            MOV r2, r6
            BL moveBall
            BL drawBall
        .Lif_counter_LessThan_BoardInnerCharCnt:

        ADD r0, fp, #ball1         @ Calculate the address of ball2
        MOV r1, r5
        MOV r2, r6
        BL moveBall
        BL drawBall

        BL refresh

        MOV r0, r4                 @ r4 is DELAY 
        BL usleep
        BL getch
        
        ADDS  r7, r7, #1           @counter++
            MOVVS r7, #0           @MOV if overflow

    CMP r0, #EXIT_KEY
    BNE .Linf_while

.Lmain_end:
    BL endwin
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
        @BL mvprintw
        BL mvaddch

        MOV r0, r6  @ y
        MOV r1, r7  @ x
        MOV r2, r4
        @BL mvprintw
        BL mvaddch

        ADD r7, r7, #1
    CMP r7, r5
    BLS .Lhorizontal 

    MOV r7, #0                  @ loop index
    .Lvertical:
        MOV r0, r7  @ y
        MOV r1, #0  @ x
        MOV r2, r4
        @BL mvprintw
        BL mvaddch

        MOV r0, r7  @ y
        MOV r1, r5  @ x
        MOV r2, r4
        @BL mvprintw
        BL mvaddch

        ADD r7, r7, #1
    CMP r7, r6
    BLS .Lvertical
.LdraowBorder_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r8,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ drawPaddle()                                    │
@│ param(r0): int x                                │
@│ param(r1): int y                                │
@│ param(r2):                                      │
@│ param(r3):                                      │
@│ return                                          │
@└─────────────────────────────────────────────────┘  
.FUNC drawPaddle
drawPaddle:
    STMFD sp!, {r4-r8,lr}       @ Keep 8byte aligned

    @BL getmaxxy
    @MOV r4, r0                  @ max_x
    @MOV r5, r1                  @ max_y
    
    MOV r0, #25
    MOV r1, #25
    LDR r2, =sPaddle
    BL mvprintw

.LdrawPaddle_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r8,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ drawBall()                                      │
@│ param(r0): the &ball.                           │
@│ return null                                     │
@└─────────────────────────────────────────────────┘  
.FUNC drawBall
drawBall:
    STMFD sp!, {r4,lr}           @ Keep 8byte aligned
    
    LDR r4, [r0, #ball_char]
    LDR r2, [r0, #ball_x]
    LDR r3, [r0, #ball_y]

    MOV r0, r3                   @ y
    MOV r1, r2                   @ x
    MOV r2, r4    
    BL mvaddch

.LdrawBall_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ moveBall()                                      │
@│ param(r0): &ball                                │
@│ param(r1): max_x                                │
@│ param(r2): max_y                                │
@│ return (r0): &ball                              │
@└─────────────────────────────────────────────────┘  
.FUNC moveBall
moveBall:
    STMFD sp!, {r4-r6,lr}           @ Keep 8byte aligned
    
    LDR r3, [r0, #ball_x]
    LDR r4, [r0, #ball_vX]
    LDR r5, [r0, #ball_y]
    LDR r6, [r0, #ball_vY]
                                @ Move the ball in some dirction
    ADD r3, r3, r4              @ x+vx
    ADD r5, r5, r6              @ y+vy
    STR r3, [r0, #ball_x]       @ x=x+vx
    STR r5, [r0, #ball_y]       @ y=y+vy

    CMP r3, r1                  @ Make sure x position stays within the screen
        MVNGE r4, r4            @ Make sure x<max_x. If x>=max_x reverse direction. negate the number
        ADDGE r4, r4, #1
        SUBGE r3, r1, #1        @ and set x < max_x
        STRGE r4, [r0, #ball_vX]
        STRGE r3, [r0, #ball_x]

    CMP r3, #0                  @ Make sure x position stays within the screen
        MVNLE r4, r4            @ If x<=0 reverse direction
        ADDLE r4, r4, #1        @ If x<=0 reverse direction
        MOVLE r3, #1            @ and set x > 0. 0 is the border
        STRLE r4, [r0, #ball_vX]@ Write it back to the ball
        STRLE r3, [r0, #ball_x]

    CMP r5, r2                  @ Make sure y position stays within the screen
        MVNGE r6, r6            @ If y>= max_y reverse direction
        ADDGE r6, r6, #1
        SUBGE r5, r2, #1       @ set y<max_y
        STRGE r6, [r0, #ball_vY]
        STRGE r5, [r0, #ball_y]

    CMP r5, #0                  @ Make sure y position stays within the screen
        MVNLE r6, r6            @ If y<=0 reverse direction
        ADDLE r6, r6, #1
        MOVLE r5, #1            @ and set y > 0
        STRLE r6, [r0, #ball_vY]
        STRLE r5, [r0, #ball_y]
.LmoveBall_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
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
