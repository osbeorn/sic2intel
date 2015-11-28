Fac         START   0
first       JSUB    stackinit
.
loop    LDA     #8
        JSUB    fac
        JSUB    echonum
        JSUB    echonl

. death end
death       J       death
.
.
file    BYTE    X'FA'
konec   BYTE    C'konec'
        BYTE    X'00'
.
.
. Factorial of A calculation.
fac         COMP   #1           . if (n>1) then
            JGT     facdoit     .    goto facdoit
            LDA    #1           . else return 1
            RSUB
facdoit     STL    @stackptr    . push L
            JSUB    stackpush
            STA    @stackptr    . push A
            JSUB    stackpush
            SUB    #1           . A=n-1
            JSUB    fac         . recursion
            JSUB    stackpop    . trick: just pop, no LDA
            MUL    @stackptr    . A=(n-1)*n
            JSUB    stackpop    . pop L
            LDL    @stackptr
            RSUB
.
. ********* stack ***********
stackinit   LDA    #stack
            STA     stackptr
            RSUB
.
stackpush   STA     stacka
            LDA     stackptr
            ADD    #3
            STA     stackptr
            LDA     stacka
            RSUB
.
stackpop    STA     stacka
            LDA     stackptr
            SUB    #3
            STA     stackptr
            LDA     stacka
            RSUB
.
stacka      RESW    1
stackptr    RESW    1
stack       RESW    4096
.
. *******************************************************************
. Izpis znaka NL/A na stdout
echonl      STCH    echonlA
            LDCH    #10
            WD      #1
            LDCH    echonlA
            RSUB
echonlA     RESB    1
.
echostr     STA     echostrtx
echostrlp   LDCH    @echostrtx
            COMP   #0
            JEQ     echostrret
echostrl1   WD     #1
            LDA    #1
            ADD     echostrtx
            STA     echostrtx
            J       echostrlp
echostrret  RSUB
echostrtx   RESW    1
.
.
echonum     CLEAR   X
echonumlp   RMO     A, S
            DIV     #10
            RMO     A, T        . save: T = A/10
            MUL     #10         . A = (A/10) * 10
            SUBR    A, S        . S = S - (A/10)*10
            RMO     S, A
            ADD     #48          . ascii code of '0'
            STCH    echonumb, X
            TIXR    A
            RMO     T, A
            COMP    #0
            JEQ     echonumex
            J       echonumlp
echonumex   CLEAR   A
            LDS    #1
            LDT    #0
echonuml1   SUBR    S, X
            COMPR   X, T
            JLT      echonumret
            STL     echonuml
            LDCH    echonumb, X
            WD     #1
            LDL     echonuml
            J       echonuml1
echonumret  RSUB
echonuml    RESW    1
echonumb    RESB    9       . max 8 digits + \0
.
            END     first

