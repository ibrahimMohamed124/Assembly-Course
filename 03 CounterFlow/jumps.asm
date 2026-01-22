section .text
global _start

_start:
    mov eax, 5
    mov ebx, 5

    ; ===== JE (Jump if Equal) =====
    cmp eax, ebx        ; 5 - 5 = 0 → ZF = 1
    je equal

    mov ecx, 0          ; لن يُنفذ
    jmp next

equal:
    mov ecx, 1          ; سيتم التنفيذ

next:
    ; ===== JNE (Jump if Not Equal) =====
    mov eax, 3
    mov ebx, 7

    cmp eax, ebx        ; 3 - 7 = -4 → ZF = 0
    jne not_equal

    mov edx, 0          ; لن يُنفذ
    jmp end

not_equal:
    mov edx, 1          ; سيتم التنفيذ

end:
    mov eax, 1
    int 0x80
