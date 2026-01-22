section .data
    msg1 db "Enter first number here: "
    len1 equ $ - msg1

    msg2 db "Enter second number here: "
    len2 equ $ - msg2

    msg3 db "Result: "
    len3 equ $ - msg3

    newline db 10

section .bss
    num1 resb 2       ; digit + newline
    num2 resb 2
    result resb 1

section .text
global _start

_start:
    ; ===== print msg1 =====
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; ===== read num1 =====
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; ===== print msg2 =====
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; ===== read num2 =====
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; ===== ASCII -> int =====
    mov al, [num1]
    sub al, '0'
    mov bl, al

    mov al, [num2]
    sub al, '0'

    ; ===== add =====
    add al, bl

    ; ===== int -> ASCII =====
    add al, '0'
    mov [result], al

    ; ===== print result =====
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; ===== exit =====
    mov eax, 1
    xor ebx, ebx
    int 0x80
