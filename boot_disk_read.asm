[org 0x7c00]

mov [BOOT_DRIVE], dl   ; BIOS store boot drive in DL

mov bp, 0x8000         ; setup stack
mov sp, bp

mov bx, 0x9000         ; load 5 sectors to 0x0000(ES):0x9000(BX)
mov dh, 5              ; from the boot disk
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]       ; print out the first loaded word, which
call print_hex         ; we expect to be 0xdada, stored at 0x9000

mov dx, [0x9000 + 512] ; also, print the first word form the
call print_hex         ; 2nd loaded sector: should be 0xface

jmp $

%include "./print_string.asm"
%include "./disk_load.asm"

; Global variables
BOOT_DRIVE: db 0

; bootsector padding
times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
