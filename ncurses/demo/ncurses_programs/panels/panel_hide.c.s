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
	.file	"panel_hide.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Show or Hide a window with 'a'(first window)  'b'(S"
	.ascii	"econd Window)  'c'(Third Window)\000"
	.align	2
.LC1:
	.ascii	"F1 to Exit\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	bl	initscr
	bl	start_color
	bl	cbreak
	bl	noecho
	ldr	r3, .L16
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
	sub	r3, fp, #24
	mov	r0, r3
	mov	r1, #3
	bl	init_wins
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	new_panel
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	sub	r3, fp, #48
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	ldr	r2, [fp, #-32]
	sub	r3, fp, #48
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	ldr	r2, [fp, #-28]
	sub	r3, fp, #48
	add	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	bl	update_panels
	ldr	r3, .L16
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L16+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #3
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L16+8
	bl	mvprintw
	ldr	r3, .L16+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L16+12
	bl	mvprintw
	ldr	r3, .L16
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	bl	doupdate
	b	.L2
.L13:
	ldr	r3, [fp, #-8]
	cmp	r3, #98
	beq	.L5
	cmp	r3, #99
	beq	.L6
	cmp	r3, #97
	bne	.L3
.L4:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	bl	panel_userptr
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L7
	ldr	r3, [fp, #-36]
	mov	r0, r3
	bl	hide_panel
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L3
.L7:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	bl	show_panel
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L3
.L5:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	panel_userptr
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L9
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	hide_panel
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L3
.L9:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	show_panel
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L3
.L6:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	panel_userptr
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L11
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	hide_panel
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L15
.L11:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	show_panel
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #0]
.L15:
	mov	r0, r0	@ nop
.L3:
	bl	update_panels
	bl	doupdate
.L2:
	ldr	r3, .L16
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wgetch
	str	r0, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, .L16+16
	cmp	r2, r3
	bne	.L13
	bl	endwin
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L17:
	.align	2
.L16:
	.word	stdscr
	.word	LINES
	.word	.LC0
	.word	.LC1
	.word	265
	.size	main, .-main
	.section	.rodata
	.align	2
.LC2:
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
	b	.L19
.L20:
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
	ldr	r1, .L21
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
.L19:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	blt	.L20
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC2
	.size	init_wins, .-init_wins
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
	beq	.L24
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #8]
	sxth	r3, r3
	b	.L25
.L24:
	mvn	r3, #0
.L25:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L26
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #10]
	sxth	r3, r3
	b	.L27
.L26:
	mvn	r3, #0
.L27:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L28
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L29
.L28:
	mvn	r3, #0
.L29:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L30
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L31
.L30:
	mvn	r3, #0
.L31:
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
	beq	.L33
	ldr	r3, .L38
	ldr	r3, [r3, #464]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L33:
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, #1
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L35
	ldr	r3, .L38
	ldr	r2, [r3, #452]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	whline
.L35:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, r3
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L37
	ldr	r3, .L38
	ldr	r3, [r3, #468]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L37:
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
.L39:
	.align	2
.L38:
	.word	acs_map
	.size	win_show, .-win_show
	.section	.rodata
	.align	2
.LC3:
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
	bne	.L41
	ldr	r3, .L49
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
.L41:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	b	.L43
.L42:
	mvn	r3, #0
.L43:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L44
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #2]
	sxth	r3, r3
	b	.L45
.L44:
	mvn	r3, #0
.L45:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
.L46:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L47
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
.L47:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L48
	mov	r3, #80
	str	r3, [fp, #-36]
.L48:
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
	ldr	r3, .L49+4
	bl	mvwprintw
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #8]
	mov	r2, #0
	bl	wattr_off
	ldr	r3, .L49
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L50:
	.align	2
.L49:
	.word	stdscr
	.word	.LC3
	.size	print_in_middle, .-print_in_middle
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
