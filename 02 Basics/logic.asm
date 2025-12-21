; logic.asm
; x86_64 NASM - Linux
; Logical operations: AND, OR, XOR, NOT

section .data
    a        dq 0b1100     ; 12
    b        dq 0b1010     ; 10

    and_res  dq 0
    or_res   dq 0
    xor_res  dq 0
    not_res  dq 0

section .text
    global _start

_start:
    ; ---------- AND ----------
    mov rax, [a]
    and rax, [b]
    mov [and_res], rax

    ; ---------- OR ----------
    mov rax, [a]
    or rax, [b]
    mov [or_res], rax

    ; ---------- XOR ----------
    mov rax, [a]
    xor rax, [b]
    mov [xor_res], rax

    ; ---------- NOT ----------
    mov rax, [a]
    not rax
    mov [not_res], rax

    ; ---------- EXIT ----------
    mov rax, 60     ; syscall: exit
    xor rdi, rdi    ; status = 0
    syscall
