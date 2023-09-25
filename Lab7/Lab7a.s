#ELABORADO POR: Jose Ricardo Olarte Pardo
		.data
		.align	4
n:		.word	0
		.align 	4
a:		.word	0
		.align	4
b:		.word	0
		.align	4
c:		.word	0
		.align	4
X:		.word	0
		.align	4
ret:		.word	0
		.align	4
res:		.word	0
		.align	4
fmt_s:		.asciz	"%d"
		.align	4
fmt_p:		.asciz	"%d\n"

		.text
		.global	main
		.global	scanf
		.global	printf

main:		LDR	R0, =ret
		STR	LR, [R0]

		LDR	R0, =fmt_s
		LDR	R1, =n
		BL	scanf

		LDR	R0, =n
		LDR	R8, [R0]	@ R8 = n

while:		CMP	R8, #0		@ n == 0?
		BEQ	end		@ Si n == 0, salta BAL, sino continua

		LDR	R0, =fmt_s
		LDR	R1, =a
		BL	scanf

		LDR	R0, =fmt_s
		LDR	R1, =b
		BL	scanf

		LDR	R0, =fmt_s
		LDR	R1, =c
		BL	scanf

		LDR	R0, =fmt_s
		LDR	R1, =X
		BL	scanf

		LDR	R0, =a
		LDR	R1, [R0]	@ R1 = a

		LDR	R0, =X
		LDR	R2, [R0]	@ R2 = X

		MUL	R3, R1, R2	@ R3 = a * X
		MUL	R4, R2, R3	@ R4 = a * X^2

		LDR	R0, =b
		LDR	R1, [R0]	@ R1 = b

		MUL	R5, R1, R2	@ R5 = b * X

		ADD	R6, R4, R5	@ R6 = a * X^2 + b * X

		LDR	R0, =c
		LDR	R1, [R0]	@ R1 = c

		ADD	R7, R1, R6	@ R7 = a * X^2 + b * X + c
		LDR	R0, =res
		STR	R7, [R0]	@ res = R7

		LDR	R0, =fmt_p
		LDR	R1, =res
		LDR	R1, [R1]
		BL	printf

		LDR	R0, =n
		LDR	R1, [R0]	@ R1 = n
		SUB	R8, R1, #1	@ R8 = n - 1
		LDR	R2, =n
		STR	R8, [R2]	@ n = R8

		BAL	while

end:		LDR	R0, =ret
		LDR	LR, [R0]

		MOV	R0, #0

		BX	LR
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		