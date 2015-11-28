# Program reads from STDIN and writes to STDOUT
#
# How to run:
#	as -o copy_intel.o copy_intel.asm
#	ld -o copy_intel copy_intel.o
#	./copy_intel
#

.intel_syntax
.data
_t1:            .space  4
_t0:            .space  4

.text
.global         _start
_start:
loop:           push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x3
                mov     %ebx, 0
                mov     %ecx, offset _t0
                mov     %edx, 0x1
                int     0x80
                cmp     %eax, 0
                je      halt
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                mov     %eax, [_t0]
                mov     [_t1], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, 1
                mov     %ecx, offset _t1
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                jmp     loop
halt:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80

