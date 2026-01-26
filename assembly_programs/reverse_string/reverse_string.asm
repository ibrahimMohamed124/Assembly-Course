section .data
    dstr db "this is string", 0   ; string to reverse
    lendstr equ $ - dstr               ; length of string

section .text
global _start
global reverse

; ----------------------
; void reverse(char* str)
; ----------------------
reverse:
    push ebp
    mov ebp, esp
    mov esi, [ebp + 8]    ; char* str = [ebp+8]
    mov edi, esi           ; char* end = str

; find end of string
find_end:
    mov al, [edi]          ; al = *end
    cmp al, 0              ; while(*end != '\0')
    je got_end
    inc edi                ; end++
    jmp find_end

got_end:
    dec edi                ; end-- (last character)

; reverse loop
reverse_loop:
    cmp esi, edi           ; while(start < end)
    jge done
    mov al, [esi]          ; tmp = *start
    mov bl, [edi]          ; bl = *end
    mov [esi], bl          ; *start = *end
    mov [edi], al          ; *end = tmp
    inc esi                ; start++
    dec edi                ; end--
    jmp reverse_loop

done:
    pop ebp
    ret                     ; return

; ----------------------
; program entry
; ----------------------
_start:
    ; call reverse(dstr);
    push dstr               ; push argument
    call reverse
    add esp, 4              ; clean stack (cdecl)

    ; print reversed string using sys_write
    mov eax, 4              ; eax = 4 (sys_write)
    mov ebx, 1              ; ebx = 1 (stdout)
    mov ecx, dstr           ; ecx = pointer to string
    mov edx, lendstr        ; edx = string length
    int 0x80                ; syscall

    ; print newline
    mov eax, 4              ; eax = 4 (sys_write)
    mov ebx, 1              ; stdout
    mov ecx, nl             ; pointer to newline
    mov edx, 1              ; length = 1
    int 0x80

    ; exit(0)
    mov eax, 1              ; eax = 1 (sys_exit)
    xor ebx, ebx            ; ebx = 0
    int 0x80

section .data
nl db 10                    ; newline character (\n)
