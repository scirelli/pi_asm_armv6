@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                    pong.s                                                   │
@│ Main ncurses demo.                                                          │
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.data
.section	.rodata
DELAY:      .word 30000

Balls:

Paddles:

Borders:

.ALIGN 4
.TEXT

@ Keys
KEY_END=0550
KEY_EXIT=0551
KEY_SPACE=0x20
KEY_ESC=0x1B

COLOR_BLACK=0
COLOR_RED=1
COLOR_GREEN=2
COLOR_YELLOW=3
COLOR_BLUE=4
COLOR_MAGENTA=5
COLOR_CYAN=6
COLOR_WHITE=7

@#define NCURSES_ATTR_SHIFT       8
@#define NCURSES_BITS(mask,shift) ((mask) << ((shift) + NCURSES_ATTR_SHIFT))
@#define COLOR_PAIR(n)	NCURSES_BITS(n, 0)

@ Alias some stuff
BORDER=0x23
PADDLE=sPaddle
BALL=0x4F
SPACE=0x20
EXIT_KEY=KEY_ESC

@############ Objects ######################
@┍━━━━━━━━━━━━━━━━┑
@│ Ball           │
@└────────────────┘  
Ball_sz=20 @ sizeOf(Ball) = 20
ball_x=0
ball_y=4
ball_vX=8
ball_vY=12
ball_char=16

@┍━━━━━━━━━━━━━━━━┑
@│ Paddle         │
@└────────────────┘  
Paddle_sz=28 @ sizeOf(Paddle)
paddle_x=0
paddle_y=4
paddle_vX=8
paddle_vY=12
paddle_window=16
paddle_char=20
paddle_corners_char=24
@###########################################

