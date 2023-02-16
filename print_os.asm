;
; A boot sector program that can print strings
;

[org 0x7c00]                ; BIOS loads this program here

mov bx, HELLO_MSG           ; setup param to call print_string
call print_string           ; setup ret addres for the called function to return to

mov dx, 0x1fb6              ; store the value to print in dx
call print_hex              ; call the function

jmp $                       ; indefinte loop

%include "print_string.asm" ; load the utility function to print strings

; global variables
HELLO_MSG:
    db "Hello, World!", 0   ; 0 is for null termination check

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55

