section .data
    msg db "Hello, World", 10   ; Define a string "Hello, World" followed by a newline (ASCII 10)

section .text
global _start                   ; Declare the entry point of the program

_start:
    mov edx, 13                 ; Length of the string (13 characters including newline)
    mov ecx, msg                ; Pointer to the string in memory
    mov ebx, 1                  ; File descriptor 1 = stdout (standard output)
    mov eax, 4                  ; System call number 4 = sys_write (write to file/console)
    int 80h                     ; Trigger the system call

    mov eax, 1                  ; System call number 1 = sys_exit (exit the program)
    mov ebx, 0                  ; Exit code 0 (success)
    int 80h                     ; Trigger the system call to terminate the program
    