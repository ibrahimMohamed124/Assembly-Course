global _start
global is_leap_year

section .data
    leap_msg db "Leap year", 10
    leap_len equ $ - leap_msg

    not_msg db "Not leap year", 10
    not_len equ $ - not_msg

section .text

; ---------------------------------
; int is_leap_year(int year)
; ---------------------------------
is_leap_year:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]    ; year

    ; if (year % 400 == 0)
    xor edx, edx
    mov ecx, 400
    div ecx
    cmp edx, 0
    je .leap

    ; else if (year % 100 == 0)
    mov eax, [ebp + 8]
    xor edx, edx
    mov ecx, 100
    div ecx
    cmp edx, 0
    je .not_leap

    ; else if (year % 4 == 0)
    mov eax, [ebp + 8]
    xor edx, edx
    mov ecx, 4
    div ecx
    cmp edx, 0
    je .leap

.not_leap:
    mov eax, 0
    pop ebp
    ret

.leap:
    mov eax, 1
    pop ebp
    ret

; ---------------------------------
; entry point
; ---------------------------------
_start:
    ; push year
    push dword 2024
    call is_leap_year
    add esp, 4

    cmp eax, 1
    jne print_not

print_leap:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, leap_msg
    mov edx, leap_len
    int 0x80
    jmp exit

print_not:
    mov eax, 4
    mov ebx, 1
    mov ecx, not_msg
    mov edx, not_len
    int 0x80

exit:
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80
