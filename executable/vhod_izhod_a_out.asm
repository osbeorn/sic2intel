# How to run:
#	as -o vhod_izhod_a_out.o vhod_izhod_a_out.asm
#	ld -o vhod_izhod_a_out vhod_izhod_a_out.o
#	./vhod_izhod_a_out

.intel_syntax
.data
_t2:            .space  4
_t1:            .string "AA.txt"
_t0:            .space  4
OUTPUT:         .byte   0xAA
DATA:           .byte   0x53
                .byte   0x49
                .byte   0x43
                .byte   0x2F
                .byte   0x58
                .byte   0x45

.text
.global         _start          
_start:
prog:           mov     %edi, 0
loop:           push    %eax
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
                je      loop
wloop:          mov     %al, [DATA + %edi]
                movzx   %eax, %al
                mov     [_t2], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, [_t0]
                mov     %ecx, offset _t2
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                add     %edi, 1
                cmp     %edi, 6
                jl      wloop
halt:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
