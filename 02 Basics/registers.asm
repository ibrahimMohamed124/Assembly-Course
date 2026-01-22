section .text
global _start

_start:
    mov eax, 5      ; eax = 5
    mov ebx, 10     ; ebx = 10
    add eax, ebx    ; eax = eax + ebx = 15
    sub eax, 3      ; eax = eax - 3 = 12
    imul eax, 2     ; eax = eax * 2 = 24
    mov ecx, 4
    idiv ecx        ; eax = eax / ecx = 6, edx = remainder = 0

    ; خروج
    mov eax, 1
    int 0x80
