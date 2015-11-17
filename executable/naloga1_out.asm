# How to run:
#	as -o naloga1_out.o naloga1_out.asm
#	ld -o naloga1_out naloga1_out.o
#	./naloga1_out

.intel_syntax
.data
_t9:            .long   10
_t8:            .space  4
_t7:            .string "01.txt"
_t6:            .space  4
_t5:            .space  4
_t4:            .string "01.txt"
_t3:            .space  4
_t2:            .space  4
_t1:            .string "01.txt"
_t0:            .space  4
file:           .byte   0xFA
konec:          .byte   0x99, 0x101, 0x110, 0x111, 0x107
                .byte   0x00
stacka:         .space  4
stackptr:       .space  4
stack:          .space  16384
NICENA:         .byte   0x01
NICA:           .byte   0x0A
echonlA:        .byte   1
echostrtx:      .space  4
echonuml:       .space  4
echonumb:       .byte   9

.text
.global         _start          
_start:
first:          call    stackinit
loop:           mov     %eax, 10
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
echoch:         push    %eax
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
                je      echoch
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
                ret     
echonl:         mov     [echonlA], %al
                mov     %al, [NICA]
                movzx   %eax, %al
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x5
                mov     %ebx, offset _t4
                mov     %ecx, 0x66
                mov     %edx, 0x1B6
                int     0x80
                mov     [_t3], %eax
                cmp     %eax, -1
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                je      echoch
                mov     [_t5], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, [_t3]
                mov     %ecx, offset _t5
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
echostrl1:      push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x5
                mov     %ebx, offset _t7
                mov     %ecx, 0x66
                mov     %edx, 0x1B6
                int     0x80
                mov     [_t6], %eax
                cmp     %eax, -1
                pop     %edx
                pop     %ecx
                pop     %ebx
                pop     %eax
                je      echostrl1
                mov     [_t8], %eax
                push    %eax
                push    %ebx
                push    %ecx
                push    %edx
                mov     %eax, 0x4
                mov     %ebx, [_t6]
                mov     %ecx, offset _t8
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
                idiv    dword ptr [_t9]
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
                call    echoch
                mov     %ebp, [echonuml]
                jmp     echonuml1
echonumret:     ret     
                mov     %eax, 0x1
                mov     %ebx, 0x0
                int     0x80
