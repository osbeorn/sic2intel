. Program copies characters from standard input 
. and writes them to standard output

copy    START   0
loop    RD      #0
        COMP    #0
        JEQ     halt
        WD      #1
        J loop
halt    J halt

