section .data
    dstr db "hello, world", 0
    lendstr equ $ - dstr

section .text
global _start

_start:
    mov esi, dstr

startloop:
    mov al,[esi]
    cmp al, 0
    je print_done

    cmp al, 'a'
    jb skip
    cmp al, 'z'
    ja skip
    
    sub al, 32
    mov [esi], al

skip:
    inc esi 
    jmp startloop

print_done:
    ; print result
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, dstr     ; pointer for string
    mov edx, lendstr  ; length
    int 80h

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 80h
