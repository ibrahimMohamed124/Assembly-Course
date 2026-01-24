section .data
    dstr db "hello, world", 0        ; The string
    msg db "The length of ", 0       ; First part of message
    msg_is db " is ", 0              ; Middle part of message
    newline db 10, 0                 ; Newline

section .bss
    numbuf resb 10                   ; Buffer for number string

section .text
global _start

;---------------------------------------
; strlength: calculate string length
; Input: ESI = pointer to string
; Output: EAX = length
strlength:
    xor ecx, ecx                      ; counter
len_loop:
    cmp byte [esi], 0                 ; null terminator?
    je len_done
    inc esi
    inc ecx
    jmp len_loop
len_done:
    mov eax, ecx
    ret

;---------------------------------------
; num_to_str: convert EAX number -> string
; Output: EAX = pointer to start of number string
num_to_str:
    mov edi, numbuf
    add edi, 9                         ; start from end
    mov byte [edi], 0                  ; null terminate
    mov ebx, 10                        

convert_loop:
    xor edx, edx
    div ebx                             ; EAX / 10
    add dl, '0'                         ; convert remainder to ASCII
    dec edi
    mov [edi], dl
    cmp eax, 0
    jne convert_loop
    mov eax, edi                        ; pointer to start of number string
    ret

;---------------------------------------
_start:
    ; --- Calculate the string length first ---
    mov esi, dstr
    call strlength
    push eax                           ; Save the length on stack

    ; --- print "The length of " ---
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 14                        ; length of message
    int 80h

    ; --- print the string ---
    mov ecx, dstr
    pop edx                            ; Get the length from stack
    push edx                           ; Save it again for later use
    mov eax, 4
    mov ebx, 1
    int 80h

    ; --- print " is " ---
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_is
    mov edx, 4
    int 80h

    ; --- print the number dynamically ---
    pop eax                            ; Get the length from stack
    call num_to_str                    ; convert number to string
    
    ; Calculate the length of the number string
    mov edx, numbuf + 9
    sub edx, eax                       ; edx = length of number string
    mov ecx, eax                       ; pointer to number string
    mov eax, 4
    mov ebx, 1
    int 80h

    ; --- print newline ---
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h
    
    ; --- exit program ---
    mov eax, 1
    xor ebx, ebx
    int 80h