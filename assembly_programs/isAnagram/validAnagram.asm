section .data
    str1 db "abc", 0
    str2 db "cba", 0

    msg_yes db "Anagram", 10
    len_yes equ $ - msg_yes

    msg_no db "Not anagram", 10
    len_no equ $ - msg_no

section .text
    global _start

; ------------------------------------
; int isAnagram(char* str1, char* str2)
; ------------------------------------
isAnagram:
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]     ; str1
    mov edi, [ebp + 12]    ; str2

    xor eax, eax           ; sum1 = 0
    xor ebx, ebx           ; sum2 = 0

.loop:
    movzx ecx, byte [esi]  ; ecx = str1[i]
    cmp ecx, 0
    je .done

    add eax, ecx           ; sum1 += str1[i]

    movzx ecx, byte [edi]  ; ecx = str2[i]
    add ebx, ecx           ; sum2 += str2[i]

    inc esi
    inc edi
    jmp .loop

.done:
    cmp eax, ebx
    sete al
    movzx eax, al

    pop ebp
    ret

; ------------------------------------
; _start (main)
; ------------------------------------
_start:
    push str2
    push str1
    call isAnagram
    add esp, 8

    cmp eax, 1
    jne .print_no

.print_yes:
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, msg_yes
    mov edx, len_yes
    int 0x80
    jmp .exit

.print_no:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_no
    mov edx, len_no
    int 0x80

.exit:
    mov eax, 1            ; sys_exit
    xor ebx, ebx
    int 0x80
