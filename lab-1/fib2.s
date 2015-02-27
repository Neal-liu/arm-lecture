	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	
	mov r3, #-1	@ previous = -1
	mov r4, #1	@ result = 1
	mov r5, #0	@ i = 0
	mov r6, #0	@ sum = 0

.loop:
	
	add r6, r3, r4	@ sum = previous + result
	mov r3, r4	@ previous = result
	mov r4, r6	@ result = sum
	add r5, #1	@ i++

	cmp r5, r0	@ compare i and x. if i<=x , continue loop
	ite gt		@ if , then , else => if r5 > r0(i>x), then next instruction
	movgt r0, r4	@ return result
	ble .loop	


	bx lr
	.size fibonacci, .-fibonacci
	.end
