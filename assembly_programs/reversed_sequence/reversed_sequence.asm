; reversed_sequence.asm
; x86 32-bit Linux
; int* reverse_seq(int n, int* size)

global _start
global reverse_seq
extern malloc

section .data
n_value dd 5        ; n = 5
size    dd 0        ; int size (output)

section .text

; -------------------------------
; int* reverse_seq(int n, int* size)
; -------------------------------
reverse_seq:
    push ebp
    mov  ebp, esp

    mov eax, [ebp+8]        ; eax = n
    test eax, eax
    jle .return_null

    ; *size = n
    mov ecx, [ebp+12]
    mov [ecx], eax

    ; bytes = n * 4
    shl eax, 2

    ; malloc(n * 4)
    push eax
    call malloc
    add esp, 4

    test eax, eax
    jz .return_null

    ; eax = array pointer
    mov edi, eax            ; edi = array base
    mov ecx, [ebp+8]        ; ecx = counter (n)

.fill_loop:
    mov [edi], ecx
    add edi, 4
    dec ecx
    jnz .fill_loop

    pop ebp
    ret

.return_null:
    mov ecx, [ebp+12]
    mov dword [ecx], 0
    xor eax, eax
    pop ebp
    ret

; -------------------------------
; program entry point
; -------------------------------
_start:
    ; push arguments (cdecl: right to left)
    push size               ; int* size
    push dword [n_value]    ; int n

    call reverse_seq
    add esp, 8

    ; eax = pointer to array (or NULL)
    ; size = number of elements

    ; exit(0)
    mov eax, 1              ; sys_exit
    xor ebx, ebx
    int 0x80
