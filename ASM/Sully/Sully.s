
; Creation d'un fichier contenant bonjour

%define SYS_OPEN 2
%define SYS_WRITE 1
%define SYS_CLOSE 3
%define SYS_EXIT 60

section .bss
counter: resq 1

section .data
    filename db "Grace_kid.s", 0

    message db "; Creation d'un fichier contenant bonjour%1$c%1$c%%define SYS_OPEN 2%1$c%%define SYS_WRITE 1%1$c%%define SYS_CLOSE 3%1$c%%define SYS_EXIT 60%1$c%1$csection .data%1$c    filename db %2$cGrace_kid.s%2$c, 0%1$c    message db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cglobal main%1$cextern dprintf%1$c%1$cmain:%1$c    push rbx%1$c%1$c    ; Creer et ouvrir le fichier%1$c    mov rax, SYS_OPEN%1$c    lea rdi, [rel filename]%1$c    mov rsi, 0x241%1$c    mov rdx, 0644o%1$c    syscall%1$c    mov rbx, rax%1$c%1$c    ; Ecrire le code dans le fichier%1$c    mov rdi, rbx%1$c    lea rsi, [rel message]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [rel message]%1$c    xor eax, eax%1$c    call dprintf%1$c%1$c    ; Fermer le fichier%1$c    mov rax, SYS_CLOSE%1$c    mov rdi, rbx%1$c    syscall%1$c%1$c    ; Terminer le programme%1$c    mov rax, SYS_EXIT%1$c    xor rdi, rdi%1$c    syscall%1$c", 0

section .text
global main
extern dprintf
extern access

main:
    push rbx
    mov  rdi, 5
    mov  [rel counter], rdi
    ; Creer et ouvrir le fichier
    mov rax, SYS_OPEN
    mov     rdi, [rel counter]
    dec     rdi
    mov     [rel counter], rdi

    lea rdi, [rel filename]
    mov rsi, 0x241
    mov rdx, 0644o
    syscall
    mov rbx, rax

    ; Ecrire le code dans le fichier
    mov rdi, rbx
    lea rsi, [rel message]
    mov edx, 10
    mov ecx, 34
    lea r8, [rel message]
    xor eax, eax
    call dprintf

    ; Fermer le fichier
    mov rax, SYS_CLOSE
    mov rdi, rbx
    syscall

    ; Terminer le programme*
    mov r12, [rel counter]
    cmp r12, 0
    jle exit
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
