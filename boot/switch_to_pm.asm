[bits 16]

switch_to_pm:
    cli ; clear all interrupts

    lgdt [gdt_descriptor]
    mov eax, cr0 ; to make the switch to protected mode, we set
    or eax, 0x1  ; the first bit of cr0, a control register
    mov cr0, eax ; update the control register

    jmp CODE_SEG:init_pm

[bits 32]

init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call BEGIN_PM
