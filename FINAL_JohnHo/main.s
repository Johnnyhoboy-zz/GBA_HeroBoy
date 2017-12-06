	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	mov	r3, #5888
	mov	r0, #3
	ldr	r1, .L2+12
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L2+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L2+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #57088
	strh	r1, [r2, #8]	@ movhi
	ldr	r1, .L2+24
	mov	r3, #0
	str	r3, [r1, #0]
	ldr	r1, .L2+28
	strh	r3, [r2, #16]	@ movhi
	str	r3, [r1, #0]
	ldr	r1, .L2+32
	strh	r3, [r2, #18]	@ movhi
	str	r3, [r1, #0]
	mov	r3, #256	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	waitForVBlank
	.word	startBgPal
	.word	loadPalette
	.word	startBgTiles
	.word	DMANow
	.word	startBgMap
	.word	state
	.word	menu
	.word	cheat
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	mov	r1, #696320
	add	r1, r1, #688
	mov	r2, #11008
	ldr	r0, .L5+8
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L5+12
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L6:
	.align	2
.L5:
	.word	setupInterrupts
	.word	setupSounds
	.word	menuMusic
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L11
	mov	r1, #811008
	add	r1, r1, #3184
	mov	r2, #11008
	ldr	r0, .L12+8
	add	r1, r1, #13
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L12+12
	mov	lr, pc
	bx	ip
.L9:
	mov	r5, #67108864
	mov	r3, #56320
	strh	r3, [r5, #8]	@ movhi
	mov	r3, #0	@ movhi
	strh	r3, [r5, #16]	@ movhi
	ldr	r0, .L12+16
	strh	r3, [r5, #18]	@ movhi
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+24
	mov	r0, #3
	ldr	r1, .L12+28
	mov	r2, #100663296
	mov	r3, #10176
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+32
	add	r2, r2, #57344
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+36
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+40
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r3, #6912
	add	r3, r3, #16
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L12+44
	mov	lr, pc
	bx	r3
	mov	ip, #4352	@ movhi
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L12+48
	strh	ip, [r5, #0]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+52
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L11:
	mov	r1, #376832
	add	r1, r1, #1072
	mov	r2, #11008
	ldr	r0, .L12+56
	add	r1, r1, #10
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L12+12
	mov	lr, pc
	bx	ip
	b	.L9
.L13:
	.align	2
.L12:
	.word	stopSound
	.word	.LANCHOR0
	.word	battle
	.word	playSoundA
	.word	gameBGPal
	.word	loadPalette
	.word	DMANow
	.word	gameBGTiles
	.word	gameBGMap
	.word	spriteSheetPal
	.word	spriteSheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.word	slimeboss
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L15+8
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+16
	mov	r0, #3
	ldr	r1, .L15+20
	mov	r2, #100663296
	mov	r3, #544
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+24
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L15+28
	mov	r2, #0
	mov	r0, #2
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	waitForVBlank
	.word	pauseSound
	.word	PausePal
	.word	loadPalette
	.word	DMANow
	.word	PauseTiles
	.word	PauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
	ldr	r2, .L22+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L20
.L18:
	tst	r3, #4
	beq	.L17
	ldr	r3, .L22+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L21
.L17:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	mov	r1, #696320
	add	r1, r1, #688
	mov	r2, #11008
	ldr	r0, .L22+12
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L22+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L20:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L23:
	.align	2
.L22:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	menuMusic
	.word	playSoundA
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r0, .L25+4
	ldr	r3, .L25+8
	mov	lr, pc
	bx	r3
	mov	r3, #6528
	mov	r0, #3
	ldr	r1, .L25+12
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L25+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L25+24
	mov	r2, #0
	mov	r0, #3
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	WinPal
	.word	loadPalette
	.word	WinTiles
	.word	DMANow
	.word	WinMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L30+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L29:
	mov	r1, #696320
	add	r1, r1, #688
	mov	r2, #11008
	ldr	r0, .L30+12
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L30+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L31:
	.align	2
.L30:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	menuMusic
	.word	playSoundA
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	mov	lr, pc
	bx	r3
	mov	r2, #11008
	ldr	ip, .L33+8
	mov	r1, #10944
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L33+12
	mov	lr, pc
	bx	ip
	ldr	r0, .L33+16
	ldr	r3, .L33+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L33+24
	mov	r0, #3
	ldr	r1, .L33+28
	mov	r2, #100663296
	mov	r3, #1616
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+32
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L33+36
	mov	r2, #0
	mov	r0, #4
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	lost
	.word	losePal
	.word	loadPalette
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L39+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	bne	.L36
.L37:
	mov	r1, #696320
	add	r1, r1, #688
	mov	r2, #11008
	ldr	r0, .L39+12
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L39+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L36:
	tst	r3, #1
	beq	.L35
	ldr	r3, .L39+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L37
.L35:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	menuMusic
	.word	playSoundA
	.size	lose, .-lose
	.align	2
	.global	goToInfo
	.type	goToInfo, %function
goToInfo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r0, .L42+4
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	mov	r3, #5568
	mov	r0, #3
	ldr	r1, .L42+12
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L42+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L42+24
	mov	r2, #0
	mov	r0, #5
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	waitForVBlank
	.word	infoPal
	.word	loadPalette
	.word	infoTiles
	.word	DMANow
	.word	infoMap
	.word	state
	.size	goToInfo, .-goToInfo
	.align	2
	.global	info
	.type	info, %function
info:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L48
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L48+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	bne	.L45
.L46:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L45:
	tst	r3, #1
	beq	.L44
	ldr	r3, .L48+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L46
.L44:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	info, .-info
	.align	2
	.global	goToIntro
	.type	goToIntro, %function
goToIntro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	mov	lr, pc
	bx	r3
	mov	r1, #14208
	mov	r2, #11008
	ldr	ip, .L51+8
	add	r1, r1, #2
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L51+12
	mov	lr, pc
	bx	ip
	ldr	r0, .L51+16
	ldr	r3, .L51+20
	mov	lr, pc
	bx	r3
	mov	r3, #5184
	mov	r0, #3
	ldr	r1, .L51+24
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L51+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L51+32
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L51+36
	mov	r2, #0
	mov	r0, #6
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	text
	.word	introBGPal
	.word	loadPalette
	.word	introBGTiles
	.word	DMANow
	.word	introBGMap
	.word	state
	.size	goToIntro, .-goToIntro
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L67
	ldr	r3, .L67+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #4
	beq	.L54
	ldr	r2, .L67+8
	ldrh	r2, [r2, #0]
	tst	r2, #4
	ldreq	r2, .L67+12
	moveq	r1, #1
	streq	r1, [r2, #0]
.L54:
	tst	r3, #128
	beq	.L55
	ldr	r2, .L67+8
	ldrh	r2, [r2, #0]
	tst	r2, #128
	beq	.L63
.L55:
	tst	r3, #64
	beq	.L56
	ldr	r2, .L67+8
	ldrh	r5, [r2, #0]
	ands	r5, r5, #64
	beq	.L64
.L56:
	ands	r2, r3, #8
	beq	.L57
	ldr	r1, .L67+8
	ldrh	r1, [r1, #0]
	tst	r1, #8
	bne	.L57
	ldr	r1, .L67+16
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L65
.L59:
	cmp	r2, #0
	beq	.L60
	ldr	r2, .L67+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	bne	.L60
	ldr	r3, .L67+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L66
.L53:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L57:
	tst	r3, #1
	beq	.L59
	ldr	r1, .L67+8
	ldrh	r1, [r1, #0]
	tst	r1, #1
	bne	.L59
	ldr	r1, .L67+16
	ldr	r1, [r1, #0]
	cmp	r1, #0
	bne	.L59
	b	.L65
.L60:
	tst	r3, #1
	beq	.L53
	ldr	r3, .L67+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L53
	ldr	r3, .L67+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L53
.L66:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToInfo
.L64:
	ldr	r0, .L67+20
	ldr	r3, .L67+24
	mov	lr, pc
	bx	r3
	mov	r3, #5888
	mov	r0, #3
	ldr	r1, .L67+28
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r6, .L67+32
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L67+36
	mov	lr, pc
	bx	r6
	ldr	r2, .L67+16
	ldrh	r3, [r4, #0]
	str	r5, [r2, #0]
	b	.L56
.L63:
	ldr	r0, .L67+40
	ldr	r3, .L67+24
	mov	lr, pc
	bx	r3
	mov	r3, #5888
	mov	r0, #3
	ldr	r1, .L67+44
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r5, .L67+32
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L67+48
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+16
	mov	r2, #1
	str	r2, [r3, #0]
	ldrh	r3, [r4, #0]
	b	.L55
.L65:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToIntro
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	cheat
	.word	menu
	.word	startBgPal
	.word	loadPalette
	.word	startBgTiles
	.word	DMANow
	.word	startBgMap
	.word	startBg2Pal
	.word	startBg2Tiles
	.word	startBg2Map
	.size	start, .-start
	.align	2
	.global	intro
	.type	intro, %function
intro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L70
	ldr	r2, .L73+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	bne	.L70
	bl	goToGame
.L72:
	ldr	r2, .L73+12
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L73+16
	str	r3, [r2, #0]
	ldr	r3, .L73+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L70:
	tst	r3, #1
	beq	.L72
	ldr	r3, .L73+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L72
	bl	goToGame
	b	.L72
.L74:
	.align	2
.L73:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	vOff
	.word	initGame
	.size	intro, .-intro
	.align	2
	.global	goToTransition
	.type	goToTransition, %function
goToTransition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	mov	r1, #14208
	mov	r2, #11008
	ldr	ip, .L76+8
	add	r1, r1, #2
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L76+12
	mov	lr, pc
	bx	ip
	ldr	r0, .L76+16
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	mov	r3, #5248
	mov	r0, #3
	ldr	r1, .L76+24
	mov	r2, #100663296
	add	r3, r3, #48
	ldr	r4, .L76+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L76+32
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L76+36
	mov	r2, #0
	mov	r0, #7
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	text
	.word	transitionBGPal
	.word	loadPalette
	.word	transitionBGTiles
	.word	DMANow
	.word	transitionBGMap
	.word	state
	.size	goToTransition, .-goToTransition
	.align	2
	.global	transition
	.type	transition, %function
transition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L81
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L81+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L80
.L78:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L80:
	ldr	r3, .L81+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L81+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L82:
	.align	2
.L81:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	enemiesRemaining
	.word	initBossGame
	.size	transition, .-transition
	.align	2
	.global	goToFinal
	.type	goToFinal, %function
goToFinal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	mov	r1, #14208
	mov	r2, #11008
	ldr	ip, .L84+8
	add	r1, r1, #2
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L84+12
	mov	lr, pc
	bx	ip
	ldr	r0, .L84+16
	ldr	r3, .L84+20
	mov	lr, pc
	bx	r3
	mov	r3, #5056
	mov	r0, #3
	ldr	r1, .L84+24
	mov	r2, #100663296
	add	r3, r3, #48
	ldr	r4, .L84+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L84+32
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L84+36
	mov	r2, #0
	mov	r0, #8
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	text
	.word	finalBGPal
	.word	loadPalette
	.word	finalBGTiles
	.word	DMANow
	.word	finalBGMap
	.word	state
	.size	goToFinal, .-goToFinal
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L87
	ldr	r3, .L94+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L91
.L87:
	ldr	r3, .L94+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L92
	ldr	r3, .L94+24
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L86
	ldr	r3, .L94+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L93
	ldmfd	sp!, {r4, lr}
	b	goToTransition
.L86:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L91:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L92:
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L93:
	ldmfd	sp!, {r4, lr}
	b	goToFinal
.L95:
	.align	2
.L94:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	enemiesRemaining
	.word	.LANCHOR0
	.size	game, .-game
	.align	2
	.global	goToEnd
	.type	goToEnd, %function
goToEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L97
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	mov	r1, #49408
	mov	r2, #11008
	ldr	ip, .L97+8
	add	r1, r1, #128
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L97+12
	mov	lr, pc
	bx	ip
	ldr	r0, .L97+16
	ldr	r3, .L97+20
	mov	lr, pc
	bx	r3
	mov	r3, #8768
	mov	r0, #3
	ldr	r1, .L97+24
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L97+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L97+32
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #57088
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L97+36
	mov	r2, #0
	mov	r0, #9
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	victory
	.word	endPal
	.word	loadPalette
	.word	endTiles
	.word	DMANow
	.word	endMap
	.word	state
	.size	goToEnd, .-goToEnd
	.align	2
	.global	final
	.type	final, %function
final:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L102
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L99
	ldr	r3, .L102+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L101
.L99:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L101:
	ldmfd	sp!, {r4, lr}
	b	goToEnd
.L103:
	.align	2
.L102:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	final, .-final
	.align	2
	.global	end
	.type	end, %function
end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L107
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L104
	ldr	r3, .L107+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L106
.L104:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L106:
	mov	r1, #696320
	add	r1, r1, #688
	mov	r2, #11008
	ldr	r0, .L107+12
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L107+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L108:
	.align	2
.L107:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	menuMusic
	.word	playSoundA
	.size	end, .-end
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L126
	ldr	r7, .L126+4
	ldr	r6, .L126+8
	add	r5, r5, #256
.L125:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L111:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #9
	ldrls	pc, [pc, r2, asl #2]
	b	.L111
.L122:
	.word	.L112
	.word	.L113
	.word	.L114
	.word	.L115
	.word	.L116
	.word	.L117
	.word	.L118
	.word	.L119
	.word	.L120
	.word	.L121
.L121:
	bl	end
	b	.L125
.L120:
	bl	final
	b	.L125
.L119:
	bl	transition
	b	.L125
.L118:
	bl	intro
	b	.L125
.L117:
	bl	info
	b	.L125
.L116:
	bl	lose
	b	.L125
.L115:
	bl	win
	b	.L125
.L114:
	bl	pause
	b	.L125
.L113:
	bl	game
	b	.L125
.L112:
	bl	start
	b	.L125
.L127:
	.align	2
.L126:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	isBoss
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	cheat,4,4
	.comm	state,4,4
	.comm	menu,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isBoss, %object
	.size	isBoss, 4
isBoss:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
