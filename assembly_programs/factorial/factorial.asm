section .text
global _start

factorial:
    push ebp            ; Save the old base pointer
    mov ebp, esp        ; Set up a new base pointer for the stack frame
    mov eax, 1          ; Initialize result (eax) to 1
    mov ecx, [ebp + 8]  ; Load the input argument into ecx

fact_loop:
    cmp ecx, 0          ; Check if ecx <= 0
    jle fact_done       ; If so, jump to completion
    imul eax, ecx       ; Multiply eax by ecx (eax = eax * ecx)
    dec ecx             ; Decrement counter (ecx--)
    jmp fact_loop       ; Repeat the loop

fact_done:
    pop ebp             ; Restore the old base pointer
    ret                 ; Return to caller (result is in eax)

_start:
    ; Calculate Factorial of 5
    push 5              ; Push the argument onto the stack
    call factorial      ; Call the function; result will be in eax
    add esp, 4          ; Clean up the stack (remove the pushed 5)

    ; Exit Program
    mov ebx, eax        ; Move result to ebx (used as exit status)
    mov eax, 1          ; System call number for sys_exit (Linux x86)
    int 0x80            ; Invoke the kernel
