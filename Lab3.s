.data
format: .asciz "%d"
otherFormat: .asciz "%d\n"
.text
.extern scanf
.extern printf
.global main

main:
	push	{fp, lr}
	sub sp, sp, #12
	mov fp, sp

	@Get input from user
	ldr r0, =format
	mov r1, fp
	bl scanf
	ldr r0, [fp]

	@ Store input in stack
	str r0, [fp, #8]

	@Get input from user
	ldr r0, =format
	mov r1, fp
	bl scanf
	ldr r0, [fp]

	@ Store input in stack
	str r0, [fp, #4]

	@Get input from user
	ldr r0, =format
	mov r1, fp
	bl scanf
	ldr r0, [fp]

	@ Store input in stack
	str r0, [fp]

	@Clear r1
	mov r1, #0

	@Load value from stack and add to r1
	ldr r0, [fp]
	add r1, r1, r0

	@Load value from stack and add to r1
	ldr r0, [fp, #4]
	add r1, r1, r0

	@Load value from stack and add to r1
	ldr r0, [fp, #8]
	add r1, r1, r0

	@Print value
	ldr r0, =otherFormat
	bl printf

	add sp, sp, #12
	pop	{fp, lr}
	bx lr
