.arithmetics using register-register instructions
arit	START 		0
prog	LDX			X1		.load X1 into reg X
		LDS			Y1		.load Y1 into reg S
.addition
		RMO			X, A	.move value from reg X to reg A
		ADDR 		S, A	.add registers S and A
		STA			SUM		.save into SUM
.substraction
		RMO			X, A
		SUBR		S, A
		STA			DIFF
.multiplication
		RMO			X, A
		MULR		S, A
		STA			PROD
.division
		RMO  		X, A
		DIVR		S, A
		STA			QUOT
.modulo
		MULR		S, A
		RMO			A, S
		RMO			X, A
		SUBR		S, A
		STA			MOD
.clear registers
		CLEAR		A
		CLEAR		B
		CLEAR		X
halt	J 			halt
.variables
X1		WORD		20
Y1		WORD		3
SUM		RESW		1
DIFF	RESW		1
PROD	RESW		1
QUOT	RESW		1
MOD		RESW		1
