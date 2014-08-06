	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	
	ldr r1, =locked
	.L1:
		ldrex r2, [r0]			// read lock value
		cmp r2, #0
			strexeq r2, r1, [r0]	// try and claim the lock
			cmpeq r2, #0
			bne .L1			// branch if not equal

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        
	ldr r1, =unlocked
	str r1, [r0]
	bx lr

        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
