# How to run:
#	as -o vhod_izhod_b_out.o vhod_izhod_b_out.asm
#	ld -o vhod_izhod_b_out vhod_izhod_b_out.o
#	./vhod_izhod_b_out

.intel_syntax
.data
_t5:            .space  4
_t4:            .space  4
_t3:            .string "01.txt"
_t2:            .space  4
_t1:            .string "00.txt"
_t0:            .space  4
INPUT:          .byte   0x00
OUTPUT:         .byte   0x01

.text
.global         _start          
_start:
prog:           mov     %edi, 0
loop1:          push    %eax
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
                je      loop1
loop2:          push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x5
                mov     %ebx, offset _t3
                mov     %ecx, 0x66
                mov     %edx, 0x1B6
                int     0x80
                mov     [_t2], %eax
                cmp     %eax, -1
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                je      loop2
wloop:          push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x3
                mov     %ebx, [_t0]
                mov     %ecx, offset _t4
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                mov     %eax, [_t4]
                mov     [_t5], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, [_t2]
                mov     %ecx, offset _t5
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                add     %edi, 1
                cmp     %edi, 100
                jl      wloop
halt:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
