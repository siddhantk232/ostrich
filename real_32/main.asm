; A bootsector that enter 32-bit protected mode.
[org 0x7c00]

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string

    call switch_to_pm

    jmp $

%include "./print_string.asm"
%include "./real_32/gdt.asm"
%include "./real_32/print_string_pm.asm"
%include "./real_32/switch_to_pm.asm"

[bits 32]

; beginning of protected mode
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm ; use 32-bit print routine

    jmp $

; Global variables
MSG_REAL_MODE db "started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0

; bootsector padding
times 510-($-$$) db 0
dw 0xaa55

