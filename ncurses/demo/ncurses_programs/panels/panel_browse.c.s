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
	.file	"panel_browse.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Use tab to browse through the windows (F1 to Exit)\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	bl	initscr
	bl	start_color
	bl	cbreak
	bl	noecho
	ldr	r3, .L7
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
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-36]
	mov	r0, r2
	mov	r1, r3
	bl	set_panel_userptr
	bl	update_panels
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_on
	ldr	r3, .L7+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r0, r3
	mov	r1, #0
	ldr	r2, .L7+8
	bl	mvprintw
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #1024
	mov	r2, #0
	bl	wattr_off
	bl	doupdate
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	bne	.L3
.L4:
	ldr	r0, [fp, #-8]
	bl	panel_userptr
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	top_panel
	mov	r0, r0	@ nop
.L3:
	bl	update_panels
	bl	doupdate
.L2:
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wgetch
	str	r0, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, .L7+12
	cmp	r2, r3
	bne	.L5
	bl	endwin
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L8:
	.align	2
.L7:
	.word	stdscr
	.word	LINES
	.word	.LC0
	.word	265
	.size	main, .-main
	.section	.rodata
	.align	2
.LC1:
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
	b	.L10
.L11:
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
	ldr	r1, .L12
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
.L10:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	blt	.L11
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L13:
	.align	2
.L12:
	.word	.LC1
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
	beq	.L15
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #8]
	sxth	r3, r3
	b	.L16
.L15:
	mvn	r3, #0
.L16:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #10]
	sxth	r3, r3
	b	.L18
.L17:
	mvn	r3, #0
.L18:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #4]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L20
.L19:
	mvn	r3, #0
.L20:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #6]
	sxth	r3, r3
	add	r3, r3, #1
	b	.L22
.L21:
	mvn	r3, #0
.L22:
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
	beq	.L24
	ldr	r3, .L29
	ldr	r3, [r3, #464]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L24:
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, #1
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L26
	ldr	r3, .L29
	ldr	r2, [r3, #452]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	whline
.L26:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r0, [fp, #-24]
	mov	r1, #2
	mov	r2, r3
	bl	wmove
	mov	r3, r0
	cmn	r3, #1
	beq	.L28
	ldr	r3, .L29
	ldr	r3, [r3, #468]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	waddch
.L28:
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
.L30:
	.align	2
.L29:
	.word	acs_map
	.size	win_show, .-win_show
	.section	.rodata
	.align	2
.LC2:
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
	bne	.L32
	ldr	r3, .L40
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
.L32:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	b	.L34
.L33:
	mvn	r3, #0
.L34:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L35
	ldr	r3, [fp, #-24]
	ldrh	r3, [r3, #2]
	sxth	r3, r3
	b	.L36
.L35:
	mvn	r3, #0
.L36:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
.L37:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
.L38:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L39
	mov	r3, #80
	str	r3, [fp, #-36]
.L39:
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
	ldr	r3, .L40+4
	bl	mvwprintw
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #8]
	mov	r2, #0
	bl	wattr_off
	ldr	r3, .L40
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	wrefresh
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L41:
	.align	2
.L40:
	.word	stdscr
	.word	.LC2
	.size	print_in_middle, .-print_in_middle
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
