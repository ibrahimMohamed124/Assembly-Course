section .data
    msg db "Enter a string: ", 0
    msg_len equ $-msg
    yes db "Palindrome!", 0xA, 0
    yes_len equ $-yes
    no db "Not a palindrome!", 0xA, 0
    no_len equ $-no
    buffer times 100 db 0    ; buffer for user input

section .bss
    str_len resb 1

section .text
    global _start

_start:
    ; write prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; read user input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buffer
    mov edx, 100
    int 0x80

    ; remove newline
    mov ecx, eax        ; number of bytes read
    dec ecx
    mov byte [buffer + ecx], 0

    ; store length
    mov [str_len], cl

    ; set pointers
    mov esi, buffer         ; start pointer
    mov edi, buffer
    mov cl, [str_len]       ; string length
    dec cl
    add edi, ecx            ; end pointer

check_loop:
    cmp esi, edi
    jge palindrome          ; if start >= end, it's palindrome

    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_palindrome

    inc esi
    dec edi
    jmp check_loop

palindrome:
    ; print yes
    mov eax, 4
    mov ebx, 1
    mov ecx, yes
    mov edx, yes_len
    int 0x80
    jmp exit

not_palindrome:
    ; print no
    mov eax, 4
    mov ebx, 1
    mov ecx, no
    mov edx, no_len
    int 0x80

exit:
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80
