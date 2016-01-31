	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"panel_resize.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Use 'm' for moving, 'r' for resizing\000"
	.align	2
.LC1:
	.ascii	"Use tab to browse through the windows (F1 to Exit)\000"
	.align	2
.LC2:
	.ascii	"Entered Resizing :Use Arrow Keys to resize and pres"
	.ascii	"s <ENTER> to end resizing\000"
	.align	2
.LC3:
	.ascii	"Entered Moving: Use Arrow Keys to Move and press <E"
	.ascii	"NTER> to end moving\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-36]
	bl	initscr
	bl	start_color
	bl	cbreak
	bl	noecho
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1
	bl	keypad
	mov	r0, #1
	mov	r1, #1
	mov	r2, #0
	bl	init_pair
	mov	r0, #2
	mov	r1, #2
	mov	r2, #0
	bl	init_pair
	mov	r0, #3
	mov	r1, #4
	mov	r2, #0
	bl	init_pair
	mov	r0, #4
	mov	r1, #6
	mov	r2, #0
	bl	init_pair
	sub	r3, fp, #60
	mov	r0, r3
	mov	r1, #3
	bl	init_wins
	ldr	r3, [fp, #-60]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-56]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-52]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-64]
	sub	r3, fp, #72
	mov	r0, r3
	mov	r1, #3
	bl	set_user_ptrs
	bl	update_panels
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #3
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+8
	bl	mvprintw
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+12
	bl	mvprintw
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	bl	doupdate
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	panel_userptr
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-28]
	b	.L2
