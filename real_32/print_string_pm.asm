[bits 32]
; define some constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; prints a null-terminated string pointed to by EDX
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY    ; set edx to the start of the video VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx]            ; store the char at ebx in al
    mov ah, WHITE_ON_BLACK   ; store the attributes in ah

    cmp al, 0                ; if (al == 0), at end of string so
    je print_string_pm_done  ; jump to done

    mov [edx], ax            ; store char and attributes at current char cell
    add ebx, 1               ; inc ebs to the next char in the string
    add edx, 2               ; move to next char cell in vid mem

    jmp print_string_pm_loop ; loop around to print the next char

print_string_pm_done:
    popa
    ret
