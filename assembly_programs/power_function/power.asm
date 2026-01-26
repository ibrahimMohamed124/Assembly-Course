section .data
    msg     db "Result: ", 0
    msg_len equ $ - msg
    nl      db 10

section .bss
    buffer resb 12     ; enough for int

section .text
global _start

; -----------------------
; int power(int a, int b)
; -----------------------
power:
    push ebp
    mov  ebp, esp

    mov eax, 1
    mov ebx, [ebp+8]    ; base
    mov ecx, [ebp+12]   ; exponent

power_loop:
    cmp ecx, 0
    je  power_done
    imul eax, ebx
    dec ecx
    jmp power_loop

power_done:
    pop ebp
    ret

; -----------------------
; program entry
; -----------------------
_start:
    push 3
    push 2
    call power
    add esp, 8          ; eax = result

    ; print "Result: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; convert int -> string
    mov edi, buffer
    call int_to_str

    ; print number
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, eax        ; length returned in eax
    int 0x80

    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

; -----------------------
; int_to_str
; eax = number
; returns: eax = length
; -----------------------
int_to_str:
    mov ebx, 10
    xor ecx, ecx

.convert:
    xor edx, edx
    div ebx
    add dl, '0'
    push dx
    inc ecx
    test eax, eax
    jnz .convert

    mov eax, ecx
.write:
    pop dx
    mov [edi], dl
    inc edi
    loop .write
    ret
