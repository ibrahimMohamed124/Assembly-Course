section .data
    msg1 db "Enter your first number: "
    len1 equ $ - msg1

    msg2 db "Enter your second number: "
    len2 equ $ - msg2

    msg3 db "Result: "
    len3 equ $ - msg3

    newline db 10

section .bss
    num1 resb 2      ; digit + newline
    num2 resb 2      ; digit + newline

section .text
global _start

_start:
    ; print msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; read num1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; print msg2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; read num2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; swap ASCII digits
    mov al, [num1]
    mov bl, [num2]
    mov [num1], bl
    mov [num2], al

    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; print "Result: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; print swapped num1
    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 1
    int 0x80

    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; print swapped num2
    mov eax, 4
    mov ebx, 1
    mov ecx, num2
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
