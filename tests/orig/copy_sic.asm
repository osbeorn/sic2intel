. Program reads from STDIN and writes to STDOUT
.
. How to run (to copy STDIN to STDOUT):
.
.   java -jar SicVM.jar copy_sic.asm
.
. or (to copy infile to outfile)
.
.   java -jar SicVM.jar copy_sic.asm < infile > outfile
.
copy    START   0
loop    RD      #0
        COMP    #0
        JEQ     halt
        WD      #1
        J loop
halt    J halt

