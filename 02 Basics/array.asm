section .data
myArray db 10, 20, 30, 40, 50
arrayLen equ $ - myArray

section .bss
sum resb 1

section .text
global _start

_start:
    mov ecx, arrayLen    ; number of elements
    xor eax, eax         ; accumulator = 0
    xor ebx, ebx         ; index = 0

sum_loop:
    add al, [myArray + ebx]
    inc ebx
    loop sum_loop        ; ECX = ECX - 1, continue if ECX != 0

    mov [sum], al        ; store result