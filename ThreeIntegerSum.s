/* CS-170-70 Three Ineger Sum Project */
/* George Sanchez */

.section .data
/* Prompt message */
prompt: .asciz "Enter three integer values: "

/* Response message */
response: .asciz "You entered %d, %d, %d, and the sum is %d\n"

/* Format pattern for scanf */
pattern: .asciz "%d %d %d"

/* Where scanf will store the number read */
/* Added sum which is where I will store the sum */
value_read1: .word 0
value_read2: .word 0
value_read3: .word 0
sum: .word 0

.section .text

.global main
main:
	push {lr}

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	ldr r1, =value_read1  	
		ldr r2, =value_read2	
    	ldr r3, =value_read3
		bl scanf              	/* call to scanf */
next:
	ldr r0, =response	/* r0 contains pointer to response message */
	ldr r1, =value_read1	
	ldr r1, [r1]		
	ldr r2, =value_read2
	ldr r2, [r2]
	ldr r3, =value_read3
	ldr r3, [r3]

	/* code to allow addition */
	ldr r4, =sum
	mov r5, r4
	add r4, r1, r2
	add r4, r4, r3
	str r4, [r5]

	push {r4}
	bl printf		/* call printf to output our response */
	pop {r4}

	mov r0, #0		
pop {pc}		/* exit our main function */
	