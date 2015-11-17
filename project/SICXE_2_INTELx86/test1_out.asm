# How to run:
#	as -o test1_out.o test1_out.asm
#	ld -o test1_out test1_out.o
#	./test1_out

.intel_syntax
.data
_t1:            .string "NUM.txt"
_t0:            .space  4
                .equ    NUM, 123

.text
.global         _start          
_start:
prog:           push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x5
                mov     %ebx, offset _t1
                mov     %ecx, 0x66
                mov     %edx, 0x1B6
                int     0x80
                mov     [_t0], %eax
                cmp     %eax, -1
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
