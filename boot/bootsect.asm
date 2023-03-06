; A bootsector that boots a C kernel in 32-bit protected mode
[org 0x7c00]

KERNEL_OFFSET equ 0x1000  ; mem offset to which we'll load our kernel

    mov [BOOT_DRIVE], dl ; BIOS store boot drive in dl

    mov bp, 0x9000  ; setup the the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string

    call load_kernel

    call switch_to_pm

    jmp $

%include "./boot/print.asm"
%include "./boot/disk_load.asm"
%include "./boot/gdt.asm"
%include "./boot/32bit_print.asm"
%include "./boot/switch_to_pm.asm"

[bits 16]

load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string

    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]

BEGIN_PM:

    mov ebx, MSG_PROT_MODE
    call print_string_pm

    call KERNEL_OFFSET ; jump to the address of our loaded kernel code

    jmp $

; globals

BOOT_DRIVE db 0
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0

; bootsector padding
times 510-($-$$) db 0
dw 0xaa55



