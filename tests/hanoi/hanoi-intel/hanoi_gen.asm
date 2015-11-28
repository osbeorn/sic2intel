# How to run:
#	as -o stack-hanoi_out.o stack-hanoi_out.asm
#	ld -o stack-hanoi_out stack-hanoi_out.o
#	./stack-hanoi

.intel_syntax
.data
_t3:            .space  4
_t2:            .space  4
_t1:            .space  4
_t0:            .space  4
ABC:            .byte   0x43, 0x42, 0x41
VECJE:          .byte   0x3E
hanoiS1:        .byte   1
hanoiS2:        .byte   1
hanoiS3:        .byte   1
echonlA:        .byte   1
stacka:         .space  4
stackptr:       .space  4
stack:          .space  40000

.text
.global         _start
_start:
first:          call    stackinit
                mov     %eax, <INPUT_N>  
                mov     %ecx, [ABC]
                call    hanoi
death:          mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
hanoi:          cmp     %eax, 0
                jg      hanoi1
                ret
hanoi1:         mov     %esi, [stackptr]
                mov     [%esi], %ebp
                call    stackpush
                mov     %esi, [stackptr]
                mov     [%esi], %edx
                call    stackpush
                mov     %esi, [stackptr]
                mov     [%esi], %ecx
                call    stackpush
                sub     %eax, 1
                mov     %edx, %eax
                mov     %eax, %ecx
                mov     [hanoiS3], %al
                shr     %eax, 8
                mov     [hanoiS2], %al
                mov     %al, [hanoiS3]
                shl     %eax, 8
                mov     %al, [hanoiS2]
                mov     %ecx, %eax
                mov     %eax, %edx
                call    hanoi
                call    stackpop
                mov     %esi, [stackptr]
                mov     %ecx, [%esi]
                mov     %eax, %ecx
                shr     %eax, 16
                mov     [_t0], %eax
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
                mov     %al, [VECJE]
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
                mov     %eax, %ecx
                shr     %eax, 8
                mov     [_t2], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, 1
                mov     %ecx, offset _t2
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                call    echonl
                mov     %eax, %ecx
                mov     [hanoiS3], %al
                shr     %eax, 8
                mov     [hanoiS2], %al
                shr     %eax, 8
                mov     [hanoiS1], %al
                mov     %al, [hanoiS3]
                shl     %eax, 8
                mov     %al, [hanoiS2]
                shl     %eax, 8
                mov     %al, [hanoiS1]
                mov     %ecx, %eax
                mov     %eax, %edx
                call    hanoi
                call    stackpop
                mov     %esi, [stackptr]
                mov     %edx, [%esi]
                call    stackpop
                mov     %esi, [stackptr]
                mov     %ebp, [%esi]
                ret
echonl:         mov     [echonlA], %al
                mov     %al, 10
                mov     [_t3], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, 1
                mov     %ecx, offset _t3
                mov     %edx, 0x1
                int     0x80
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                mov     %al, [echonlA]
                ret
stackinit:      mov     %eax, offset stack
                mov     [stackptr], %eax
                ret
stackpush:      mov     [stacka], %eax
                mov     %eax, [stackptr]
                add     %eax, 4 
                mov     [stackptr], %eax
                mov     %eax, [stacka]
                ret
stackpop:       mov     [stacka], %eax
                mov     %eax, [stackptr]
                sub     %eax, 4 
                mov     [stackptr], %eax
                mov     %eax, [stacka]
                ret
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80

