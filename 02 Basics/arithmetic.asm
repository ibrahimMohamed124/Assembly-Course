; arithmetic.asm
; x86_64 NASM - Linux
; Simple arithmetic operations example

section .data
    a       dq 10        ; first number
    b       dq 3         ; second number

    add_res dq 0
    sub_res dq 0
    mul_res dq 0
    div_res dq 0

section .text
    global _start

_start:
    ; ---------- ADD ----------
    mov rax, [a]
    add rax, [b]
    mov [add_res], rax

    ; ---------- SUB ----------
    mov rax, [a]
    sub rax, [b]
    mov [sub_res], rax

    ; ---------- MUL ----------
    mov rax, [a]
    imul rax, [b]
    mov [mul_res], rax

    ; ---------- DIV ----------
    mov rax, [a]
    xor rdx, rdx        ; clear high bits before division
    mov rcx, [b]
    div rcx             ; rax / rcx
    mov [div_res], rax  ; quotient

    ; ---------- EXIT ----------
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status = 0
    syscall
