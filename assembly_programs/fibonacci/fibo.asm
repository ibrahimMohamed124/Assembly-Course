section .text
global _start

fibonacci:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]   ; eax = n
    cmp eax, 1
    jle base_case      ; if n <= 1 return n

    ; fib(n-1)
    push eax
    dec dword [esp]
    call fibonacci
    add esp, 4
    mov ebx, eax        ; save fib(n-1)

    ; fib(n-2)
    mov eax, [ebp + 8]
    sub eax, 2
    push eax
    call fibonacci
    add esp, 4

    add eax, ebx        ; fib(n-1) + fib(n-2)
    jmp done

base_case:
    ; eax already = n

done:
    pop ebp
    ret
