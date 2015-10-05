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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"other_border.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	create_box.constprop.1, %function
create_box.constprop.1:
.LFB15:
	.file 1 "other_border.c"
	.loc 1 93 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI0:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r4, r0
	.loc 1 98 0
	ldmia	r0, {r6, r7}
.LVL1:
	.loc 1 103 0
	ldr	r5, .L35
	.loc 1 93 0
	sub	sp, sp, #12
.LCFI1:
	.cfi_def_cfa_offset 48
	.loc 1 103 0
	mov	r1, r7
	ldr	r0, [r5, #0]
.LVL2:
	mov	r2, r6
	.loc 1 99 0
	ldr	sl, [r4, #12]
.LVL3:
	.loc 1 100 0
	ldr	r8, [r4, #8]
.LVL4:
	.loc 1 103 0
	bl	wmove
.LVL5:
	cmn	r0, #1
	beq	.L2
	ldr	r0, [r5, #0]
	ldr	r1, [r4, #32]
	bl	waddch
.LVL6:
.L2:
	.loc 1 104 0
	add	r9, r6, sl
	ldr	r0, [r5, #0]
	mov	r1, r7
	mov	r2, r9
	bl	wmove
.LVL7:
	cmn	r0, #1
	beq	.L3
	ldr	r3, .L35
	ldr	r1, [r4, #36]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL8:
.L3:
	.loc 1 105 0
	add	fp, r7, r8
	ldr	r0, [r5, #0]
	mov	r1, fp
	mov	r2, r6
	bl	wmove
.LVL9:
	cmn	r0, #1
	beq	.L4
	ldr	r3, .L35
	ldr	r1, [r4, #40]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL10:
.L4:
	.loc 1 106 0
	ldr	r0, [r5, #0]
	mov	r1, fp
	mov	r2, r9
	bl	wmove
.LVL11:
	cmn	r0, #1
	beq	.L5
	ldr	r3, .L35
	ldr	r1, [r4, #44]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL12:
.L5:
	.loc 1 107 0
	add	r3, r6, #1
	mov	r2, r3
	ldr	r0, [r5, #0]
	mov	r1, r7
	str	r3, [sp, #4]
	bl	wmove
.LVL13:
	ldr	r3, [sp, #4]
	cmn	r0, #1
	beq	.L6
	ldr	r2, .L35
	ldr	r1, [r4, #24]
	ldr	r0, [r2, #0]
	sub	r2, sl, #1
	bl	whline
.LVL14:
	ldr	r3, [sp, #4]
.L6:
	.loc 1 108 0
	ldr	r0, [r5, #0]
	mov	r1, fp
	mov	r2, r3
	bl	wmove
.LVL15:
	cmn	r0, #1
	beq	.L7
	ldr	r3, .L35
	ldr	r1, [r4, #28]
	sub	r2, sl, #1
	ldr	r0, [r3, #0]
	bl	whline
.LVL16:
.L7:
	.loc 1 109 0
	add	r7, r7, #1
.LVL17:
	ldr	r0, [r5, #0]
	mov	r1, r7
	mov	r2, r6
	bl	wmove
.LVL18:
	cmn	r0, #1
	beq	.L8
	ldr	r3, .L35
	ldr	r1, [r4, #16]
	sub	r2, r8, #1
	ldr	r0, [r3, #0]
	bl	wvline
.LVL19:
.L8:
	.loc 1 110 0
	ldr	r0, [r5, #0]
	mov	r1, r7
	mov	r2, r9
	bl	wmove
.LVL20:
	cmn	r0, #1
	beq	.L9
	ldr	r3, .L35
	ldr	r1, [r4, #20]
	sub	r2, r8, #1
	ldr	r0, [r3, #0]
	bl	wvline
.LVL21:
.L9:
	.loc 1 118 0
	ldr	r0, [r5, #0]
	.loc 1 120 0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 118 0
	b	wrefresh
.LVL22:
.L36:
	.align	2
.L35:
	.word	stdscr
	.cfi_endproc
.LFE15:
	.size	create_box.constprop.1, .-create_box.constprop.1
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB11:
	.loc 1 20 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL23:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI2:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	sub	sp, sp, #52
.LCFI3:
	.cfi_def_cfa_offset 88
	.loc 1 27 0
	ldr	r4, .L91
	.loc 1 23 0
	bl	initscr
.LVL24:
	.loc 1 24 0
	bl	start_color
.LVL25:
	.loc 1 25 0
	bl	cbreak
.LVL26:
	.loc 1 27 0
	mov	r1, #1
	ldr	r0, [r4, #0]
	bl	keypad
.LVL27:
	.loc 1 28 0
	bl	noecho
.LVL28:
	.loc 1 29 0
	mov	r1, #6
	mov	r2, #0
	mov	r0, #1
	bl	init_pair
.LVL29:
.LBB16:
.LBB17:
	.loc 1 72 0
	ldr	r2, .L91+4
	.loc 1 70 0
	mov	r7, #3
	.loc 1 79 0
	mov	r3, #43
	.loc 1 72 0
	ldr	r1, [r2, #0]
	.loc 1 73 0
	ldr	r2, .L91+8
	.loc 1 72 0
	sub	r1, r1, #3
	.loc 1 75 0
	mov	lr, #124
	.loc 1 73 0
	ldr	r2, [r2, #0]
	.loc 1 72 0
	add	r6, r1, r1, lsr #31
	.loc 1 73 0
	sub	r2, r2, #10
	.loc 1 72 0
	mov	r6, r6, asr #1
	.loc 1 73 0
	add	r5, r2, r2, lsr #31
	.loc 1 77 0
	mov	ip, #45
	.loc 1 73 0
	mov	r5, r5, asr #1
.LBE17:
.LBE16:
	.loc 1 35 0
	mov	r1, #256
	mov	r2, #0
.LBB20:
.LBB18:
	.loc 1 70 0
	str	r7, [sp, #8]
.LBE18:
.LBE20:
	.loc 1 35 0
	ldr	r0, [r4, #0]
.LBB21:
.LBB19:
	.loc 1 71 0
	mov	r7, #10
	.loc 1 75 0
	str	lr, [sp, #16]
	.loc 1 76 0
	str	lr, [sp, #20]
	.loc 1 77 0
	str	ip, [sp, #24]
	.loc 1 78 0
	str	ip, [sp, #28]
	.loc 1 79 0
	str	r3, [sp, #32]
	.loc 1 80 0
	str	r3, [sp, #36]
	.loc 1 81 0
	str	r3, [sp, #40]
	.loc 1 82 0
	str	r3, [sp, #44]
.LVL30:
	.loc 1 73 0
	stmia	sp, {r5, r6}
	.loc 1 71 0
	str	r7, [sp, #12]
.LBE19:
.LBE21:
	.loc 1 35 0
	bl	wattr_on
.LVL31:
	.loc 1 36 0
	ldr	r0, .L91+12
	bl	printw
.LVL32:
	.loc 1 37 0
	ldr	r0, [r4, #0]
	bl	wrefresh
.LVL33:
	.loc 1 38 0
	mov	r1, #256
	mov	r2, #0
	ldr	r0, [r4, #0]
	bl	wattr_off
.LVL34:
	.loc 1 40 0
	mov	r0, sp
	bl	create_box.constprop.1
.LVL35:
	.loc 1 41 0
	ldr	r8, .L91+16
.LBB22:
.LBB23:
	.loc 1 116 0
	mov	r6, r4
.L89:
.LBE23:
.LBE22:
	.loc 1 41 0 discriminator 1
	ldr	r0, [r4, #0]
	bl	wgetch
.LVL36:
	cmp	r0, r8
	beq	.L90
.L70:
	.loc 1 42 0
	sub	r0, r0, #256
.LVL37:
	sub	r0, r0, #2
.LVL38:
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L89
.L44:
	.word	.L40
	.word	.L41
	.word	.L42
	.word	.L43
.L43:
.LVL39:
.LBB25:
.LBB26:
	.loc 1 98 0
	ldr	r7, [sp, #4]
	.loc 1 114 0
	ldr	fp, [sp, #8]
	.loc 1 97 0
	ldr	r9, [sp, #0]
.LVL40:
	.loc 1 114 0
	add	fp, r7, fp
	cmp	r7, fp
	.loc 1 99 0
	ldr	sl, [sp, #12]
.LVL41:
	.loc 1 114 0
	bgt	.L52
	.loc 1 115 0
	add	sl, r9, sl
.LVL42:
.L53:
	cmp	r9, sl
	movle	r5, r9
	bgt	.L57
.LVL43:
.L55:
	.loc 1 116 0
	mov	r2, r5
	mov	r1, r7
	ldr	r0, [r4, #0]
	bl	wmove
.LVL44:
	.loc 1 115 0
	add	r5, r5, #1
	.loc 1 116 0
	mov	r1, #32
	cmn	r0, #1
	beq	.L54
	ldr	r0, [r6, #0]
	bl	waddch
.LVL45:
.L54:
	.loc 1 115 0
	cmp	r5, sl
	ble	.L55
.LVL46:
.L57:
	.loc 1 114 0
	add	r7, r7, #1
.LVL47:
	cmp	r7, fp
	ble	.L53
.L52:
	.loc 1 118 0
	ldr	r0, [r4, #0]
	bl	wrefresh
.LVL48:
.LBE26:
.LBE25:
	.loc 1 50 0
	ldr	r3, [sp, #0]
	.loc 1 51 0
	mov	r0, sp
	.loc 1 50 0
	add	r3, r3, #1
	str	r3, [sp, #0]
	.loc 1 51 0
	bl	create_box.constprop.1
.LVL49:
	.loc 1 41 0
	ldr	r0, [r4, #0]
	bl	wgetch
.LVL50:
	cmp	r0, r8
	bne	.L70
.LVL51:
.L90:
	.loc 1 65 0
	bl	endwin
.LVL52:
	.loc 1 67 0
	mov	r0, #0
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL53:
.L42:
.LBB27:
.LBB28:
	.loc 1 98 0
	ldr	r7, [sp, #4]
	.loc 1 114 0
	ldr	fp, [sp, #8]
	.loc 1 97 0
	ldr	r9, [sp, #0]
.LVL54:
	.loc 1 114 0
	add	fp, r7, fp
	cmp	r7, fp
	.loc 1 99 0
	ldr	sl, [sp, #12]
.LVL55:
	.loc 1 114 0
	bgt	.L45
	.loc 1 115 0
	add	sl, r9, sl
.LVL56:
.L46:
	cmp	r9, sl
	movle	r5, r9
	bgt	.L50
.LVL57:
.L48:
	.loc 1 116 0
	mov	r2, r5
	mov	r1, r7
	ldr	r0, [r4, #0]
	bl	wmove
.LVL58:
	.loc 1 115 0
	add	r5, r5, #1
	.loc 1 116 0
	mov	r1, #32
	cmn	r0, #1
	beq	.L47
	ldr	r0, [r6, #0]
	bl	waddch
.LVL59:
.L47:
	.loc 1 115 0
	cmp	r5, sl
	ble	.L48
.LVL60:
.L50:
	.loc 1 114 0
	add	r7, r7, #1
.LVL61:
	cmp	r7, fp
	ble	.L46
.L45:
	.loc 1 118 0
	ldr	r0, [r4, #0]
	bl	wrefresh
.LVL62:
.LBE28:
.LBE27:
	.loc 1 45 0
	ldr	r3, [sp, #0]
	.loc 1 46 0
	mov	r0, sp
	.loc 1 45 0
	sub	r3, r3, #1
	str	r3, [sp, #0]
	.loc 1 46 0
	bl	create_box.constprop.1
.LVL63:
	.loc 1 47 0
	b	.L89
.LVL64:
.L41:
.LBB29:
.LBB30:
	.loc 1 98 0
	ldr	r7, [sp, #4]
	.loc 1 114 0
	ldr	fp, [sp, #8]
	.loc 1 97 0
	ldr	r9, [sp, #0]
.LVL65:
	.loc 1 114 0
	add	fp, r7, fp
	cmp	r7, fp
	.loc 1 99 0
	ldr	sl, [sp, #12]
.LVL66:
	.loc 1 114 0
	bgt	.L58
	.loc 1 115 0
	add	sl, r9, sl
.LVL67:
.L59:
	cmp	r9, sl
	movle	r5, r9
	bgt	.L63
.LVL68:
.L61:
	.loc 1 116 0
	mov	r2, r5
	mov	r1, r7
	ldr	r0, [r4, #0]
	bl	wmove
.LVL69:
	.loc 1 115 0
	add	r5, r5, #1
	.loc 1 116 0
	mov	r1, #32
	cmn	r0, #1
	beq	.L60
	ldr	r0, [r6, #0]
	bl	waddch
.LVL70:
.L60:
	.loc 1 115 0
	cmp	sl, r5
	bge	.L61
.LVL71:
.L63:
	.loc 1 114 0
	add	r7, r7, #1
.LVL72:
	cmp	r7, fp
	ble	.L59
.L58:
	.loc 1 118 0
	ldr	r0, [r4, #0]
	bl	wrefresh
.LVL73:
.LBE30:
.LBE29:
	.loc 1 55 0
	ldr	r3, [sp, #4]
	.loc 1 56 0
	mov	r0, sp
	.loc 1 55 0
	sub	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 56 0
	bl	create_box.constprop.1
.LVL74:
	.loc 1 57 0
	b	.L89
.LVL75:
.L40:
.LBB31:
.LBB24:
	.loc 1 98 0
	ldr	r7, [sp, #4]
	.loc 1 114 0
	ldr	fp, [sp, #8]
	.loc 1 97 0
	ldr	r9, [sp, #0]
.LVL76:
	.loc 1 114 0
	add	fp, r7, fp
	cmp	r7, fp
	.loc 1 99 0
	ldr	sl, [sp, #12]
.LVL77:
	.loc 1 114 0
	bgt	.L64
	.loc 1 115 0
	add	sl, r9, sl
.LVL78:
.L65:
	cmp	r9, sl
	movle	r5, r9
	bgt	.L69
.LVL79:
.L67:
	.loc 1 116 0
	mov	r2, r5
	mov	r1, r7
	ldr	r0, [r4, #0]
	bl	wmove
.LVL80:
	.loc 1 115 0
	add	r5, r5, #1
	.loc 1 116 0
	mov	r1, #32
	cmn	r0, #1
	beq	.L66
	ldr	r0, [r6, #0]
	bl	waddch
.LVL81:
.L66:
	.loc 1 115 0
	cmp	sl, r5
	bge	.L67
.LVL82:
.L69:
	.loc 1 114 0
	add	r7, r7, #1
.LVL83:
	cmp	fp, r7
	bge	.L65
.L64:
	.loc 1 118 0
	ldr	r0, [r4, #0]
	bl	wrefresh
.LVL84:
.LBE24:
.LBE31:
	.loc 1 60 0
	ldr	r3, [sp, #4]
	.loc 1 61 0
	mov	r0, sp
	.loc 1 60 0
	add	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 61 0
	bl	create_box.constprop.1
.LVL85:
	.loc 1 62 0
	b	.L89
.L92:
	.align	2
.L91:
	.word	stdscr
	.word	LINES
	.word	COLS
	.word	.LC0
	.word	265
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.text
	.align	2
	.global	init_win_params
	.type	init_win_params, %function
init_win_params:
.LFB12:
	.loc 1 69 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL86:
	.loc 1 72 0
	ldr	r3, .L94
	.loc 1 69 0
	stmfd	sp!, {r4, r5}
.LCFI4:
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 70 0
	mov	r5, #3
	.loc 1 72 0
	ldr	r2, [r3, #0]
	.loc 1 73 0
	ldr	r3, .L94+4
	.loc 1 72 0
	sub	r2, r2, #3
	.loc 1 75 0
	mov	r1, #124
	.loc 1 73 0
	ldr	r3, [r3, #0]
	.loc 1 72 0
	add	r4, r2, r2, lsr #31
	.loc 1 73 0
	sub	r3, r3, #10
	.loc 1 77 0
	mov	r2, #45
	.loc 1 73 0
	add	ip, r3, r3, lsr #31
	.loc 1 72 0
	mov	r4, r4, asr #1
	.loc 1 79 0
	mov	r3, #43
	.loc 1 73 0
	mov	ip, ip, asr #1
	.loc 1 70 0
	str	r5, [r0, #8]
	.loc 1 71 0
	mov	r5, #10
	str	r5, [r0, #12]
	.loc 1 72 0
	str	r4, [r0, #4]
	.loc 1 73 0
	str	ip, [r0, #0]
	.loc 1 75 0
	str	r1, [r0, #16]
	.loc 1 76 0
	str	r1, [r0, #20]
	.loc 1 77 0
	str	r2, [r0, #24]
	.loc 1 78 0
	str	r2, [r0, #28]
	.loc 1 79 0
	str	r3, [r0, #32]
	.loc 1 80 0
	str	r3, [r0, #36]
	.loc 1 81 0
	str	r3, [r0, #40]
	.loc 1 82 0
	str	r3, [r0, #44]
	.loc 1 84 0
	ldmfd	sp!, {r4, r5}
	bx	lr
.L95:
	.align	2
.L94:
	.word	LINES
	.word	COLS
	.cfi_endproc
.LFE12:
	.size	init_win_params, .-init_win_params
	.align	2
	.global	print_win_params
	.type	print_win_params, %function
print_win_params:
.LFB13:
	.loc 1 86 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL87:
	bx	lr
	.cfi_endproc
.LFE13:
	.size	print_win_params, .-print_win_params
	.align	2
	.global	create_box
	.type	create_box, %function
create_box:
.LFB14:
	.loc 1 94 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL88:
	.loc 1 102 0
	cmp	r1, #0
	.loc 1 94 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI5:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r4, r0
	sub	sp, sp, #12
.LCFI6:
	.cfi_def_cfa_offset 48
	.loc 1 97 0
	ldr	sl, [r0, #0]
.LVL89:
	.loc 1 98 0
	ldr	r5, [r0, #4]
.LVL90:
	.loc 1 99 0
	ldr	r6, [r0, #12]
.LVL91:
	.loc 1 100 0
	ldr	r9, [r0, #8]
.LVL92:
	.loc 1 102 0
	bne	.L98
.LVL93:
	.loc 1 114 0 discriminator 1
	add	r9, r5, r9
.LVL94:
	ldr	r7, .L143
	cmp	r5, r9
	addle	r6, sl, r6
.LVL95:
	.loc 1 116 0 discriminator 1
	movle	r8, r7
	.loc 1 114 0 discriminator 1
	bgt	.L108
.LVL96:
.L100:
	.loc 1 115 0 discriminator 1
	cmp	sl, r6
	movle	r4, sl
	bgt	.L112
.LVL97:
.L110:
	.loc 1 116 0
	mov	r2, r4
	mov	r1, r5
	ldr	r0, [r7, #0]
	bl	wmove
.LVL98:
	.loc 1 115 0
	add	r4, r4, #1
	.loc 1 116 0
	mov	r1, #32
	cmn	r0, #1
	beq	.L109
	.loc 1 116 0 is_stmt 0 discriminator 1
	ldr	r0, [r8, #0]
	bl	waddch
.LVL99:
.L109:
	.loc 1 115 0 is_stmt 1
	cmp	r6, r4
	bge	.L110
.LVL100:
.L112:
	.loc 1 114 0
	add	r5, r5, #1
.LVL101:
	cmp	r5, r9
	ble	.L100
.LVL102:
.L108:
	.loc 1 118 0
	ldr	r0, [r7, #0]
	.loc 1 120 0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 118 0
	b	wrefresh
.LVL103:
.L98:
	.loc 1 103 0
	ldr	r7, .L143
	mov	r1, r5
.LVL104:
	mov	r2, sl
	ldr	r0, [r7, #0]
.LVL105:
	bl	wmove
.LVL106:
	cmn	r0, #1
	beq	.L101
	.loc 1 103 0 is_stmt 0 discriminator 1
	ldr	r0, [r7, #0]
	ldr	r1, [r4, #32]
	bl	waddch
.LVL107:
.L101:
	.loc 1 104 0 is_stmt 1
	add	r8, sl, r6
	ldr	r0, [r7, #0]
	mov	r1, r5
	mov	r2, r8
	bl	wmove
.LVL108:
	cmn	r0, #1
	beq	.L102
	.loc 1 104 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #36]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL109:
.L102:
	.loc 1 105 0 is_stmt 1
	add	fp, r5, r9
	ldr	r0, [r7, #0]
	mov	r1, fp
	mov	r2, sl
	bl	wmove
.LVL110:
	cmn	r0, #1
	beq	.L103
	.loc 1 105 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #40]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL111:
.L103:
	.loc 1 106 0 is_stmt 1
	ldr	r0, [r7, #0]
	mov	r1, fp
	mov	r2, r8
	bl	wmove
.LVL112:
	cmn	r0, #1
	beq	.L104
	.loc 1 106 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #44]
	ldr	r0, [r3, #0]
	bl	waddch
.LVL113:
.L104:
	.loc 1 107 0 is_stmt 1
	add	r3, sl, #1
	mov	r2, r3
	ldr	r0, [r7, #0]
	mov	r1, r5
	str	r3, [sp, #4]
	bl	wmove
.LVL114:
	ldr	r3, [sp, #4]
	cmn	r0, #1
	beq	.L105
	.loc 1 107 0 is_stmt 0 discriminator 1
	ldr	r2, .L143
	ldr	r1, [r4, #24]
	ldr	r0, [r2, #0]
	sub	r2, r6, #1
	bl	whline
.LVL115:
	ldr	r3, [sp, #4]
.L105:
	.loc 1 108 0 is_stmt 1
	ldr	r0, [r7, #0]
	mov	r1, fp
	mov	r2, r3
	bl	wmove
.LVL116:
	cmn	r0, #1
	beq	.L106
	.loc 1 108 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #28]
	sub	r2, r6, #1
	ldr	r0, [r3, #0]
	bl	whline
.LVL117:
.L106:
	.loc 1 109 0 is_stmt 1
	add	r5, r5, #1
.LVL118:
	ldr	r0, [r7, #0]
	mov	r1, r5
	mov	r2, sl
	bl	wmove
.LVL119:
	cmn	r0, #1
	beq	.L107
	.loc 1 109 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #16]
	sub	r2, r9, #1
	ldr	r0, [r3, #0]
	bl	wvline
.LVL120:
.L107:
	.loc 1 110 0 is_stmt 1
	ldr	r0, [r7, #0]
	mov	r1, r5
	mov	r2, r8
	bl	wmove
.LVL121:
	cmn	r0, #1
	beq	.L108
	.loc 1 110 0 is_stmt 0 discriminator 1
	ldr	r3, .L143
	ldr	r1, [r4, #20]
	sub	r2, r9, #1
	ldr	r0, [r3, #0]
	bl	wvline
.LVL122:
	b	.L108
.L144:
	.align	2
.L143:
	.word	stdscr
	.cfi_endproc
.LFE14:
	.size	create_box, .-create_box
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press F1 to exit\000"
	.text
.Letext0:
	.file 2 "/usr/include/ncurses.h"
	.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/stddef.h"
	.file 4 "/usr/include/arm-linux-gnueabihf/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1039
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x1
	.4byte	.LASF124
	.4byte	.LASF125
	.4byte	.Ldebug_ranges0+0x50
	.4byte	0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x8f
	.4byte	0x34
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x3
	.byte	0xd5
	.4byte	0x46
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x4
	.byte	0x38
	.4byte	0x70
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x4
	.byte	0x8d
	.4byte	0x94
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x4
	.byte	0x8e
	.4byte	0x7e
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb5
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x98
	.byte	0x5
	.2byte	0x10f
	.4byte	0x27d
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x110
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x115
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x116
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x117
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x118
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x119
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x11a
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x11b
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x11c
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x11e
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x11f
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x120
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x122
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x124
	.4byte	0x2c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x126
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x12a
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x12c
	.4byte	0x89
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x130
	.4byte	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x131
	.4byte	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x46
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x132
	.4byte	0x2c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x47
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x136
	.4byte	0x2d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x13f
	.4byte	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x148
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x149
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x14a
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x14b
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x14c
	.4byte	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x14e
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x150
	.4byte	0x2dd
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.byte	0
	.uleb128 0x9
	.4byte	.LASF126
	.byte	0x5
	.byte	0xb4
	.uleb128 0xa
	.4byte	.LASF46
	.byte	0xc
	.byte	0x5
	.byte	0xba
	.4byte	0x2bb
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x5
	.byte	0xbb
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x5
	.byte	0xbc
	.4byte	0x2c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x5
	.byte	0xc0
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x284
	.uleb128 0x6
	.byte	0x4
	.4byte	0xbc
	.uleb128 0xc
	.4byte	0xb5
	.4byte	0x2d7
	.uleb128 0xd
	.4byte	0xa6
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x27d
	.uleb128 0xc
	.4byte	0xb5
	.4byte	0x2ed
	.uleb128 0xd
	.4byte	0xa6
	.byte	0x27
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2f3
	.uleb128 0xe
	.4byte	0xb5
	.uleb128 0xf
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x155
	.4byte	0x304
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4c
	.byte	0x2
	.2byte	0x186
	.4byte	0x4a7
	.uleb128 0x8
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x188
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x188
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x18b
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x18b
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x18c
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x18c
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x18e
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x191
	.4byte	0x4a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x192
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x195
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x196
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x197
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x198
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x8
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x199
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x19a
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x8
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x19b
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x8
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x19c
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x8
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x19d
	.4byte	0x51b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x19e
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x1a0
	.4byte	0x528
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x1a3
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x1a4
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x8
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x1a7
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x1a8
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x1a9
	.4byte	0x52e
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x1b1
	.4byte	0x4b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x1b3
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0
	.uleb128 0xf
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x157
	.4byte	0x29
	.uleb128 0x7
	.4byte	.LASF79
	.byte	0xc
	.byte	0x2
	.2byte	0x1ac
	.4byte	0x51b
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x1ae
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x1ae
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x1af
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x1af
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x1b0
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x1b0
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF86
	.uleb128 0x10
	.4byte	.LASF127
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.4byte	0x522
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2f8
	.uleb128 0xa
	.4byte	.LASF87
	.byte	0x20
	.byte	0x1
	.byte	0x3
	.4byte	0x5a9
	.uleb128 0x11
	.ascii	"ls\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.ascii	"rs\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.ascii	"ts\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.ascii	"bs\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.ascii	"tl\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x11
	.ascii	"tr\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x11
	.ascii	"bl\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x11
	.ascii	"br\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x29
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x2
	.4byte	.LASF88
	.byte	0x1
	.byte	0x6
	.4byte	0x534
	.uleb128 0xa
	.4byte	.LASF89
	.byte	0x30
	.byte	0x1
	.byte	0x8
	.4byte	0x607
	.uleb128 0xb
	.4byte	.LASF90
	.byte	0x1
	.byte	0xa
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.4byte	.LASF91
	.byte	0x1
	.byte	0xa
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF92
	.byte	0x1
	.byte	0xb
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.4byte	.LASF93
	.byte	0x1
	.byte	0xb
	.4byte	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.4byte	.LASF94
	.byte	0x1
	.byte	0xc
	.4byte	0x5a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x12
	.ascii	"WIN\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x5b4
	.uleb128 0x13
	.byte	0x1
	.4byte	.LASF95
	.byte	0x1
	.byte	0x44
	.byte	0x1
	.byte	0x1
	.4byte	0x62c
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x1
	.byte	0x44
	.4byte	0x62c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x607
	.uleb128 0x13
	.byte	0x1
	.4byte	.LASF96
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x1
	.4byte	0x64c
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x1
	.byte	0x55
	.4byte	0x62c
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.4byte	.LASF98
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x1
	.4byte	0x6a7
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x1
	.byte	0x5d
	.4byte	0x62c
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x1
	.byte	0x5d
	.4byte	0x51b
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x69
	.uleb128 0x15
	.ascii	"j\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x69
	.uleb128 0x15
	.ascii	"x\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x69
	.uleb128 0x15
	.ascii	"y\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x69
	.uleb128 0x15
	.ascii	"w\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x69
	.uleb128 0x15
	.ascii	"h\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x69
	.byte	0
	.uleb128 0x16
	.4byte	0x64c
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x83f
	.uleb128 0x17
	.4byte	0x65a
	.4byte	.LLST1
	.uleb128 0x18
	.4byte	0x670
	.byte	0x1
	.byte	0x56
	.uleb128 0x18
	.4byte	0x679
	.byte	0x1
	.byte	0x57
	.uleb128 0x19
	.4byte	0x682
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST2
	.uleb128 0x18
	.4byte	0x694
	.byte	0x1
	.byte	0x5a
	.uleb128 0x18
	.4byte	0x69d
	.byte	0x1
	.byte	0x58
	.uleb128 0x1b
	.4byte	0x665
	.byte	0x1
	.uleb128 0x1c
	.4byte	.LVL5
	.4byte	0xe92
	.4byte	0x710
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL6
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL7
	.4byte	0xe92
	.4byte	0x733
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL8
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL9
	.4byte	0xe92
	.4byte	0x756
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL10
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL11
	.4byte	0xe92
	.4byte	0x779
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL12
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL13
	.4byte	0xe92
	.4byte	0x79c
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL14
	.4byte	0xed8
	.4byte	0x7b0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL15
	.4byte	0xe92
	.4byte	0x7c4
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL16
	.4byte	0xed8
	.4byte	0x7d8
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL18
	.4byte	0xe92
	.4byte	0x7f2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL19
	.4byte	0xefb
	.4byte	0x806
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL20
	.4byte	0xe92
	.4byte	0x820
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL21
	.4byte	0xefb
	.4byte	0x834
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 -1
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL22
	.byte	0x1
	.4byte	0xf1e
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.4byte	.LASF128
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.4byte	0x69
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LLST3
	.byte	0x1
	.4byte	0xc3e
	.uleb128 0x21
	.4byte	.LASF100
	.byte	0x1
	.byte	0x13
	.4byte	0x69
	.4byte	.LLST4
	.uleb128 0x21
	.4byte	.LASF101
	.byte	0x1
	.byte	0x13
	.4byte	0xc3e
	.4byte	.LLST5
	.uleb128 0x22
	.ascii	"win\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x607
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x23
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x69
	.4byte	.LLST6
	.uleb128 0x24
	.4byte	0x612
	.4byte	.LBB16
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x20
	.4byte	0x8b3
	.uleb128 0x25
	.4byte	0x620
	.byte	0x1
	.byte	0x5d
	.byte	0
	.uleb128 0x24
	.4byte	0x64c
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0x3b
	.4byte	0x943
	.uleb128 0x25
	.4byte	0x65a
	.byte	0x1
	.byte	0x5d
	.uleb128 0x26
	.4byte	.Ldebug_ranges0+0x38
	.uleb128 0x1a
	.4byte	0x670
	.4byte	.LLST7
	.uleb128 0x18
	.4byte	0x679
	.byte	0x1
	.byte	0x57
	.uleb128 0x18
	.4byte	0x682
	.byte	0x1
	.byte	0x59
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST8
	.uleb128 0x1a
	.4byte	0x694
	.4byte	.LLST9
	.uleb128 0x1a
	.4byte	0x69d
	.4byte	.LLST10
	.uleb128 0x1b
	.4byte	0x665
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL80
	.4byte	0xe92
	.4byte	0x924
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL81
	.4byte	0xeb5
	.4byte	0x938
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL84
	.4byte	0xf1e
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x64c
	.4byte	.LBB25
	.4byte	.LBE25
	.byte	0x1
	.byte	0x31
	.4byte	0x9e0
	.uleb128 0x17
	.4byte	0x65a
	.4byte	.LLST11
	.uleb128 0x28
	.4byte	.LBB26
	.4byte	.LBE26
	.uleb128 0x1a
	.4byte	0x670
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	0x679
	.4byte	.LLST13
	.uleb128 0x1a
	.4byte	0x682
	.4byte	.LLST14
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST15
	.uleb128 0x1a
	.4byte	0x694
	.4byte	.LLST16
	.uleb128 0x1a
	.4byte	0x69d
	.4byte	.LLST17
	.uleb128 0x17
	.4byte	0x665
	.4byte	.LLST18
	.uleb128 0x1c
	.4byte	.LVL44
	.4byte	0xe92
	.4byte	0x9c1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL45
	.4byte	0xeb5
	.4byte	0x9d5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL48
	.4byte	0xf1e
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x64c
	.4byte	.LBB27
	.4byte	.LBE27
	.byte	0x1
	.byte	0x2c
	.4byte	0xa7d
	.uleb128 0x17
	.4byte	0x65a
	.4byte	.LLST19
	.uleb128 0x28
	.4byte	.LBB28
	.4byte	.LBE28
	.uleb128 0x1a
	.4byte	0x670
	.4byte	.LLST20
	.uleb128 0x1a
	.4byte	0x679
	.4byte	.LLST21
	.uleb128 0x1a
	.4byte	0x682
	.4byte	.LLST22
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST23
	.uleb128 0x1a
	.4byte	0x694
	.4byte	.LLST24
	.uleb128 0x1a
	.4byte	0x69d
	.4byte	.LLST25
	.uleb128 0x17
	.4byte	0x665
	.4byte	.LLST26
	.uleb128 0x1c
	.4byte	.LVL58
	.4byte	0xe92
	.4byte	0xa5e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL59
	.4byte	0xeb5
	.4byte	0xa72
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL62
	.4byte	0xf1e
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x64c
	.4byte	.LBB29
	.4byte	.LBE29
	.byte	0x1
	.byte	0x36
	.4byte	0xb1a
	.uleb128 0x17
	.4byte	0x65a
	.4byte	.LLST27
	.uleb128 0x28
	.4byte	.LBB30
	.4byte	.LBE30
	.uleb128 0x1a
	.4byte	0x670
	.4byte	.LLST28
	.uleb128 0x1a
	.4byte	0x679
	.4byte	.LLST29
	.uleb128 0x1a
	.4byte	0x682
	.4byte	.LLST30
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST31
	.uleb128 0x1a
	.4byte	0x694
	.4byte	.LLST32
	.uleb128 0x1a
	.4byte	0x69d
	.4byte	.LLST33
	.uleb128 0x17
	.4byte	0x665
	.4byte	.LLST34
	.uleb128 0x1c
	.4byte	.LVL69
	.4byte	0xe92
	.4byte	0xafb
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL70
	.4byte	0xeb5
	.4byte	0xb0f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL73
	.4byte	0xf1e
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL24
	.4byte	0xf37
	.uleb128 0x1e
	.4byte	.LVL25
	.4byte	0xf46
	.uleb128 0x1e
	.4byte	.LVL26
	.4byte	0xf55
	.uleb128 0x1c
	.4byte	.LVL27
	.4byte	0xf64
	.4byte	0xb48
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL28
	.4byte	0xf82
	.uleb128 0x1c
	.4byte	.LVL29
	.4byte	0xf91
	.4byte	0xb6e
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x36
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL31
	.4byte	0xfb4
	.4byte	0xb88
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL32
	.4byte	0xfd7
	.4byte	0xb9f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL33
	.4byte	0xf1e
	.uleb128 0x1c
	.4byte	.LVL34
	.4byte	0xff1
	.4byte	0xbc2
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.byte	0xa
	.2byte	0x100
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL35
	.4byte	0x6a7
	.4byte	0xbd6
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL36
	.4byte	0x1014
	.uleb128 0x1c
	.4byte	.LVL49
	.4byte	0x6a7
	.4byte	0xbf3
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL50
	.4byte	0x1014
	.uleb128 0x1e
	.4byte	.LVL52
	.4byte	0x102d
	.uleb128 0x1c
	.4byte	.LVL63
	.4byte	0x6a7
	.4byte	0xc19
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL74
	.4byte	0x6a7
	.4byte	0xc2d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.4byte	.LVL85
	.4byte	0x6a7
	.uleb128 0x1d
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xaf
	.uleb128 0x16
	.4byte	0x612
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LLST35
	.byte	0x1
	.4byte	0xc62
	.uleb128 0x25
	.4byte	0x620
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2a
	.4byte	0x632
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0xc7f
	.uleb128 0x25
	.4byte	0x640
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x16
	.4byte	0x64c
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LLST36
	.byte	0x1
	.4byte	0xe4e
	.uleb128 0x17
	.4byte	0x65a
	.4byte	.LLST37
	.uleb128 0x17
	.4byte	0x665
	.4byte	.LLST38
	.uleb128 0x1a
	.4byte	0x670
	.4byte	.LLST39
	.uleb128 0x1a
	.4byte	0x679
	.4byte	.LLST40
	.uleb128 0x18
	.4byte	0x682
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1a
	.4byte	0x68b
	.4byte	.LLST41
	.uleb128 0x1a
	.4byte	0x694
	.4byte	.LLST42
	.uleb128 0x1a
	.4byte	0x69d
	.4byte	.LLST43
	.uleb128 0x1c
	.4byte	.LVL98
	.4byte	0xe92
	.4byte	0xcf5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL99
	.4byte	0xeb5
	.4byte	0xd09
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL103
	.byte	0x1
	.4byte	0xf1e
	.uleb128 0x1c
	.4byte	.LVL106
	.4byte	0xe92
	.4byte	0xd2d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL107
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL108
	.4byte	0xe92
	.4byte	0xd50
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL109
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL110
	.4byte	0xe92
	.4byte	0xd73
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL111
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL112
	.4byte	0xe92
	.4byte	0xd96
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL113
	.4byte	0xeb5
	.uleb128 0x1c
	.4byte	.LVL114
	.4byte	0xe92
	.4byte	0xdb9
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL115
	.4byte	0xed8
	.4byte	0xdcd
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL116
	.4byte	0xe92
	.4byte	0xde1
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL117
	.4byte	0xed8
	.4byte	0xdf5
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x76
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL119
	.4byte	0xe92
	.4byte	0xe0f
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL120
	.4byte	0xefb
	.4byte	0xe23
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 -1
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL121
	.4byte	0xe92
	.4byte	0xe3d
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1d
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.4byte	.LVL122
	.4byte	0xefb
	.uleb128 0x1d
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x79
	.sleb128 -1
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF102
	.byte	0x6
	.byte	0xa5
	.4byte	0x2c1
	.byte	0x1
	.byte	0x1
	.uleb128 0x2b
	.4byte	.LASF103
	.byte	0x6
	.byte	0xa6
	.4byte	0x2c1
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.4byte	.LASF104
	.byte	0x2
	.2byte	0x54e
	.4byte	0x52e
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.4byte	.LASF105
	.byte	0x2
	.2byte	0x552
	.4byte	0x69
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.4byte	.LASF106
	.byte	0x2
	.2byte	0x554
	.4byte	0x69
	.byte	0x1
	.byte	0x1
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF107
	.byte	0x2
	.2byte	0x326
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xeb5
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x69
	.uleb128 0x2e
	.4byte	0x69
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF108
	.byte	0x2
	.2byte	0x2ff
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xed3
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0xed3
	.byte	0
	.uleb128 0xe
	.4byte	0x29
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF109
	.byte	0x2
	.2byte	0x31b
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xefb
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x29
	.uleb128 0x2e
	.4byte	0x69
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF110
	.byte	0x2
	.2byte	0x336
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xf1e
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x29
	.uleb128 0x2e
	.4byte	0x69
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF111
	.byte	0x2
	.2byte	0x32b
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xf37
	.uleb128 0x2e
	.4byte	0x52e
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF112
	.byte	0x2
	.2byte	0x267
	.byte	0x1
	.4byte	0x52e
	.byte	0x1
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF113
	.byte	0x2
	.2byte	0x2eb
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF114
	.byte	0x2
	.2byte	0x23a
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF115
	.byte	0x2
	.2byte	0x276
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xf82
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x51b
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF116
	.byte	0x2
	.2byte	0x2b6
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF117
	.byte	0x2
	.2byte	0x269
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xfb4
	.uleb128 0x2e
	.4byte	0x62
	.uleb128 0x2e
	.4byte	0x62
	.uleb128 0x2e
	.4byte	0x62
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF118
	.byte	0x2
	.2byte	0x308
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xfd7
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x4a7
	.uleb128 0x2e
	.4byte	0xad
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF119
	.byte	0x2
	.2byte	0x2c2
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0xff1
	.uleb128 0x2e
	.4byte	0x2ed
	.uleb128 0x30
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF120
	.byte	0x2
	.2byte	0x309
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0x1014
	.uleb128 0x2e
	.4byte	0x52e
	.uleb128 0x2e
	.4byte	0x4a7
	.uleb128 0x2e
	.4byte	0xad
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF121
	.byte	0x2
	.2byte	0x318
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0x102d
	.uleb128 0x2e
	.4byte	0x52e
	.byte	0
	.uleb128 0x2f
	.byte	0x1
	.4byte	.LASF122
	.byte	0x2
	.2byte	0x252
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB15
	.4byte	.LCFI0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0
	.4byte	.LCFI1
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI1
	.4byte	.LFE15
	.2byte	0x2
	.byte	0x7d
	.sleb128 48
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2
	.4byte	.LFE15
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL17
	.4byte	.LFE15
	.2byte	0x3
	.byte	0x77
	.sleb128 -1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LFB11
	.4byte	.LCFI2
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI2
	.4byte	.LCFI3
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI3
	.4byte	.LFE11
	.2byte	0x3
	.byte	0x7d
	.sleb128 88
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24-1
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL24-1
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x4
	.byte	0x70
	.sleb128 256
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL42
	.2byte	0x4
	.byte	0x70
	.sleb128 258
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LVL52-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53
	.4byte	.LVL56
	.2byte	0x4
	.byte	0x70
	.sleb128 258
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LVL67
	.2byte	0x4
	.byte	0x70
	.sleb128 258
	.byte	0x9f
	.4byte	.LVL75
	.4byte	.LVL78
	.2byte	0x4
	.byte	0x70
	.sleb128 258
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL81
	.4byte	.LVL82
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL76
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x3
	.byte	0x91
	.sleb128 -88
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL39
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL42
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL41
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL40
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x3
	.byte	0x91
	.sleb128 -88
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL39
	.4byte	.LVL51
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL53
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL56
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL59
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL55
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL54
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL54
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x3
	.byte	0x91
	.sleb128 -88
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL53
	.4byte	.LVL64
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL64
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL67
	.4byte	.LVL68
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL70
	.4byte	.LVL71
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL66
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL65
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL65
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x3
	.byte	0x91
	.sleb128 -88
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL64
	.4byte	.LVL75
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LFB12
	.4byte	.LCFI4
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI4
	.4byte	.LFE12
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LFB14
	.4byte	.LCFI5
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI5
	.4byte	.LCFI6
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI6
	.4byte	.LFE14
	.2byte	0x2
	.byte	0x7d
	.sleb128 48
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL88
	.4byte	.LVL96
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL96
	.4byte	.LVL103
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL103
	.4byte	.LVL105
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL105
	.4byte	.LFE14
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL88
	.4byte	.LVL96
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL96
	.4byte	.LVL103
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL103
	.4byte	.LVL104
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL104
	.4byte	.LFE14
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL96
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL99
	.4byte	.LVL100
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL93
	.4byte	.LVL102
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL90
	.4byte	.LVL96
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL103
	.4byte	.LVL118
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL118
	.4byte	.LFE14
	.2byte	0x3
	.byte	0x75
	.sleb128 -1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST42:
	.4byte	.LVL91
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL95
	.4byte	.LVL96
	.2byte	0x2
	.byte	0x70
	.sleb128 12
	.4byte	.LVL103
	.4byte	.LFE14
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST43:
	.4byte	.LVL92
	.4byte	.LVL94
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL94
	.4byte	.LVL96
	.2byte	0x2
	.byte	0x70
	.sleb128 8
	.4byte	.LVL103
	.4byte	.LFE14
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	0
	.4byte	0
	.4byte	.LBB23
	.4byte	.LBE23
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF11:
	.ascii	"__off_t\000"
.LASF17:
	.ascii	"_IO_read_ptr\000"
.LASF29:
	.ascii	"_chain\000"
.LASF64:
	.ascii	"_idlok\000"
.LASF1:
	.ascii	"size_t\000"
.LASF119:
	.ascii	"printw\000"
.LASF35:
	.ascii	"_shortbuf\000"
.LASF84:
	.ascii	"_pad_bottom\000"
.LASF79:
	.ascii	"pdat\000"
.LASF94:
	.ascii	"border\000"
.LASF118:
	.ascii	"wattr_on\000"
.LASF23:
	.ascii	"_IO_buf_base\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF81:
	.ascii	"_pad_x\000"
.LASF80:
	.ascii	"_pad_y\000"
.LASF8:
	.ascii	"long long int\000"
.LASF6:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"_fileno\000"
.LASF18:
	.ascii	"_IO_read_end\000"
.LASF68:
	.ascii	"_use_keypad\000"
.LASF0:
	.ascii	"chtype\000"
.LASF12:
	.ascii	"long int\000"
.LASF58:
	.ascii	"_attrs\000"
.LASF16:
	.ascii	"_flags\000"
.LASF107:
	.ascii	"wmove\000"
.LASF24:
	.ascii	"_IO_buf_end\000"
.LASF33:
	.ascii	"_cur_column\000"
.LASF89:
	.ascii	"_WIN_struct\000"
.LASF10:
	.ascii	"__quad_t\000"
.LASF122:
	.ascii	"endwin\000"
.LASF32:
	.ascii	"_old_offset\000"
.LASF37:
	.ascii	"_offset\000"
.LASF78:
	.ascii	"attr_t\000"
.LASF111:
	.ascii	"wrefresh\000"
.LASF51:
	.ascii	"_win_st\000"
.LASF67:
	.ascii	"_sync\000"
.LASF71:
	.ascii	"_regtop\000"
.LASF106:
	.ascii	"LINES\000"
.LASF46:
	.ascii	"_IO_marker\000"
.LASF102:
	.ascii	"stdin\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF53:
	.ascii	"_curx\000"
.LASF52:
	.ascii	"_cury\000"
.LASF112:
	.ascii	"initscr\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF104:
	.ascii	"stdscr\000"
.LASF21:
	.ascii	"_IO_write_ptr\000"
.LASF96:
	.ascii	"print_win_params\000"
.LASF115:
	.ascii	"keypad\000"
.LASF48:
	.ascii	"_sbuf\000"
.LASF93:
	.ascii	"width\000"
.LASF82:
	.ascii	"_pad_top\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF88:
	.ascii	"WIN_BORDER\000"
.LASF25:
	.ascii	"_IO_save_base\000"
.LASF109:
	.ascii	"whline\000"
.LASF50:
	.ascii	"WINDOW\000"
.LASF110:
	.ascii	"wvline\000"
.LASF114:
	.ascii	"cbreak\000"
.LASF36:
	.ascii	"_lock\000"
.LASF31:
	.ascii	"_flags2\000"
.LASF43:
	.ascii	"_mode\000"
.LASF98:
	.ascii	"create_box\000"
.LASF103:
	.ascii	"stdout\000"
.LASF63:
	.ascii	"_scroll\000"
.LASF127:
	.ascii	"ldat\000"
.LASF14:
	.ascii	"sizetype\000"
.LASF72:
	.ascii	"_regbottom\000"
.LASF66:
	.ascii	"_immed\000"
.LASF73:
	.ascii	"_parx\000"
.LASF74:
	.ascii	"_pary\000"
.LASF22:
	.ascii	"_IO_write_end\000"
.LASF124:
	.ascii	"other_border.c\000"
.LASF125:
	.ascii	"/home/pi/ASM/ncurses/demo/ncurses_programs/basics\000"
.LASF95:
	.ascii	"init_win_params\000"
.LASF90:
	.ascii	"startx\000"
.LASF126:
	.ascii	"_IO_lock_t\000"
.LASF91:
	.ascii	"starty\000"
.LASF45:
	.ascii	"_IO_FILE\000"
.LASF123:
	.ascii	"GNU C 4.7.2\000"
.LASF62:
	.ascii	"_leaveok\000"
.LASF117:
	.ascii	"init_pair\000"
.LASF49:
	.ascii	"_pos\000"
.LASF28:
	.ascii	"_markers\000"
.LASF75:
	.ascii	"_parent\000"
.LASF86:
	.ascii	"_Bool\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF55:
	.ascii	"_maxx\000"
.LASF54:
	.ascii	"_maxy\000"
.LASF120:
	.ascii	"wattr_off\000"
.LASF7:
	.ascii	"short int\000"
.LASF99:
	.ascii	"flag\000"
.LASF34:
	.ascii	"_vtable_offset\000"
.LASF87:
	.ascii	"_win_border_struct\000"
.LASF65:
	.ascii	"_idcok\000"
.LASF76:
	.ascii	"_pad\000"
.LASF121:
	.ascii	"wgetch\000"
.LASF116:
	.ascii	"noecho\000"
.LASF60:
	.ascii	"_notimeout\000"
.LASF85:
	.ascii	"_pad_right\000"
.LASF15:
	.ascii	"char\000"
.LASF77:
	.ascii	"_yoffset\000"
.LASF59:
	.ascii	"_bkgd\000"
.LASF61:
	.ascii	"_clear\000"
.LASF47:
	.ascii	"_next\000"
.LASF13:
	.ascii	"__off64_t\000"
.LASF113:
	.ascii	"start_color\000"
.LASF19:
	.ascii	"_IO_read_base\000"
.LASF27:
	.ascii	"_IO_save_end\000"
.LASF38:
	.ascii	"__pad1\000"
.LASF39:
	.ascii	"__pad2\000"
.LASF40:
	.ascii	"__pad3\000"
.LASF41:
	.ascii	"__pad4\000"
.LASF42:
	.ascii	"__pad5\000"
.LASF44:
	.ascii	"_unused2\000"
.LASF101:
	.ascii	"argv\000"
.LASF108:
	.ascii	"waddch\000"
.LASF57:
	.ascii	"_begx\000"
.LASF56:
	.ascii	"_begy\000"
.LASF26:
	.ascii	"_IO_backup_base\000"
.LASF97:
	.ascii	"p_win\000"
.LASF100:
	.ascii	"argc\000"
.LASF83:
	.ascii	"_pad_left\000"
.LASF69:
	.ascii	"_delay\000"
.LASF70:
	.ascii	"_line\000"
.LASF92:
	.ascii	"height\000"
.LASF128:
	.ascii	"main\000"
.LASF20:
	.ascii	"_IO_write_base\000"
.LASF105:
	.ascii	"COLS\000"
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
