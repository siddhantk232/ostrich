; load DH sectors to ES:BX from drive DL
disk_load:
    push dx        ; Store DX on stack so late we can recall how
                   ; many sectors were request to be read,
                   ; even if it is latered in the meantime
    mov ah, 0x02   ; BIOS read sector function
    mov al, dh     ; read DH sectors
    mov ch, 0x00   ; select cylinder 0
    mov dh, 0x00   ; select head 0
    mov cl, 0x02   ; start reading from second sector (i.e.
                   ; after the boot sector)
    int 0x13       ; BIOS interrupt

    jc disk_error  ; jump if error (i.e. if carry flag is set)

    pop dx         ; restore dx from the stack
    cmp dh, al     ; if AL (sectors read) != DH (sectors expecteD)
    jne disk_error ; display error message
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

; variables
DISK_ERROR_MSG: db "Disk read error!", 0
