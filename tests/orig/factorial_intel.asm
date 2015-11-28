# How to run:
#	as -o factorial_intel.o factorial_intel.asm
#	ld -o factorial_intel factorial_intel.o
#	./factorial_intel

.intel_syntax
.data
_t3:            .space  4
_t2:            .long   10
_t1:            .space  4
_t0:            .space  4
file:           .byte   0xFA
konec:          .byte   99, 101, 110, 111, 107
                .byte   0x00
stacka:         .space  4
stackptr:       .space  4
stack:          .space  16384
echonlA:        .byte   1
echostrtx:      .space  4
echonuml:       .space  4
echonumb:       .byte   9

.text
.global         _start          
_start:
first:          call    stackinit
loop:           mov     %eax, 8
                call    fac
                call    echonum
                call    echonl
death:          mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
fac:            cmp     %eax, 1
                jg      facdoit
                mov     %eax, 1
                ret     
facdoit:        mov     %esi, [stackptr]
                mov     [%esi], %ebp
                call    stackpush
                mov     %esi, [stackptr]
                mov     [%esi], %eax
                call    stackpush
                sub     %eax, 1
                call    fac
                call    stackpop
                mov     %esi, [stackptr]
                imul    %eax, [%esi]
                call    stackpop
                mov     %esi, [stackptr]
                mov     %ebp, [%esi]
                ret     
stackinit:      mov     %eax, offset stack
                mov     [stackptr], %eax
                ret     
stackpush:      mov     [stacka], %eax
                mov     %eax, [stackptr]
                add     %eax, 3
                mov     [stackptr], %eax
                mov     %eax, [stacka]
                ret     
stackpop:       mov     [stacka], %eax
                mov     %eax, [stackptr]
                sub     %eax, 3
                mov     [stackptr], %eax
                mov     %eax, [stacka]
                ret     
echonl:         mov     [echonlA], %al
                mov     %al, 10
                movzx   %eax, %al
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
                mov     %al, [echonlA]
                movzx   %eax, %al
                ret     
echostr:        mov     [echostrtx], %eax
echostrlp:      mov     %esi, [echostrtx]
                mov     %al, [%esi]
                movzx   %eax, %al
                cmp     %eax, 0
                je      echostrret
echostrl1:      mov     [_t1], %eax
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
                mov     %eax, 1
                add     %eax, [echostrtx]
                mov     [echostrtx], %eax
                jmp     echostrlp
echostrret:     ret     
echonum:        mov     %edi, 0
echonumlp:      mov     %ecx, %eax
                push    %edx
		xor	%edx, %edx
                idiv    dword ptr [_t2]
                pop     %edx
                mov     %edx, %eax
                imul    %eax, 10
                sub     %ecx, %eax
                mov     %eax, %ecx
                add     %eax, 48
                mov     [echonumb + %edi], %al
                add     %edi, 1
                cmp     %edi, %eax
                mov     %eax, %edx
                cmp     %eax, 0
                je      echonumex
                jmp     echonumlp
echonumex:      mov     %eax, 0
                mov     %ecx, 1
                mov     %edx, 0
echonuml1:      sub     %edi, %ecx
                cmp     %edi, %edx
                jl      echonumret
                mov     [echonuml], %ebp
                mov     %al, [echonumb + %edi]
                movzx   %eax, %al
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
                mov     %ebp, [echonuml]
                jmp     echonuml1
echonumret:     ret     
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80

