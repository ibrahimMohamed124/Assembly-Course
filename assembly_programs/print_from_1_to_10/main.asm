section .bss
    num resb 1

section .text
global _start

_start:
    mov ecx, 9        ; print out 9 numbers
    mov al, '1'

start_loop:
    mov [num], al

    ; sys_write   
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 1
    int 0x80

    ; inc number
    mov al, [num]
    inc al

    dec ecx
    jnz start_loop

    ; sys_exit
    mov eax, 1
    xor ebx, ebx
    int 0x80