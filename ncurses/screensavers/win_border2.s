	.GLOBAL	main
main:
	STMFD	sp!, {fp, lr}

	ADD	fp, sp, #4
	SUB	sp, sp, #32
	STR	r0, [fp, #-8]
	STR	r1, [fp, #-12]

	BL	initscr
	BL	cbreak

	LDR	r3, .L3
	LDR	r0, [r3, #0]
	MOV	r1, #1
	BL	keypad

	LDR	r3, .L3
	LDR	r3, [r3, #0]
	MOV	r2, #0
	STR	r2, [sp, #0]
	STR	r2, [sp, #4]
	STR	r2, [sp, #8]
	STR	r2, [sp, #12]
	STR	r2, [sp, #16]
	MOV	r0, r3
	MOV	r1, #0
	MOV	r2, #0
	MOV	r3, #0
	BL	wborder

	LDR	r3, .L3
	LDR	r3, [r3, #0]
	MOV	r0, r3
	BL	wrefresh

	BL	endwin

	SUB	sp, fp, #4
	LDMFD	sp!, {fp, pc}
	.ALIGN	2
.L3: .WORD	stdscr
