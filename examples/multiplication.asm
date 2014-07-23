.multiply X1 and X2
.condition: X1 > 0

MULT	START	0
		LDS		#0
		LDA		X1
		COMP	#1
		JLT		ENDL
		LDX		X2
ADDLP	ADDR	X, S
		SUB		#1
		COMP	#0
		JGT		ADDLP
ENDL	J		ENDL

.variables
X1		WORD 7
X2		WORD 5


