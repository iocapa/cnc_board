.syntax unified
.cpu cortex-m0
.thumb

/*
memcpy implementation
r0 - destination pointer
r1 - source pointer
r2 - number of bytes
*/

.align		4
.section	.text
.type		memcpy, %function
.global		memcpy
.size		memcpy, .-memcpy

memcpy:
	push {r4}
	cmp r3, #0
	beq memcpy_exit
memcpy_loop:	
	subs r2, r2, #1
	ldrb r4, [r0, r2]
	strb r4, [r1, r2]
	bge memcpy_loop
memcpy_exit:
	pop {r4}
	bx lr

/*
memcpy implementation
r0 - destination pointer
r1 - 8 but constant value
r2 - number of bytes
*/

.align		4
.section	.text
.type		memset, %function
.global		memset
.size		memset, .-memset

memset:
	push {r4}
	cmp r3, #0
	beq memset_exit
memset_loop:	
	subs r2, r2, #1
	strb r1, [r0, r2]
	bge memset_loop
memset_exit:
	pop {r4}
	bx lr	