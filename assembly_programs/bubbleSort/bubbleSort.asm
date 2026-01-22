global _start

section .bss
    input   resb 100
    array   resd 20        ; max 20 numbers
    len     resd 1

section .text

; =========================
; bubble_sort(int* arr, int n)
; arr -> esi
; n   -> ecx
; =========================
bubble_sort:
    push ebp
    mov ebp, esp

    dec ecx                ; n-1
outer_loop:
    mov edi, 0             ; index
    mov edx, ecx

inner_loop:
    mov eax, [esi + edi*4]
    mov ebx, [esi + edi*4 + 4]
    cmp eax, ebx
    jle no_swap

    mov [esi + edi*4], ebx
    mov [esi + edi*4 + 4], eax

no_swap:
    inc edi
    dec edx
    jnz inner_loop

    dec ecx
    jnz outer_loop

    pop ebp
    ret

; =========================
; _start
; =========================
_start:

    ; read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, input
    mov edx, 100
    int 0x80

    ; parse input -> array
    mov esi, input
    mov edi, array
    xor ecx, ecx        ; length
    xor eax, eax

parse_loop:
    mov bl, [esi]
    cmp bl, 10          ; newline
    je done_parse

    cmp bl, ' '
    je store_number

    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc esi
    jmp parse_loop

store_number:
    mov [edi], eax
    add edi, 4
    inc ecx
    xor eax, eax
    inc esi
    jmp parse_loop

done_parse:
    mov [edi], eax
    inc ecx
    mov [len], ecx

    ; call bubble_sort
    mov esi, array
    mov ecx, [len]
    call bubble_sort

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
