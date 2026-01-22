section .data
    msg db "Hello World!", 0x0A ;(msg+ newline)

section .text
global _start

_start:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, msg
    mov edx, 13
    int 80h

    ;exit(0)
    mov eax, 1 
    xor ebx, ebx 
    int 80h
