# How to run:
#	as -o abeceda_out.o abeceda_out.asm
#	ld -o abeceda_out abeceda_out.o
#	./abeceda_out

.intel_syntax
.data
_t0:            .space  4
PRVAC:          .long   65
ZADNJA:         .long   91
OUTPUT:         .byte   1
ENA:            .long   1

.text
.global         _start          
                mov     %eax, [PRVAC]
LOOP:           mov     [_t0], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, 1
                mov     %ecx, offset _t0
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                add     %eax, [ENA]
                cmp     %eax, [ZADNJA]
                jl      LOOP
HALT:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