.L24:
	ldr	r3, [fp, #-40]
	cmp	r3, #114
	beq	.L7
	cmp	r3, #114
	bgt	.L12
	cmp	r3, #10
	beq	.L5
	cmp	r3, #109
	beq	.L6
	cmp	r3, #9
	beq	.L4
	b	.L3
.L12:
	ldr	r2, .L31+16
	cmp	r3, r2
	beq	.L9
	ldr	r2, .L31+16
	cmp	r3, r2
	bgt	.L13
	ldr	r2, .L31+20
	cmp	r3, r2
	beq	.L8
	b	.L3
.L13:
	cmp	r3, #260
	beq	.L10
	ldr	r2, .L31+24
	cmp	r3, r2
	beq	.L11
	b	.L3
.L4:
	ldr	r0, [fp, #-12]
	bl	panel_userptr
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #100]
	mov	r0, r3
	bl	top_panel
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #100]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	panel_userptr
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-28]
	b	.L3
.L7:
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+28
	bl	mvprintw
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	b	.L3
.L6:
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+32
	bl	mvprintw
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L3
.L10:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L14
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L26
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L26
.L11:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L16
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L16:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L27
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L27
.L9:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L18
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L18:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L28
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L28
.L8:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L20
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L20:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L29
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L29
.L5:
	ldr	r3, .L31
	ldr	r2, [r3, #0]
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	bl	wmove
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wclrtoeol
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L22
	ldr	r0, [fp, #-12]
	bl	panel_window
	str	r0, [fp, #-44]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	bl	newwin
	str	r0, [fp, #-48]
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-48]
	bl	replace_panel
	ldr	r3, [fp, #-8]
	add	r2, r3, #16
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #96]
	ldr	r0, [fp, #-48]
	mov	r1, r2
	mov	r2, r3
	bl	win_show
	ldr	r0, [fp, #-44]
	bl	delwin
	mov	r3, #0
	str	r3, [fp, #-32]
.L22:
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	bne	.L30
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	bl	move_panel
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L30
.L26:
	mov	r0, r0	@ nop
	b	.L3
.L27:
	mov	r0, r0	@ nop
	b	.L3
.L28:
	mov	r0, r0	@ nop
	b	.L3
.L29:
	mov	r0, r0	@ nop
	b	.L3
.L30:
	mov	r0, r0	@ nop
.L3:
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #3
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+8
	bl	mvprintw
	ldr	r3, .L31+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L31+12
	bl	mvprintw
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	bl	update_panels
	bl	doupdate
.L2:
	ldr	r3, .L31
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wgetch
	str	r0, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, .L31+36
	cmp	r2, r3
	bne	.L24
	bl	endwin
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L32:
	.align	2
.L31:
	.word	stdscr
	.word	LINES
	.word	.LC0
	.word	.LC1
	.word	259
	.word	258
	.word	261
	.word	.LC2
	.word	.LC3
	.word	265
	.size	main, .-main
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Window Number %d\000"
	.text
	.align	2
	.global	init_wins
	.type	init_wins, %function
init_wins:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #108
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	mov	r3, #2
	str	r3, [fp, #-20]
	mov	r3, #10
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L34
.L35:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-112]
	add	r4, r2, r3
	mov	r0, #10
	mov	r1, #40
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	bl	newwin
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	sub	r2, fp, #104
	mov	r0, r2
	ldr	r1, .L36
	mov	r2, r3
	bl	sprintf
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-112]
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	sub	r2, fp, #104
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	win_show
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #7
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L34:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	blt	.L35
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L37:
	.align	2
.L36:
	.word	.LC4
	.size	init_wins, .-init_wins
	.align	2
	.global	set_user_ptrs
	.type	set_user_ptrs, %function
set_user_ptrs:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #120
	str	r0, [fp, #-120]
	str	r1, [fp, #-124]
	ldr	r3, [fp, #-124]
	mov	r0, r3
	mov	r1, #104
	bl	calloc
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L39
.L50:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-120]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	panel_window
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L40
	ldr	r3, [fp, #-16]
	ldrh	r3, [r3, #8]
	sxth	r3, r3
	b	.L41
.L40:
	mvn	r3, #0
.L41:
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-16]
	ldrh	r3, [r3, #10]
	sxth	r3, r3
	b	.L43
.L42:
	mvn	r3, #0
.L43:
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L44
	ldr	r3, [fp, #-16]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L45
.L44:
	mvn	r3, #0
.L45:
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [fp, #-16]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L47
.L46:
	mvn	r3, #0
.L47:
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	sub	r2, fp, #112
	mov	r0, r2
	ldr	r1, .L51
	mov	r2, r3
	bl	sprintf
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	add	r2, r3, #16
	sub	r3, fp, #112
	mov	r0, r2
	mov	r1, r3
	bl	strcpy
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r2, r2, #1
	str	r2, [r3, #96]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bne	.L48
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-120]
	ldr	r2, [r2, #0]
	str	r2, [r3, #100]
	b	.L49
.L48:
	ldr	r3, [fp, #-8]
	mov	r2, #104
	mul	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r2, r2, #1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-120]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #100]
.L49:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-120]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r1, #104
	mul	r3, r1, r3
	ldr	r1, [fp, #-12]
	add	r3, r1, r3
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L39:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	blt	.L50
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L52:
	.align	2
.L51:
	.word	.LC4
	.size	set_user_ptrs, .-set_user_ptrs
	.align	2
	.global	win_show
	.type	win_show, %function
win_show:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L54
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #8]
	sxth	r3, r3
	b	.L55
.L54:
	mvn	r3, #0
.L55:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #10]
	sxth	r3, r3
	b	.L57
.L56:
	mvn	r3, #0
.L57:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L58
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L59
.L58:
	mvn	r3, #0
.L59:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L60
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L61
.L60:
	mvn	r3, #0
.L61:
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp, #8]
	mov	r3, #0
	str	r3, [sp, #12]
	mov	r3, #0
	str	r3, [sp, #16]
	ldr	r0, [fp, #-24]
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	wborder
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, #0
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L63
	ldr	r3, .L68
	ldr	r3, [r3, #464]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L63:
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, #1
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L65
	ldr	r3, .L68
	ldr	r2, [r3, #452]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	whline
.L65:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, r3
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L67
	ldr	r3, .L68
	ldr	r3, [r3, #468]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L67:
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #8
	ldr	r2, [fp, #-28]
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	ldr	r0, [fp, #-24]
	mov	r1, #1
	mov	r2, #0
	ldr	r3, [fp, #-20]
	bl	print_in_middle
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L69:
	.align	2
.L68:
	.word	acs_map
	.size	win_show, .-win_show
	.section	.rodata
	.align	2
.LC5:
	.ascii	"%s\000"
	.text
	.align	2
	.global	print_in_middle
	.type	print_in_middle, %function
print_in_middle:
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L71
	ldr	r3, .L79
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
.L71:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	b	.L73
.L72:
	mvn	r3, #0
.L73:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #2]
	sxth	r3, r3
	b	.L75
.L74:
	mvn	r3, #0
.L75:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
.L76:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L77
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
.L77:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L78
	mov	r3, #80
	str	r3, [fp, #-36]
.L78:
	ldr	r0, [fp, #4]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	mov	r2, r3, lsr #31
	add	r3, r2, r3
	mov	r3, r3, asr #1
	fmsr	s14, r3	@ int
	fsitos	s15, s14
	fsts	s15, [fp, #-20]
	flds	s15, [fp, #-20]
	ftosizs	s15, s15
	fmrs	r2, s15	@ int
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #8]
	mov	r2, #0
	bl	wattr_on
	ldr	r3, [fp, #4]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, .L79+4
	bl	mvwprintw
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #8]
	mov	r2, #0
	bl	wattr_off
	ldr	r3, .L79
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L80:
	.align	2
.L79:
	.word	stdscr
	.word	.LC5
	.size	print_in_middle, .-print_in_middle
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
