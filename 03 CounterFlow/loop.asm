section .data


section .text
global _start

_start:
    mov ecx, 0

loop_start:
    cmp ecx, 5
    jge end_loop

    inc ecx

end_loop:
    mov eax, 1
    xor ebx, ebx
    int 80h
