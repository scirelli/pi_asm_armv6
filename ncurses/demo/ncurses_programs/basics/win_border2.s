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
	.file	"win_border2.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB11:
	.file 1 "win_border2.c"
	.loc 1 4 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, lr}
.LCFI0:
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #28
.LCFI1:
	.cfi_def_cfa_offset 40
	.loc 1 8 0
	ldr	r5, .L2
	.loc 1 10 0
	mov	r4, #0
	.loc 1 5 0
	bl	initscr
.LVL1:
	.loc 1 6 0
	bl	cbreak
.LVL2:
	.loc 1 8 0
	mov	r1, #1
	ldr	r0, [r5, #0]
	bl	keypad
.LVL3:
	.loc 1 10 0
	mov	r1, r4
	mov	r2, r4
	mov	r3, r4
	ldr	r0, [r5, #0]
	str	r4, [sp, #0]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	bl	wborder
.LVL4:
	.loc 1 11 0
	ldr	r0, [r5, #0]
	bl	wrefresh
.LVL5:
	.loc 1 13 0
	bl	endwin
.LVL6:
	.loc 1 15 0
	mov	r0, r4
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, pc}
.L3:
	.align	2
.L2:
	.word	stdscr
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/usr/include/ncurses.h"
	.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/4.7/include/stddef.h"
	.file 4 "/usr/include/arm-linux-gnueabihf/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6b0
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x1
	.4byte	.LASF99
	.4byte	.LASF100
	.4byte	.Ldebug_ranges0+0
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
	.4byte	.LASF101
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
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x155
	.4byte	0x2f9
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4c
	.byte	0x2
	.2byte	0x186
	.4byte	0x49c
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
	.4byte	0x49c
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
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x196
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x197
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x198
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x8
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x199
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x19a
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x8
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x19b
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x8
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x19c
	.4byte	0x510
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x8
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x19d
	.4byte	0x510
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
	.4byte	0x51d
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
	.4byte	0x523
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x1b1
	.4byte	0x4a8
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
	.uleb128 0xe
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x157
	.4byte	0x29
	.uleb128 0x7
	.4byte	.LASF79
	.byte	0xc
	.byte	0x2
	.2byte	0x1ac
	.4byte	0x510
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
	.uleb128 0xf
	.4byte	.LASF102
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.4byte	0x517
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2ed
	.uleb128 0x10
	.byte	0x1
	.4byte	.LASF103
	.byte	0x1
	.byte	0x3
	.byte	0x1
	.4byte	0x69
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x5e0
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x1
	.byte	0x3
	.4byte	0x69
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LASF88
	.byte	0x1
	.byte	0x3
	.4byte	0x5e0
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LVL1
	.4byte	0x60e
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x61d
	.uleb128 0x13
	.4byte	.LVL3
	.4byte	0x62c
	.4byte	0x58a
	.uleb128 0x14
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x13
	.4byte	.LVL4
	.4byte	0x64a
	.4byte	0x5cd
	.uleb128 0x14
	.byte	0x1
	.byte	0x53
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x1
	.byte	0x52
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x1
	.byte	0x51
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7d
	.sleb128 16
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7d
	.sleb128 8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0x68b
	.uleb128 0x12
	.4byte	.LVL6
	.4byte	0x6a4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xaf
	.uleb128 0x15
	.4byte	.LASF89
	.byte	0x6
	.byte	0xa5
	.4byte	0x2c1
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x6
	.byte	0xa6
	.4byte	0x2c1
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x54e
	.4byte	0x523
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x267
	.byte	0x1
	.4byte	0x523
	.byte	0x1
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x23a
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.4byte	.LASF94
	.byte	0x2
	.2byte	0x276
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0x64a
	.uleb128 0x19
	.4byte	0x523
	.uleb128 0x19
	.4byte	0x510
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x30d
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0x68b
	.uleb128 0x19
	.4byte	0x523
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.uleb128 0x19
	.4byte	0x29
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x32b
	.byte	0x1
	.4byte	0x69
	.byte	0x1
	.4byte	0x6a4
	.uleb128 0x19
	.4byte	0x523
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF97
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
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB11
	.4byte	.LCFI0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0
	.4byte	.LCFI1
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI1
	.4byte	.LFE11
	.2byte	0x2
	.byte	0x7d
	.sleb128 40
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-1
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-1
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
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
.LASF35:
	.ascii	"_shortbuf\000"
.LASF84:
	.ascii	"_pad_bottom\000"
.LASF79:
	.ascii	"pdat\000"
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
.LASF95:
	.ascii	"wborder\000"
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
.LASF24:
	.ascii	"_IO_buf_end\000"
.LASF33:
	.ascii	"_cur_column\000"
.LASF10:
	.ascii	"__quad_t\000"
.LASF32:
	.ascii	"_old_offset\000"
.LASF37:
	.ascii	"_offset\000"
.LASF78:
	.ascii	"attr_t\000"
.LASF51:
	.ascii	"_win_st\000"
.LASF67:
	.ascii	"_sync\000"
.LASF71:
	.ascii	"_regtop\000"
.LASF46:
	.ascii	"_IO_marker\000"
.LASF89:
	.ascii	"stdin\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF99:
	.ascii	"win_border2.c\000"
.LASF53:
	.ascii	"_curx\000"
.LASF52:
	.ascii	"_cury\000"
.LASF92:
	.ascii	"initscr\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF91:
	.ascii	"stdscr\000"
.LASF21:
	.ascii	"_IO_write_ptr\000"
.LASF94:
	.ascii	"keypad\000"
.LASF48:
	.ascii	"_sbuf\000"
.LASF82:
	.ascii	"_pad_top\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF25:
	.ascii	"_IO_save_base\000"
.LASF96:
	.ascii	"wrefresh\000"
.LASF50:
	.ascii	"WINDOW\000"
.LASF93:
	.ascii	"cbreak\000"
.LASF36:
	.ascii	"_lock\000"
.LASF31:
	.ascii	"_flags2\000"
.LASF43:
	.ascii	"_mode\000"
.LASF90:
	.ascii	"stdout\000"
.LASF63:
	.ascii	"_scroll\000"
.LASF102:
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
.LASF100:
	.ascii	"/home/pi/ASM/ncurses/demo/ncurses_programs/basics\000"
.LASF101:
	.ascii	"_IO_lock_t\000"
.LASF45:
	.ascii	"_IO_FILE\000"
.LASF98:
	.ascii	"GNU C 4.7.2\000"
.LASF62:
	.ascii	"_leaveok\000"
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
.LASF7:
	.ascii	"short int\000"
.LASF34:
	.ascii	"_vtable_offset\000"
.LASF65:
	.ascii	"_idcok\000"
.LASF76:
	.ascii	"_pad\000"
.LASF97:
	.ascii	"endwin\000"
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
.LASF88:
	.ascii	"argv\000"
.LASF57:
	.ascii	"_begx\000"
.LASF56:
	.ascii	"_begy\000"
.LASF26:
	.ascii	"_IO_backup_base\000"
.LASF87:
	.ascii	"argc\000"
.LASF83:
	.ascii	"_pad_left\000"
.LASF69:
	.ascii	"_delay\000"
.LASF70:
	.ascii	"_line\000"
.LASF103:
	.ascii	"main\000"
.LASF20:
	.ascii	"_IO_write_base\000"
	.ident	"GCC: (Debian 4.7.2-5+rpi1) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
