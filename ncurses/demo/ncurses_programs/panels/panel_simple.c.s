main:
	STMFD	sp!, {fp, lr}
	ADD	fp, sp, #4
	SUB	sp, sp, #72
	MOV	r3, #10
	STR	r3, [fp, #-12]
	MOV	r3, #40
	STR	r3, [fp, #-16]
	MOV	r3, #2
	STR	r3, [fp, #-20]
	MOV	r3, #4
	STR	r3, [fp, #-24]
	BL	initscr
	BL	cbreak
	BL	noecho
	LDR	r0, [fp, #-12]
	LDR	r1, [fp, #-16]
	LDR	r2, [fp, #-20]
	LDR	r3, [fp, #-24]
	BL	newwin
	MOV	r3, r0
	STR	r3, [fp, #-36]
	LDR	r3, [fp, #-20]
	ADD	r2, r3, #1
	LDR	r3, [fp, #-24]
	ADD	r3, r3, #5
	LDR	r0, [fp, #-12]
	LDR	r1, [fp, #-16]
	BL	newwin
	MOV	r3, r0
	STR	r3, [fp, #-32]
	LDR	r3, [fp, #-20]
	ADD	r2, r3, #2
	LDR	r3, [fp, #-24]
	ADD	r3, r3, #10
	LDR	r0, [fp, #-12]
	LDR	r1, [fp, #-16]
	BL	newwin
	MOV	r3, r0
	STR	r3, [fp, #-28]
	MOV	r3, #0
	STR	r3, [fp, #-8]
	B	.L2
.L3:
	LDR	r2, [fp, #-8]
	MVN	r3, #31
	MOV	r2, r2, asl #2
	SUB	r1, fp, #4
	ADD	r2, r1, r2
	ADD	r3, r2, r3
	LDR	r3, [r3, #0]
	MOV	r2, #0
	STR	r2, [sp, #0]
	MOV	r2, #0
	STR	r2, [sp, #4]
	MOV	r2, #0
	STR	r2, [sp, #8]
	MOV	r2, #0
	STR	r2, [sp, #12]
	MOV	r2, #0
	STR	r2, [sp, #16]
	MOV	r0, r3
	MOV	r1, #0
	MOV	r2, #0
	MOV	r3, #0
	BL	wborder
	LDR	r3, [fp, #-8]
	ADD	r3, r3, #1
	STR	r3, [fp, #-8]
.L2:
	LDR	r3, [fp, #-8]
	CMP	r3, #2
	BLE	.L3
	LDR	r3, [fp, #-36]
	MOV	r0, r3
	BL	new_panel
	MOV	r3, r0
	STR	r3, [fp, #-48]
	LDR	r3, [fp, #-32]
	MOV	r0, r3
	BL	new_panel
	MOV	r3, r0
	STR	r3, [fp, #-44]
	LDR	r3, [fp, #-28]
	MOV	r0, r3
	BL	new_panel
	MOV	r3, r0
	STR	r3, [fp, #-40]
	BL	update_panels
	BL	doupdate
	LDR	r3, .L5
	LDR	r3, [r3, #0]
	MOV	r0, r3
	BL	wgetch
	BL	endwin
	MOV	r3, #0
	MOV	r0, r3
	SUB	sp, fp, #4
	LDMFD	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	stdscr
