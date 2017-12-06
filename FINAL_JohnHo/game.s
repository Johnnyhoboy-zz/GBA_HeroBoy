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
	.file	"game.c"
	.text
	.align	2
	.global	initBoss
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	r0, #50
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	mov	r0, #250
	mov	r2, #0
	mov	r1, #1
	str	r0, [r3, #8]
	mov	r0, #200
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	mov	r0, #2
	str	r1, [r3, #52]
	str	r2, [r3, #36]
	mov	r1, #40
	str	r2, [r3, #60]
	mov	r2, #10
	str	r0, [r3, #48]
	str	r1, [r3, #56]
	str	r2, [r3, #68]
	bx	lr
.L3:
	.align	2
.L2:
	.word	king
	.size	initBoss, .-initBoss
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	str	r4, [sp, #-4]!
	ldmia	r3, {r4, ip}	@ phole ldm
	ldr	r3, .L5+4
	mov	r0, #24
	mov	r2, #0
	mov	r1, #1
	add	r4, r4, #68
	add	ip, ip, #108
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	mov	r0, #2
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r0, [r3, #48]
	str	r1, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #36]
	str	r2, [r3, #64]
	ldmfd	sp!, {r4}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initLives
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	mov	r2, #4
	mov	r0, #27
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	mov	r0, #24
	str	r2, [r3, #32]
	mov	r2, #44
	mov	r1, #0
	str	r0, [r3, #20]
	str	r2, [r3, #36]
	mov	r0, #28
	mov	r2, #29
	str	r1, [r3, #8]
	str	r1, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L9:
	.align	2
.L8:
	.word	hearts
	.size	initLives, .-initLives
	.align	2
	.global	initEnemies
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r3, .L21
	mov	fp, #412
	sub	sp, sp, #8
	add	fp, fp, #3
	mov	r5, #1
	mov	r2, #0
	mov	r9, #308
	mov	r8, #2
	ldr	sl, [r3, #8]
	ldr	r6, [r3, #12]
	str	fp, [sp, #4]
	mov	r7, r3
	mov	ip, #11
	mov	r4, #24
	mov	r0, r5
	mov	r1, r2
	add	r9, r9, r8
.L11:
	cmp	r2, #0
	moveq	r6, #412
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	addeq	r6, r6, #3
	moveq	sl, #64
	beq	.L12
	cmp	r2, #1
	moveq	fp, #190
	streq	r9, [r7, #80]
	streq	fp, [r7, #84]
	beq	.L12
	cmp	r2, #2
	beq	.L19
	cmp	r2, #3
	beq	.L20
	mov	fp, #280
	str	fp, [r7, #296]
	ldr	fp, [sp, #4]
	cmp	r5, #4
	str	fp, [r7, #300]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	str	r8, [r3, #48]
	str	r0, [r3, #52]
	str	ip, [r3, #56]
	str	r1, [r3, #36]
	str	r1, [r3, #64]
	ble	.L16
	ldr	r3, .L21
	str	sl, [r3, #8]
	str	r6, [r3, #12]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L19:
	mov	fp, #440
	str	fp, [r7, #152]
	mov	fp, #130
	str	fp, [r7, #156]
.L12:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	str	r8, [r3, #48]
	str	r0, [r3, #52]
	str	ip, [r3, #56]
	str	r1, [r3, #36]
	str	r1, [r3, #64]
.L16:
	add	r2, r2, #1
	add	r3, r3, #72
	add	r5, r5, #1
	add	ip, ip, #1
	b	.L11
.L20:
	mov	fp, #432
	str	fp, [r7, #224]
	ldr	fp, [sp, #4]
	str	fp, [r7, #228]
	b	.L12
.L22:
	.align	2
.L21:
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #0]
	cmp	r2, #0
	bne	.L24
	ldr	r3, .L37+4
	mov	ip, #24
	mov	r0, #2
	mov	r1, #1
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r2, [r3, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r1, [r3, #48]
	str	r2, [r3, #52]
.L25:
	ldr	r3, .L37+8
	ldr	r2, [r3, #0]
	cmp	r2, #0
	bne	.L27
	ldr	r3, .L37+12
	mov	r1, #20
	mov	r4, #24
	mov	ip, #2
	mov	r0, #1
.L28:
	str	r1, [r3, #12]
	add	r1, r1, #1
	cmp	r1, #25
	str	r4, [r3, #0]
	str	r4, [r3, #4]
	str	r2, [r3, #-24]
	str	r2, [r3, #-20]
	str	r2, [r3, #-16]
	str	r2, [r3, #-12]
	str	ip, [r3, #-8]
	str	ip, [r3, #-4]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	add	r3, r3, #56
	bne	.L28
.L23:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L27:
	mov	r1, #0
	ldr	r3, .L37+16
	mov	ip, #50
	mov	r2, r1
	mov	r0, #2
	mov	r5, #1
.L33:
	add	r4, r1, #45
	cmp	r1, #0
	cmpne	r1, #2
	str	r2, [r3, #16]
	str	ip, [r3, #0]
	str	ip, [r3, #4]
	str	r2, [r3, #-24]
	str	r2, [r3, #-20]
	str	r2, [r3, #-16]
	str	r2, [r3, #-12]
	str	r0, [r3, #-8]
	str	r0, [r3, #-4]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	str	r0, [r3, #28]
	beq	.L30
	cmp	r1, #4
	strne	r5, [r3, #16]
	beq	.L30
.L32:
	add	r1, r1, #1
	cmp	r1, #5
	add	r3, r3, #56
	bne	.L33
	b	.L23
.L30:
	str	r2, [r3, #16]
	b	.L32
.L24:
	ldr	r3, .L37+20
	mov	r1, #30
	mov	ip, #24
	mov	r2, #0
	mov	r0, #2
	mov	r4, #1
.L26:
	str	r1, [r3, #12]
	add	r1, r1, #1
	cmp	r1, #40
	str	ip, [r3, #0]
	str	ip, [r3, #4]
	str	r2, [r3, #-24]
	str	r2, [r3, #-20]
	str	r2, [r3, #-16]
	str	r2, [r3, #-12]
	str	r0, [r3, #-8]
	str	r0, [r3, #-4]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r4, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #56
	bne	.L26
	b	.L25
.L38:
	.align	2
.L37:
	.word	cheat
	.word	bullets
	.word	isBoss
	.word	enemyBullets+24
	.word	bossBullets+24
	.word	cheatBullets+24
	.size	initBullets, .-initBullets
	.align	2
	.global	initBossGame
	.type	initBossGame, %function
initBossGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L40
	mov	r1, #1
	stmfd	sp!, {r4, lr}
	ldr	r3, .L40+4
	str	r1, [r0, #0]
	ldr	r0, .L40+8
	mov	r2, #0
	str	r1, [r0, #0]
	str	r2, [r3, #4]
	str	r2, [r3, #0]
	bl	initPlayer
	bl	initBoss
	ldmfd	sp!, {r4, lr}
	b	initBullets
.L41:
	.align	2
.L40:
	.word	enemiesRemaining
	.word	.LANCHOR0
	.word	isBoss
	.size	initBossGame, .-initBossGame
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPlayer
	bl	initBullets
	bl	initEnemies
	bl	initLives
	ldr	r3, .L43
	ldrh	r1, [r3, #0]
	ldrh	r2, [r3, #4]
	mov	r3, #67108864
	strh	r1, [r3, #18]	@ movhi
	ldr	r1, .L43+4
	mov	r0, #5
	str	r0, [r1, #0]
	ldr	r1, .L43+8
	mov	r0, #3
	str	r0, [r1, #0]
	ldr	r1, .L43+12
	mov	r0, #1
	str	r0, [r1, #60]
	ldr	r1, .L43+16
	mov	r0, #0
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.word	enemiesRemaining
	.word	lives
	.word	king
	.word	isBoss
	.size	initGame, .-initGame
	.align	2
	.global	updateLives
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L48
	cmp	r3, #1
	ldreq	r2, .L49+4
	streq	r3, [r2, #24]
	bx	lr
.L48:
	ldr	r3, .L49+4
	mov	r2, #1
	str	r2, [r3, #40]
	bx	lr
.L50:
	.align	2
.L49:
	.word	lives
	.word	hearts
	.size	updateLives, .-updateLives
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	stmfd	sp!, {r4, r5}
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #56]
	ldr	r5, [r3, #44]
	ldr	r0, [r3, #36]
	ldr	r1, .L52+4
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	add	r0, r0, r5, asl #5
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5}
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawLives
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r0, #12]
	ldr	r2, .L58
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L57:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #12]
	ldrb	ip, [r0, #0]	@ zero_extendqisi2
	ldr	r1, .L58
	mov	r3, r3, asl #23
	mov	r2, r2, asl #3
	mvn	r0, r3, lsr #6
	mvn	r0, r0, lsr #17
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #272	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L59:
	.align	2
.L58:
	.word	shadowOAM
	.size	drawLives, .-drawLives
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #52]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r0, #60]
	cmp	r3, #0
	beq	.L63
.L61:
	ldr	r3, [r0, #56]
	ldr	r2, .L64
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
.L60:
	ldmfd	sp!, {r4}
	bx	lr
.L63:
	ldr	ip, [r0, #4]
	ldr	r2, [r0, #56]
	ldr	r3, [r0, #44]
	ldr	r1, .L64
	mov	ip, ip, asl #23
	ldrb	r4, [r0, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #3
	mov	r0, r3, asl #7
	mvn	ip, ip, lsr #6
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	add	r0, r0, #20
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	b	.L60
.L65:
	.align	2
.L64:
	.word	shadowOAM
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawBoss
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	str	r4, [sp, #-4]!
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L67
	ldr	r2, [r3, #60]
	cmp	r2, #0
	beq	.L69
.L67:
	ldr	r3, [r3, #56]
	ldr	r2, .L70+4
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
.L66:
	ldmfd	sp!, {r4}
	bx	lr
.L69:
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #44]
	mov	r0, r0, asl #23
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	ldr	r2, .L70+4
	mov	r1, r1, asl #8
	mov	r3, #320
	mvn	r0, r0, lsr #5
	add	r3, r3, #2
	add	r1, r1, #24
	mvn	r0, r0, lsr #18
	strh	r0, [r2, r3]	@ movhi
	orr	r1, r1, #4096
	mov	ip, #320
	mov	r3, #324
	strh	r4, [r2, ip]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	b	.L66
.L71:
	.align	2
.L70:
	.word	king
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L75
.L73:
	ldr	r3, [r0, #36]
	ldr	r2, .L76
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L75:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #36]
	ldrb	ip, [r0, #0]	@ zero_extendqisi2
	ldr	r1, .L76
	mov	r3, r3, asl #23
	mov	r2, r2, asl #3
	mvn	r0, r3, lsr #6
	mvn	r0, r0, lsr #17
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #16	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L77:
	.align	2
.L76:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawEnemyBullet
	.type	drawEnemyBullet, %function
drawEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L81
.L79:
	ldr	r3, [r0, #36]
	ldr	r2, .L82
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L81:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #36]
	ldrb	ip, [r0, #0]	@ zero_extendqisi2
	ldr	r1, .L82
	mov	r3, r3, asl #23
	mov	r2, r2, asl #3
	mvn	r0, r3, lsr #6
	mvn	r0, r0, lsr #17
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #144	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L83:
	.align	2
.L82:
	.word	shadowOAM
	.size	drawEnemyBullet, .-drawEnemyBullet
	.align	2
	.global	drawBossBullet
	.type	drawBossBullet, %function
drawBossBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L85
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L87
.L85:
	ldr	r3, [r0, #36]
	ldr	r2, .L88
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
.L84:
	ldmfd	sp!, {r4}
	bx	lr
.L87:
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #36]
	ldr	ip, .L88
	mov	r3, r3, asl #23
	ldrb	r4, [r0, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #3
	mvn	r0, r3, lsr #5
	mov	r3, #4480
	add	r2, ip, r1
	mvn	r0, r0, lsr #18
	add	r3, r3, #16
	strh	r4, [ip, r1]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L84
.L89:
	.align	2
.L88:
	.word	shadowOAM
	.size	drawBossBullet, .-drawBossBullet
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawPlayer
	ldr	r0, .L104
	bl	drawLives
	ldr	r0, .L104+4
	bl	drawLives
	ldr	r0, .L104+8
	bl	drawLives
	ldr	r3, .L104+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L91
	ldr	r0, .L104+16
	bl	drawBullet
	ldr	r3, .L104+20
	ldr	r4, [r3, #0]
	cmp	r4, #0
	bne	.L94
.L103:
	ldr	r5, .L104+24
.L95:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawEnemyBullet
	cmp	r4, #5
	bne	.L95
	ldr	r5, .L104+28
	mov	r4, #0
.L96:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawEnemies
	cmp	r4, #5
	bne	.L96
.L97:
	ldr	r1, .L104+32
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	ip, .L104+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L104+40
	ldrh	r1, [r3, #4]
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L91:
	ldr	r5, .L104+44
	mov	r4, #0
.L93:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #10
	bne	.L93
	ldr	r3, .L104+20
	ldr	r4, [r3, #0]
	cmp	r4, #0
	beq	.L103
.L94:
	bl	drawBoss
	ldr	r5, .L104+48
	mov	r4, #0
.L98:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawBossBullet
	cmp	r4, #5
	bne	.L98
	b	.L97
.L105:
	.align	2
.L104:
	.word	hearts
	.word	hearts+16
	.word	hearts+32
	.word	cheat
	.word	bullets
	.word	isBoss
	.word	enemyBullets
	.word	enemies
	.word	shadowOAM
	.word	DMANow
	.word	.LANCHOR0
	.word	cheatBullets
	.word	bossBullets
	.size	drawGame, .-drawGame
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L108+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r5, #0
	mov	r8, r0
	mov	r4, #67108864
	add	ip, ip, #12
	add	fp, r4, #256
	mov	r6, r2
	mov	sl, r1
	add	r2, r4, #160
	mov	r9, r3
	mov	r0, #1
	mov	r3, #910163968
	mov	r1, r8
	str	r5, [ip, #8]
	ldr	ip, .L108+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	strh	r5, [fp, #2]	@ movhi
	ldr	r3, .L108+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L108+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #128	@ movhi
	ldr	r7, .L108+24
	mov	r0, sl
	str	r8, [r4, #0]
	strh	r3, [fp, #2]	@ movhi
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	str	r5, [r4, #24]
	mov	lr, pc
	bx	r7
	adr	r3, .L108
	ldmia	r3, {r2-r3}
	ldr	ip, .L108+28
	mov	lr, pc
	bx	ip
	mov	sl, r0
	mov	r0, r6
	mov	fp, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L108+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	ip
	ldr	r3, .L108+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r5, [r4, #28]
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L109:
	.align	3
.L108:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L111+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r5, #0
	mov	r8, r0
	mov	r4, #67108864
	add	ip, ip, #24
	add	fp, r4, #256
	mov	r6, r2
	mov	sl, r1
	add	r2, r4, #164
	mov	r9, r3
	mov	r0, #2
	mov	r3, #910163968
	mov	r1, r8
	str	r5, [ip, #8]
	ldr	ip, .L111+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	strh	r5, [fp, #6]	@ movhi
	ldr	r3, .L111+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L111+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #128	@ movhi
	ldr	r7, .L111+24
	mov	r0, sl
	str	r8, [r4, #0]
	strh	r3, [fp, #6]	@ movhi
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	str	r5, [r4, #24]
	mov	lr, pc
	bx	r7
	adr	r3, .L111
	ldmia	r3, {r2-r3}
	ldr	ip, .L111+28
	mov	lr, pc
	bx	ip
	mov	sl, r0
	mov	r0, r6
	mov	fp, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L111+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	ip
	ldr	r3, .L111+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r5, [r4, #28]
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L112:
	.align	3
.L111:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L114
	ldr	r2, .L122
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L115
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	blt	.L115
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L119
	ldr	r1, .L122+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
.L115:
	ldr	r2, .L122+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L120
.L117:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L114:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L120:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	blt	.L117
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L121
	ldr	r1, .L122+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r2, #12]
	str	r3, [r0, #8]
	strh	r3, [r1, #6]	@ movhi
	b	.L117
.L119:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L115
.L121:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L117
.L123:
	.align	2
.L122:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	fireEnemyBullet
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L136
	stmfd	sp!, {r4, r5, r6}
	ldr	r4, [r3, #0]
	cmp	r4, #0
	bne	.L125
	ldr	r5, .L136+4
	ldr	r3, .L136+8
	mov	r2, r5
	mov	r1, r3
.L127:
	ldr	r0, [r2, #52]
	cmp	r0, #0
	beq	.L126
	ldr	r0, [r2, #60]
	cmp	r0, #0
	bne	.L126
	ldr	ip, [r1, #32]
	cmp	ip, #0
	beq	.L134
.L126:
	add	r4, r4, #1
	cmp	r4, #5
	add	r2, r2, #72
	add	r1, r1, #56
	bne	.L127
.L124:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L125:
	ldr	r0, .L136+12
	ldr	r3, .L136+16
	ldr	r1, [r0, #52]
	ldr	ip, [r0, #60]
	mov	r2, r3
	mov	r4, #0
.L130:
	cmp	r1, #0
	beq	.L129
	cmp	ip, #0
	bne	.L129
	ldr	r5, [r2, #32]
	cmp	r5, #0
	beq	.L135
.L129:
	add	r4, r4, #1
	cmp	r4, #5
	add	r2, r2, #56
	bne	.L130
	b	.L124
.L134:
	mov	r2, r4, asl #3
	add	r1, r2, r4
	add	r5, r5, r1, asl #3
	ldr	r6, [r5, #8]
	ldr	r5, [r5, #12]
	rsb	r4, r4, r2
.L133:
	add	r4, r3, r4, asl #3
	mov	r1, #8960
	mov	r2, #11008
	ldr	r0, .L136+20
	str	r5, [r4, #12]
	add	r1, r1, #16
	mov	r5, #1
	add	r2, r2, #17
	mov	r3, ip
	str	r6, [r4, #8]
	str	r5, [r4, #32]
	str	ip, [r4, #48]
	ldmfd	sp!, {r4, r5, r6}
	b	playSoundB
.L135:
	rsb	r4, r4, r4, asl #3
	ldr	r6, [r0, #8]
	ldr	r5, [r0, #12]
	b	.L133
.L137:
	.align	2
.L136:
	.word	isBoss
	.word	enemies
	.word	enemyBullets
	.word	king
	.word	bossBullets
	.word	fireball
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L159
	stmfd	sp!, {r4, r5}
	ldr	r3, [r3, #0]
	ldr	r4, .L159+4
	cmp	r3, #0
	mov	r3, #2
	str	r3, [r4, #44]
	bne	.L139
	ldr	ip, .L159+8
	ldr	r3, [ip, #32]
	cmp	r3, #0
	beq	.L157
.L138:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L139:
	ldr	r3, .L159+12
	mov	r1, r3
	ldr	r0, [r1, #32]
	cmp	r0, #0
	mov	r2, #0
	beq	.L158
.L142:
	add	r2, r2, #1
	cmp	r2, #10
	add	r1, r1, #56
	beq	.L138
	ldr	r0, [r1, #32]
	cmp	r0, #0
	bne	.L142
.L158:
	ldr	r1, [r4, #36]
	mov	ip, r2, asl #3
	ldr	r5, [r4, #8]
	rsb	r0, r2, ip
	ldr	r4, [r4, #12]
	add	r0, r3, r0, asl #3
	cmp	r1, #0
	str	r5, [r0, #8]
	str	r4, [r0, #12]
	beq	.L153
	cmp	r1, #1
	beq	.L153
	cmp	r1, #2
	beq	.L153
	cmp	r1, #3
	bne	.L144
.L153:
	str	r1, [r0, #40]
.L144:
	rsb	ip, r2, ip
	mov	r4, #0
	mov	r1, #13440
	mov	r2, #11008
	add	ip, r3, ip, asl #3
.L155:
	ldr	r0, .L159+16
	mov	r5, #1
	add	r1, r1, #55
	add	r2, r2, #17
	mov	r3, r4
	str	r5, [ip, #32]
	str	r4, [ip, #48]
	ldmfd	sp!, {r4, r5}
	b	playSoundB
.L157:
	ldr	r3, [r4, #36]
	add	r1, r4, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	cmp	r3, #0
	str	r1, [ip, #8]
	str	r2, [ip, #12]
	beq	.L154
	cmp	r3, #1
	beq	.L154
	cmp	r3, #2
	beq	.L154
	cmp	r3, #3
	beq	.L154
.L149:
	mov	r4, #0
	mov	r1, #13440
	mov	r2, #11008
	b	.L155
.L154:
	str	r3, [ip, #40]
	b	.L149
.L160:
	.align	2
.L159:
	.word	cheat
	.word	player
	.word	bullets
	.word	cheatBullets
	.word	slash_c1
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L187
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r0, .L187+4
	ldr	r2, [r3, #32]
	smull	r1, r0, r2, r0
	ldr	r1, .L187+8
	mov	r5, r2, asr #31
	rsb	r0, r5, r0, asr #3
	ldr	r7, [r3, #12]
	ldr	r5, [r3, #36]
	ldr	r4, [r1, #4]
	ldr	r6, [r3, #8]
	ldr	ip, [r1, #0]
	add	r0, r0, r0, asl #2
	rsb	r4, r4, r7
	rsb	ip, ip, r6
	str	r5, [r3, #40]
	subs	r2, r2, r0, asl #2
	mov	r5, #4
	str	r5, [r3, #36]
	str	r4, [r3, #4]
	str	ip, [r3, #0]
	bne	.L162
	ldr	r0, [r3, #44]
	cmp	r0, #0
	addle	r0, r0, #1
	strle	r0, [r3, #44]
	strgt	r2, [r3, #44]
.L162:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L164
	ldr	r2, [r3, #0]
	mov	r0, #1
	cmp	r2, #0
	str	r0, [r3, #36]
	ldr	r2, .L187
	blt	.L164
	add	r4, r2, #8
	ldmia	r4, {r4, ip}	@ phole ldm
	sub	r5, r4, #1
	ldr	r0, .L187+12
	add	ip, ip, r5, asl #9
	mov	r6, ip, asl #1
	ldrh	r6, [r0, r6]
	cmp	r6, #0
	beq	.L164
	ldr	r6, [r2, #24]
	add	ip, ip, r6
	add	r0, r0, ip, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L164
	cmp	r4, #64
	bgt	.L165
	str	r5, [r2, #8]
.L164:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	ands	r2, r2, #128
	bne	.L167
	ldr	r0, [r3, #28]
	ldr	ip, [r3, #0]
	add	ip, r0, ip
	cmp	ip, #159
	str	r2, [r3, #36]
	ldr	ip, .L187
	ble	.L185
.L167:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L170
	ldr	r2, [r3, #4]
	mov	r0, #2
	cmp	r2, #0
	str	r0, [r3, #36]
	ldr	r2, .L187
	blt	.L170
	add	r4, r2, #8
	ldmia	r4, {r4, r5}	@ phole ldm
	sub	r0, r5, #1
	ldr	ip, .L187+12
	add	r6, r0, r4, asl #9
	mov	r6, r6, asl #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	beq	.L170
	ldr	r6, [r2, #28]
	add	r4, r4, r6
	sub	r4, r4, #1
	add	r4, r0, r4, asl #9
	mov	r4, r4, asl #1
	ldrh	ip, [ip, r4]
	cmp	ip, #0
	beq	.L170
	cmp	r5, #103
	bgt	.L171
	str	r0, [r2, #12]
.L170:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #16
	beq	.L173
	ldr	r2, [r3, #36]
	cmp	r2, #4
	ldr	r2, .L187
	bne	.L175
	ldr	r3, [r2, #40]
	str	r3, [r2, #36]
	ldr	r3, .L187+16
	ldrh	r3, [r3, #0]
	mov	r1, #0
	tst	r3, #1
	str	r1, [r2, #44]
	bne	.L186
.L161:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L173:
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #4]
	add	r0, r2, r0
	cmp	r0, #239
	mov	ip, #3
	ldr	r0, .L187
	str	ip, [r3, #36]
	bgt	.L175
	add	r5, r0, #8
	ldmia	r5, {r5, ip}	@ phole ldm
	add	r2, ip, r2
	ldr	r4, .L187+12
	add	r6, r2, r5, asl #9
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, #0
	beq	.L175
	ldr	r6, [r0, #28]
	add	r5, r5, r6
	sub	r5, r5, #1
	add	r2, r2, r5, asl #9
	mov	r2, r2, asl #1
	ldrh	r2, [r4, r2]
	cmp	r2, #0
	beq	.L175
	cmp	ip, #103
	ble	.L184
	cmp	ip, #376
	bge	.L184
	ldr	r2, [r1, #4]
	add	ip, ip, #1
	add	r2, r2, #1
	str	r2, [r1, #4]
	str	ip, [r0, #12]
.L175:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
	ldr	r3, .L187+16
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L161
.L186:
	ldr	r3, .L187+20
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L161
	ldmfd	sp!, {r4, r5, r6, r7}
	b	fireBullet
.L185:
	add	r2, ip, #8
	ldmia	r2, {r2, r5}	@ phole ldm
	add	r0, r2, r0
	ldr	r4, .L187+12
	add	r0, r5, r0, asl #9
	mov	r5, r0, asl #1
	ldrh	r5, [r4, r5]
	cmp	r5, #0
	beq	.L167
	ldr	r5, [ip, #24]
	add	r0, r0, r5
	add	r4, r4, r0, asl #1
	ldrh	r0, [r4, #-2]
	cmp	r0, #0
	beq	.L167
	cmp	r2, #64
	ble	.L182
	cmp	r2, #416
	bgt	.L182
	ldr	r0, [r1, #0]
	add	r2, r2, #1
	add	r0, r0, #1
	str	r0, [r1, #0]
	str	r2, [ip, #8]
	b	.L167
.L171:
	cmp	r5, #376
	ldrlt	ip, [r1, #4]
	sublt	ip, ip, #1
	strlt	ip, [r1, #4]
	str	r0, [r2, #12]
	b	.L170
.L165:
	cmp	r4, #416
	ldrle	r0, [r1, #0]
	suble	r0, r0, #1
	strle	r0, [r1, #0]
	str	r5, [r2, #8]
	b	.L164
.L182:
	add	r2, r2, #1
	str	r2, [ip, #8]
	b	.L167
.L184:
	add	ip, ip, #1
	str	ip, [r0, #12]
	b	.L175
.L188:
	.align	2
.L187:
	.word	player
	.word	1717986919
	.word	.LANCHOR0
	.word	collisionmapBitmap
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	beq	.L223
	ldr	r3, .L230
	ldr	r2, [r3, #0]
	cmp	r2, #0
	bne	.L192
	ldr	r1, [r0, #44]
	cmp	r1, #50
	beq	.L221
.L193:
	ldr	r7, [r4, #52]
	cmp	r7, #1
	beq	.L224
.L194:
	cmp	r7, #2
	beq	.L225
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L210
	ldr	r2, [r4, #0]
	cmp	r2, #0
	blt	.L211
	ldr	ip, [r4, #8]
	ldr	r0, [r4, #12]
	sub	r2, ip, #1
	ldr	r3, .L230+4
	add	r2, r0, r2, asl #9
	mov	r1, r2, asl #1
	ldrh	r1, [r3, r1]
	cmp	r1, #0
	mov	r1, r0
	beq	.L212
	ldr	r5, [r4, #28]
	add	r2, r2, r5
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L226
.L212:
	mov	r3, #0
	mov	r2, #1
	str	r2, [r4, #48]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	mov	r0, r1
	mov	r2, ip
	b	.L191
.L225:
	ldr	r2, [r4, #40]
	cmp	r2, #0
	bne	.L202
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	rsb	r1, r2, r1
	str	r1, [r4, #12]
.L203:
	ldr	r2, [r4, #44]
	ldr	r7, [r3, #0]
	add	r3, r2, #1
	cmp	r7, #0
	str	r3, [r4, #44]
	bne	.L204
	ldr	r5, .L230+8
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r8, r5, #24
	ldmia	r8, {r8, sl}	@ phole ldm
	ldr	r0, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r6, .L230+12
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L205
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L205
	mov	r3, #1
	str	r7, [r4, #32]
	str	r7, [r4, #48]
	str	r7, [r4, #44]
	str	r7, [r5, #32]
	str	r3, [r5, #48]
	str	r7, [r5, #44]
.L205:
	ldr	ip, .L230+16
	ldr	r7, [ip, #8]
	ldr	r5, [ip, #12]
	add	ip, ip, #24
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	r7, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L223
	ldr	r5, .L230+20
	ldr	ip, [r5, #0]
	mov	r3, #0
	sub	ip, ip, #1
	mov	r1, #3904
	mov	r2, #11008
	str	r3, [r4, #32]
	str	r3, [r4, #48]
	str	r3, [r4, #44]
	ldr	r0, .L230+24
	add	r1, r1, #8
	add	r2, r2, #17
	str	ip, [r5, #0]
	bl	playSoundB
	ldr	r3, [r5, #0]
	cmp	r3, #0
	ldreq	r3, .L230+28
	moveq	lr, pc
	bxeq	r3
.L223:
	ldr	r0, [r4, #12]
	ldr	r2, [r4, #8]
.L191:
	ldr	r3, .L230+32
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #0]
	rsb	r0, r1, r0
	rsb	r2, r3, r2
	str	r0, [r4, #4]
	str	r2, [r4, #0]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L192:
	ldr	r2, [r0, #44]
	cmp	r2, #75
	bne	.L193
	mov	r2, #0
.L221:
	ldr	r7, [r4, #52]
	str	r2, [r4, #32]
	str	r2, [r4, #44]
	cmp	r7, #1
	mov	r2, #1
	str	r2, [r4, #48]
	bne	.L194
.L224:
	ldr	r0, [r4, #12]
	ldr	r2, [r4, #44]
	ldr	r8, [r3, #0]
	ldr	r1, [r4, #20]
	add	r3, r2, #1
	rsb	r1, r1, r0
	cmp	r8, #0
	str	r1, [r4, #12]
	str	r3, [r4, #44]
	bne	.L195
	ldr	r5, .L230+8
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	sl, [r5, #24]
	ldr	r9, [r5, #28]
	ldr	r0, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r6, .L230+12
	stmia	sp, {ip, lr}	@ phole stm
	str	sl, [sp, #8]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L196
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L196
	str	r8, [r4, #32]
	str	r8, [r4, #48]
	str	r8, [r4, #44]
	str	r8, [r5, #32]
	str	r7, [r5, #48]
	str	r8, [r5, #44]
.L196:
	ldr	ip, .L230+16
	ldr	r7, [ip, #8]
	ldr	r5, [ip, #12]
	add	ip, ip, #24
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	r7, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L223
	ldr	r5, .L230+20
	ldr	ip, [r5, #0]
	mov	r3, #0
	sub	ip, ip, #1
	mov	r1, #3904
	mov	r2, #11008
	str	r3, [r4, #32]
	str	r3, [r4, #48]
	str	r3, [r4, #44]
	ldr	r0, .L230+24
	add	r1, r1, #8
	add	r2, r2, #17
	str	ip, [r5, #0]
	bl	playSoundB
	ldr	r3, [r5, #0]
	cmp	r3, #0
	bne	.L223
	ldr	r3, .L230+28
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #12]
	ldr	r2, [r4, #8]
	b	.L191
.L210:
	cmp	r3, #1
	bne	.L213
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #0]
	add	r2, r3, r2
	cmp	r2, #159
	bgt	.L227
	ldr	ip, [r4, #8]
	ldr	r0, [r4, #12]
	add	r3, ip, r3
	ldr	r2, .L230+4
	add	r3, r0, r3, asl #9
	mov	r1, r3, asl #1
	ldrh	r1, [r2, r1]
	cmp	r1, #0
	mov	r1, r0
	beq	.L212
	ldr	r5, [r4, #28]
	add	r3, r3, r5
	add	r2, r2, r3, asl #1
	ldrh	r3, [r2, #-2]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	rsb	r2, r2, ip
	str	r2, [r4, #8]
	str	r3, [r4, #44]
	b	.L191
.L195:
	ldr	r5, .L230+36
	ldr	r6, .L230+12
	add	r9, r5, #560
	mov	r8, #0
	mov	fp, r7
	b	.L198
.L228:
	ldr	r1, [r4, #12]
.L198:
	ldr	lr, [r5, #8]
	ldr	ip, [r5, #12]
	add	r7, r5, #24
	ldmia	r7, {r7, sl}	@ phole ldm
	ldr	r0, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r7, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L197
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L197
	str	r8, [r4, #32]
	str	r8, [r4, #48]
	str	r8, [r4, #44]
	str	r8, [r5, #32]
	str	fp, [r5, #48]
	str	r8, [r5, #44]
.L197:
	add	r5, r5, #56
	cmp	r5, r9
	bne	.L228
	b	.L196
.L213:
	cmp	r3, #2
	bne	.L211
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #8]
	sub	r0, r1, #1
	ldr	r3, .L230+4
	add	ip, r0, r2, asl #9
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	mov	ip, r2
	beq	.L212
	ldr	r5, [r4, #24]
	add	r5, r2, r5
	sub	r5, r5, #1
	add	r0, r0, r5, asl #9
	mov	r0, r0, asl #1
	ldrh	r3, [r3, r0]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r4, #44]
	ldr	r0, [r4, #20]
	add	r3, r3, #1
	rsb	r0, r0, r1
	str	r0, [r4, #12]
	str	r3, [r4, #44]
	b	.L191
.L204:
	ldr	r5, .L230+36
	ldr	r6, .L230+12
	add	r8, r5, #560
	mov	r7, #0
	mov	fp, #1
	b	.L207
.L229:
	ldr	r1, [r4, #12]
.L207:
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	sl, [r5, #24]
	ldr	r9, [r5, #28]
	ldr	r0, [r4, #8]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	sl, [sp, #8]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L206
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L206
	str	r7, [r4, #32]
	str	r7, [r4, #48]
	str	r7, [r4, #44]
	str	r7, [r5, #32]
	str	fp, [r5, #48]
	str	r7, [r5, #44]
.L206:
	add	r5, r5, #56
	cmp	r5, r8
	bne	.L229
	b	.L205
.L202:
	cmp	r2, #1
	ldreq	r1, [r4, #12]
	ldreq	r2, [r4, #20]
	addeq	r1, r1, r2
	ldrne	r1, [r4, #12]
	streq	r1, [r4, #12]
	b	.L203
.L227:
	ldr	r1, [r4, #12]
	ldr	ip, [r4, #8]
	b	.L212
.L226:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #16]
	add	r3, r3, #1
	add	r2, ip, r2
	str	r2, [r4, #8]
	str	r3, [r4, #44]
	b	.L191
.L211:
	ldr	r2, [r4, #8]
	cmp	r3, #3
	ldr	r1, [r4, #12]
	mov	ip, r2
	bne	.L212
	ldr	r0, [r4, #28]
	add	r0, r1, r0
	ldr	r3, .L230+4
	add	r5, r0, r2, asl #9
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L212
	ldr	r5, [r4, #24]
	add	r5, r2, r5
	sub	r5, r5, #1
	add	r0, r0, r5, asl #9
	mov	r0, r0, asl #1
	ldrh	r3, [r3, r0]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r4, #44]
	ldr	r0, [r4, #20]
	add	r3, r3, #1
	add	r0, r1, r0
	str	r0, [r4, #12]
	str	r3, [r4, #44]
	b	.L191
.L231:
	.align	2
.L230:
	.word	cheat
	.word	collisionmapBitmap
	.word	bullets
	.word	collision
	.word	player
	.word	lives
	.word	hurt
	.word	goToLose
	.word	.LANCHOR0
	.word	cheatBullets
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #36]
	cmp	r3, #2
	mov	r4, r0
	beq	.L233
.L287:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	beq	.L295
	cmp	r3, #2
	beq	.L295
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #0]
	rsb	r0, r2, #0
	cmp	r1, r0
	movlt	lr, #1
	blt	.L240
	cmp	r1, #160
	movle	lr, #0
	movgt	lr, #1
.L240:
	ldr	r1, [r4, #32]
	ldr	r0, .L302
	smull	ip, r0, r1, r0
	mov	ip, r1, asr #31
	rsb	r0, ip, r0, asr #4
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	str	r3, [r4, #40]
	subs	r1, r1, r0, asl #1
	mov	r3, #3
	str	lr, [r4, #60]
	str	r3, [r4, #36]
	bne	.L241
	ldr	r3, [r4, #44]
	cmp	r3, #0
	strgt	r1, [r4, #44]
	ble	.L296
.L241:
	ldr	r3, .L302+4
	ldr	r7, [r3, #0]
	cmp	r7, #0
	bne	.L243
	ldr	r5, .L302+8
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r8, r5, #24
	ldmia	r8, {r8, sl}	@ phole ldm
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r4, #24]
	ldr	r6, .L302+12
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L288
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L288
	ldr	r9, .L302+16
	ldr	r3, [r9, #0]
	mov	r2, #2
	cmp	r3, #0
	str	r2, [r4, #36]
	str	r2, [r4, #44]
	str	r7, [r5, #32]
	beq	.L245
	ldr	r7, [r4, #60]
	cmp	r7, #0
	bne	.L244
	ldr	r3, [r4, #68]
	mov	r1, #6848
	sub	r3, r3, #1
	mov	r2, #11008
	str	r3, [r4, #68]
	ldr	r0, .L302+20
	add	r1, r1, #33
	add	r2, r2, #17
	mov	r3, r7
	bl	playSoundB
	ldr	r5, [r4, #68]
	cmp	r5, #0
	strne	r7, [r4, #36]
	bne	.L244
	mov	r1, #15360
	mov	r2, #11008
	ldr	r0, .L302+24
	add	r1, r1, #8
	add	r2, r2, #17
	mov	r3, r5
	bl	playSoundB
	str	r5, [r4, #52]
.L244:
	ldr	r7, .L302+28
	add	r5, r7, #8
	ldmia	r5, {r5, lr}	@ phole ldm
	add	r7, r7, #24
	ldmia	r7, {r7, ip}	@ phole ldm
	ldr	r2, [r4, #28]
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r4, #24]
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldreq	r2, [r9, #0]
	bne	.L297
.L252:
	cmp	r2, #0
	bne	.L256
	ldr	r3, .L302+32
	ldr	r1, [r3, #8]
	cmp	r1, #144
	bgt	.L289
	ldr	r0, .L302+36
	ldr	ip, [r0, #0]
	cmp	ip, #0
	beq	.L259
	ldr	ip, [r4, #36]
	cmp	ip, #2
	beq	.L291
	ldr	ip, [r4, #12]
	add	r1, r1, #1
	cmp	r1, #144
	sub	ip, ip, #1
	mov	r5, #1
	str	r1, [r3, #8]
	streq	r2, [r0, #0]
	str	r5, [r4, #36]
	str	ip, [r4, #12]
	streq	r2, [r3, #8]
	ldr	r0, [r4, #8]
.L261:
	ldr	r2, [r4, #32]
	add	r2, r2, #1
	str	r2, [r4, #32]
	mov	r1, ip
	mov	r2, r0
	b	.L238
.L233:
	ldr	r2, [r0, #64]
	add	r2, r2, #1
	cmp	r2, #30
	str	r2, [r0, #64]
	bne	.L287
	ldr	r3, .L302+40
	ldr	r2, [r3, #0]
	mov	r1, #0
	sub	r2, r2, #1
	str	r1, [r0, #52]
	str	r2, [r3, #0]
.L295:
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #8]
	ldr	r3, .L302+32
.L238:
	ldr	r0, [r3, #4]
	ldr	r3, [r3, #0]
	rsb	r1, r0, r1
	rsb	r2, r3, r2
	str	r1, [r4, #4]
	str	r2, [r4, #0]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L243:
	ldr	r5, .L302+44
	ldr	r6, .L302+12
	ldr	r9, .L302+16
	add	r7, r5, #560
	mov	fp, #2
	b	.L250
.L300:
	ldr	r2, [r4, #28]
.L250:
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r8, r5, #24
	ldmia	r8, {r8, sl}	@ phole ldm
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [r4, #24]
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L247
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L247
	ldr	r3, [r9, #0]
	cmp	r3, #0
	mov	r3, #0
	str	fp, [r4, #36]
	str	fp, [r4, #44]
	str	r3, [r5, #32]
	beq	.L298
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L299
.L247:
	add	r5, r5, #56
	cmp	r5, r7
	bne	.L300
	b	.L244
.L256:
	ldr	r3, .L302+32
	ldr	r2, [r3, #8]
	cmp	r2, #120
	ble	.L262
.L289:
	ldr	r5, [r4, #36]
	add	r0, r4, #8
	ldmia	r0, {r0, ip}	@ phole ldm
	cmp	r5, #3
	mov	r1, ip
	mov	r2, r0
	bne	.L261
	ldr	r0, [r4, #40]
	mov	ip, #0
	str	ip, [r4, #44]
	str	r0, [r4, #36]
	b	.L238
.L288:
	ldr	r9, .L302+16
	b	.L244
.L262:
	ldr	r1, .L302+36
	ldr	ip, [r1, #0]
	cmp	ip, #0
	beq	.L263
	ldr	r0, [r4, #36]
	cmp	r0, #2
	beq	.L291
	add	r2, r2, #1
	ldr	r0, [r4, #8]
	cmp	r2, #120
	mov	ip, #1
	str	r2, [r3, #8]
	sub	r0, r0, #1
	moveq	r2, #0
	str	ip, [r4, #36]
	str	r0, [r4, #8]
	streq	r2, [r3, #8]
	streq	r2, [r1, #0]
	ldr	ip, [r4, #12]
	b	.L261
.L263:
	ldr	r0, [r4, #36]
	cmp	r0, #2
	bne	.L284
.L291:
	add	r0, r4, #8
	ldmia	r0, {r0, ip}	@ phole ldm
	b	.L261
.L298:
	mov	r1, #6976
	mov	r2, #11008
	ldr	r0, .L302+48
	add	r1, r1, #14
	add	r2, r2, #17
	bl	playSoundB
	b	.L247
.L297:
	ldr	r5, .L302+52
	ldr	ip, [r5, #0]
	mov	r6, #0
	sub	ip, ip, #1
	mov	r1, #3904
	mov	r2, #11008
	add	r2, r2, #17
	str	r6, [r4, #52]
	ldr	r0, .L302+56
	add	r1, r1, #8
	mov	r3, r6
	str	ip, [r5, #0]
	bl	playSoundB
	ldr	r2, [r9, #0]
	cmp	r2, r6
	strne	r6, [r5, #0]
	beq	.L301
.L254:
	ldr	r3, .L302+60
	mov	lr, pc
	bx	r3
	ldr	r2, [r9, #0]
.L255:
	ldr	r3, .L302+40
	ldr	r1, [r3, #0]
	sub	r1, r1, #1
	str	r1, [r3, #0]
	b	.L252
.L299:
	ldr	r0, [r4, #68]
	mov	r1, #6848
	sub	r0, r0, #1
	mov	r2, #11008
	str	r0, [r4, #68]
	add	r1, r1, #33
	ldr	r0, .L302+20
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r4, #68]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #36]
	bne	.L247
	mov	r1, #15360
	mov	r2, #11008
	ldr	r0, .L302+24
	add	r1, r1, #8
	add	r2, r2, #17
	bl	playSoundB
	mov	ip, #0
	str	ip, [r4, #52]
	b	.L247
.L301:
	ldr	r3, [r5, #0]
	cmp	r3, #0
	bne	.L255
	b	.L254
.L259:
	ldr	ip, [r4, #36]
	cmp	ip, #2
	beq	.L291
	ldr	ip, [r4, #12]
	mov	r5, #1
	add	r1, r1, #1
	cmp	r1, #144
	add	ip, ip, r5
	str	r1, [r3, #8]
	streq	r5, [r0, #0]
	str	r5, [r4, #36]
	str	ip, [r4, #12]
	streq	r2, [r3, #8]
	ldr	r0, [r4, #8]
	b	.L261
.L284:
	ldr	r0, [r4, #8]
	mov	r5, #1
	add	r2, r2, #1
	cmp	r2, #120
	add	r0, r0, r5
	str	r2, [r3, #8]
	str	r5, [r4, #36]
	streq	ip, [r3, #8]
	str	r0, [r4, #8]
	streq	r5, [r1, #0]
	ldr	ip, [r4, #12]
	b	.L261
.L245:
	mov	r1, #6976
	mov	r2, #11008
	ldr	r0, .L302+48
	add	r1, r1, #14
	add	r2, r2, #17
	bl	playSoundB
	b	.L244
.L296:
	add	r3, r3, #1
	str	r3, [r4, #44]
	bl	fireEnemyBullet
	ldr	r2, [r4, #28]
	b	.L241
.L303:
	.align	2
.L302:
	.word	1374389535
	.word	cheat
	.word	bullets
	.word	collision
	.word	isBoss
	.word	slimehit
	.word	slimedeath
	.word	player
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	enemiesRemaining
	.word	cheatBullets
	.word	pig
	.word	lives
	.word	hurt
	.word	goToLose
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r3, .L321
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L319
	cmp	r3, #1
	ldreq	r2, .L321+4
	streq	r3, [r2, #24]
.L306:
	ldr	r3, .L321+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L307
	ldr	r0, .L321+12
	bl	updateBullet
	ldr	r3, .L321+16
	ldr	r4, [r3, #0]
	cmp	r4, #0
	bne	.L310
.L320:
	ldr	r5, .L321+20
.L311:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L311
	ldr	r5, .L321+24
	mov	r4, #0
.L312:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateEnemies
	cmp	r4, #5
	bne	.L312
.L304:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L307:
	ldr	r5, .L321+28
	mov	r4, #0
.L309:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #10
	bne	.L309
	ldr	r3, .L321+16
	ldr	r4, [r3, #0]
	cmp	r4, #0
	beq	.L320
.L310:
	ldr	r0, .L321+32
	bl	updateEnemies
	ldr	r5, .L321+36
	mov	r4, #0
.L314:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L314
	b	.L304
.L319:
	ldr	r3, .L321+4
	mov	r2, #1
	str	r2, [r3, #40]
	b	.L306
.L322:
	.align	2
.L321:
	.word	lives
	.word	hearts
	.word	cheat
	.word	bullets
	.word	isBoss
	.word	enemyBullets
	.word	enemies
	.word	cheatBullets
	.word	king
	.word	bossBullets
	.size	updateGame, .-updateGame
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L324
	mov	r2, #0
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L324+4
	add	r3, r3, #256
	str	r2, [r1, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L325:
	.align	2
.L324:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L327
	mov	r1, #1
	str	r1, [r0, #12]
	mov	r3, #67108864
	ldr	r0, .L327+4
	add	r3, r3, #256
	mov	r2, #128
	str	r1, [r0, #12]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L328:
	.align	2
.L327:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L330
	ldr	ip, .L330+4
	ldr	r1, [r3, #0]
	mov	r3, #0
	str	r3, [ip, #12]
	mov	r2, #67108864
	ldr	ip, .L330+8
	add	r2, r2, #256
	add	r0, r1, #12
	add	r1, r1, #24
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	bx	lr
.L331:
	.align	2
.L330:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L333
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L334:
	.align	2
.L333:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	hOff
	.global	vOff
	.global	count
	.global	forward
	.comm	player,72,4
	.comm	king,72,4
	.comm	hearts,48,4
	.comm	bullets,56,4
	.comm	cheatBullets,560,4
	.comm	enemyBullets,280,4
	.comm	bossBullets,280,4
	.comm	enemiesRemaining,4,4
	.comm	lives,4,4
	.comm	enemies,360,4
	.comm	enemy1,72,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	forward, %object
	.size	forward, 4
forward:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	count, %object
	.size	count, 4
count:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
