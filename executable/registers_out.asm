# How to run:
#	as -o registers_out.o registers_out.asm
#	ld -o registers_out registers_out.o
#	./registers

.intel_syntax
.data
X1:             .long   20
Y1:             .long   3
SUM:            .space  4
DIFF:           .space  4
PROD:           .space  4
QUOT:           .space  4
MOD:            .space  4

.text
.global         _start          
prog:           mov     %edi, [X1]
                mov     %ecx, [Y1]
                mov     %eax, %edi
                add     %eax, %ecx
                mov     [SUM], %eax
                mov     %eax, %edi
                sub     %eax, %ecx
                mov     [DIFF], %eax
                mov     %eax, %edi
                imul    %eax, %ecx
                mov     [PROD], %eax
                mov     %eax, %edi
                push    %edx
                idiv    %ecx
                pop     %edx
                mov     [QUOT], %eax
                imul    %eax, %ecx
                mov     %ecx, %eax
                mov     %eax, %edi
                sub     %eax, %ecx
                mov     [MOD], %eax
                mov     %eax, 0
                mov     %ebx, 0
                mov     %edi, 0
halt:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
