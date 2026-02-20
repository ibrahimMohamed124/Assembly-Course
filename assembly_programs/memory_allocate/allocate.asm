section .data
    alloc_max equ 4096
    alloc_size equ 1234

section .text
global _start

_start:
    mov eax, 192 ; sys_mmap2
    xor ebx, ebx ; addr = NULL
    mov ecx, alloc_max ; length = 4096
    mov edx, 3 ; PROT_READ | PROT_WRITE
    mov esi, 0x22 ; MAP_PRIVATE | MAP_ANONYMOUS
    mov edi, -1 ; fd = -1
    xor ebp, ebp ; offset = 0
    int 0x80

    ; EAX contains the pointer of the allocated memory
    mov ebx, eax ; save memory


    ; use the funtion example
    mov dword [ebx], alloc_size

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
