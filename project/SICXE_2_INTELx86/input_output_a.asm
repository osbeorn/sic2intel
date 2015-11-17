inout	START	0
prog	LDX		#0
loop	TD		OUTPUT
		JEQ		loop
wloop	LDCH	DATA, X
		WD		OUTPUT
		TIX		#6
		JLT		wloop
halt	J		halt
.variables
OUTPUT	BYTE	1
DATA    BYTE    X'53'       .S
		BYTE    X'49'       .I
		BYTE    X'43'       .C
		BYTE    X'2F'       ./
		BYTE    X'58'       .X
		BYTE    X'45'       .E
