.reads first 100 bytes from file 00.txt
.and writes to file 01.txt
vhizh		START	0
prog		LDX		#0
loop1		TD		INPUT
			JEQ		loop1
loop2		TD		OUTPUT
			JEQ		loop2
wloop		RD		INPUT
			WD		OUTPUT
			TIX		#100
			JLT		wloop
halt		J		halt
.variables
INPUT		BYTE	X'00'
OUTPUT		BYTE	X'01'