@############# Macros ######################
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
                                    @ max_x,max_y,counter
    SUB sp, sp, #84                 @ Make room for max_y and max_x, counter, boardInnerCharCnt, ball1, paddle1, and paddle2. See EOF for pic of the stack, for a refresher.
                                    @ fp-4 = max_x; fp-8 = max_y
                                    @ fp-12 = counter;
                                    @ fp-32 = ball1; 
                                    @ fp-60 = paddle1; fp-84 = paddle2;
    max_x=-4;  max_y=-8;            @ Create constants for offsets of the variables from the fp
    counter=-12;
    boardInnerCharCnt=-16;
    ball1=-32; 
    paddle1=-56; paddle2=-80;
                                    @ Initcialize the vairables
    MOV   r0, #0                    @ boardInnerCharCnt = 0;
    MOV   r1, #0                    @ counter = 0;
    MOV   r2, #0                    @ max_y = 0;
    MOV   r3, #0                    @ max_x = 0;
    STMDB fp, {r0-r3}               @ Store it. with out write back, so fp does not move.
                                    @ STMDB = STMFD. When this is written it's written r5,r4,r3,r2,r1,r0 in memory. This then looks correct when looking up from the sp. SP see the values from r0,r1,r2,r3,r4,r5
    
    INIT_NCURSES                    @ Setup ncurses.

    LDR r0, .Lstdscr                @ stdscr is the default window created by the library. Whenever a window is not referenced the library assumes stdscr
    LDR r0, [r0]
    MOV r1, #TRUE
    BL keypad                       @ Allows function keys like F1 and arrow keys
    
    BL getmaxxy   
    STR r0, [fp,#max_x]             @ max_x = r0
    STR r1, [fp,#max_y]             @ max_y = r1
    MOV r5, r0                      @ max_x
    MOV r6, r1                      @ max_y

                                    @ Get the number of characters inside the boarder
    SUB r0, r5, #1                  @ Don't include the border
    SUB r1, r6, #1
    MUL r2, r0, r1
    STR r2, [fp, #boardInnerCharCnt]
    
    MOV r1, r5, LSR #1              @ x=max_x/2
    MOV r2, r6, LSR #1              @ y=max_y/2
    ADD r0, fp, #ball1              @ &ball1
    MOV r3, #1                      @ vx
    MOV r4, #1                      @ vy
    MOV r5, #BALL                   @ Ball char
    STMEA r0, {r1,r2,r3,r4,r5}

    ADD r0, fp, #paddle1            @ &paddle1
    BL initPaddle

    ADD r0, fp, #paddle2            @ &paddle2
    BL initPaddle

    BL clear

    LDR r0, .Lstdscr
    LDR r0, [r0]
    MOV r1, #0
    MOV r2, #0
    BL box     

    LDR r4, =DELAY                  @ Loads the delay time. &delay
    LDR r4, [r4]                    @ Get delay's value.
    LDR r5, [fp,#max_x]
    LDR r6, [fp,#max_y]
    LDR r7, [fp,#counter]
    LDR r8, [fp,#boardInnerCharCnt]

    ADD r0, fp, #16-56
    wrefresh

                                   @ r4=DELAY; r5=max_x; r6=max_y; r7=counter; r8=boardInnerCharCnt
    .Linf_while:
        ADD r0, fp, #ball1         @ Calculate the address of ball2
        BL eraseBall
        MOV r1, r5
        MOV r2, r6
        BL moveBall
        BL drawBall

        BL refresh

        MOV r0, r4                 @ r4 is DELAY 
        BL usleep

        BL getch
        STR r0, [sp,#-4]!
        MOV r2, r0                 @ char
        SUB r0, r6, #1             @ y
        SUB r1, r5, #1             @ x
        BL mvaddch
        LDR r0, [sp], #4

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
@│ initPaddle()                                    │
@│ param(r0): &paddle                              │
@│ return (r0): &paddle                            │
@└─────────────────────────────────────────────────┘  
.FUNC initPaddle
initPaddle:
    STMFD sp!, {r0,r4-r8,lr}        @ Keep 8byte aligned
    
    MOV r8, r0                      @ back up paddle object
    MOV r0, #5                      @ newwin(height, width, starty, startx);
    MOV r1, #2
    MOV r2, #5
    MOV r3, #5
    BL newwin

    MOV r1, #5                      @ paddle_x
    MOV r2, #5                      @ paddle_y
    MOV r3, #1                      @ paddle_vX
    MOV r4, #1                      @ paddle_vY
    MOV r5, r0                      @ paddle_window 
    MOV r6, #NULL                   @ paddle_char
    MOV r7, #NULL                   @ paddle_corners_char
    STMEA r8, {r1-r7}

    MOV r1, #0                      @ box(local_win, 0 , 0); 0, 0 gives default characters for the vertical and horizontal lines
    MOV r2, #0
    BL box

    MOV r0, r5                      @ wrefresh(local_win); Show that box
    BL wrefresh
.LinitPaddle_End:
@─────────────────────────────────────────────────
    LDMFD sp!, {r0,r4-r8,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ movePaddle()                                    │
@│ param(r0): &paddle                              │
@│ param(r1): max_x                                │
@│ param(r2): max_y                                │
@│ return (r0): &paddle                            │
@└─────────────────────────────────────────────────┘  
.FUNC movePaddle
movePaddle:
    STMFD sp!, {r4-r6,lr}           @ Keep 8byte aligned
    
.LmovePaddle_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r6,pc}
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


.LdrawPaddle_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r8,pc}
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

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ drawBall()                                      │
@│ param(r0): the &ball.                           │
@│ return &ball                                    │
@└─────────────────────────────────────────────────┘  
.FUNC drawBall
drawBall:
    STMFD sp!, {r0,r4,r5,lr}           @ Keep 8byte aligned
    
    LDR r4, [r0, #ball_char]
    LDR r2, [r0, #ball_x]
    LDR r3, [r0, #ball_y]

    MOV r0, r3                   @ y
    MOV r1, r2                   @ x
    MOV r2, r4    
    BL mvaddch

.LdrawBall_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r0,r4,r5,pc}
.ENDFUNC

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ eraseBall()                                     │
@│ param(r0): the &ball.                           │
@│ return &ball                                    │
@└─────────────────────────────────────────────────┘  
.FUNC eraseBall
eraseBall:
    STMFD sp!, {r0,r4,r5,lr}           @ Keep 8byte aligned
    
    MOV r4, #KEY_SPACE
    LDR r2, [r0, #ball_x]
    LDR r3, [r0, #ball_y]

    MOV r0, r3                   @ y
    MOV r1, r2                   @ x
    MOV r2, r4    
    BL mvaddch
.LeraseBall_End:
 @─────────────────────────────────────────────────
    LDMFD sp!, {r0,r4,r5,pc}
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
