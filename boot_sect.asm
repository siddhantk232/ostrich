;
; A simple boot sector program that loops forever.
;

[org 0x7c00]

mov ah, 0x0e            ; scrolling teletype BIOS routine

mov al, 'H'
int 0x10

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'
int 0x10

mov al, 'o'
int 0x10

mov al, ' '
int 0x10

mov al, 'w'
int 0x10

mov al, 'o'
int 0x10

mov al, 'r'
int 0x10

mov al, 'l'
int 0x10

mov al, 'd'
int 0x10

jmp $                       ; jump to current address

times 510-($-$$) db 0
dw 0xaa55                   ; magic number 0xaa55 to let BIOS know we are boot sector
