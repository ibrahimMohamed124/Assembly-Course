section .data
    msg db "Hello World!", 0x0A ;(msg+ newline)

section .text
global _start

_start:
    mov eax, 4 ;syscall (sys_write)
    mov ebx, 1 ; stdout
    mov ecx, msg
    mov edx, 13
    int 80h

    ;exit(0)
    mov eax, 1 
    xor eax, eax ; or mov eax, 0
    int 80h
