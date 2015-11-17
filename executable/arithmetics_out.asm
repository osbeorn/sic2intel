# How to run:
#	as -o arithmetics_out.o arithmetics_out.asm
#	ld -o arithmetics_out arithmetics_out.o
#	./arithmetics

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
_start:
prog:           mov     %eax, [X1]
                mov     %edi, [33]
                add     %eax, [3 + %edi]
                mov     [SUM], %eax
                mov     %eax, [X1]
                sub     %eax, [Y1]
                mov     [DIFF], %eax
                mov     %eax, [X1]
                imul    %eax, [Y1]
                mov     [PROD], %eax
                mov     %eax, [X1]
                push    %edx
                idiv    dword ptr [Y1]
                pop     %edx
                mov     [QUOT], %eax
                mov     %eax, [QUOT]
                imul    %eax, [Y1]
                mov     [MOD], %eax
                mov     %eax, [X1]
                sub     %eax, [MOD]
                mov     [MOD], %eax
halt:           mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
