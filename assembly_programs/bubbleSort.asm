global _main

section .data
    array: dd 3,5,2,5,3,4
    len equ 6

section .text

_main:
    mov ecx, len
    dec ecx

outer_loop:
    mov esi, 0 ; array pointer
    mov edx, ecx ; tells loop where to stop

inner_loop:       
    mov eax, [array + esi*4] ; array[i]
    mov ebx, [array + esi*4 + 4] ;array[i + 1]
    cmp eax, ebx
    jle no_swap ; array[i] <= array[i + 1]

    ; SWAP
    mov [array + esi*4], ebx
    mov [array + esi*4 + 4], eax

no_swap:
    inc esi
    dec edx
    jnz inner_loop

    dec ecx
    jnz outer_loop

    mov eax, 60
    xor edi, edi
    syscall

    
