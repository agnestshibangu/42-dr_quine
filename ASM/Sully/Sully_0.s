%define SYS_OPEN 2
%define SYS_WRITE 1
%define SYS_CLOSE 3
%define SYS_EXIT 60

section .data
    filename_fmt db "Sully_%d.s", 0
    cmd_fmt db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0
    message db "%%define SYS_OPEN 2%1$c%%define SYS_WRITE 1%1$c%%define SYS_CLOSE 3%1$c%%define SYS_EXIT 60%1$c%1$csection .data%1$c    filename_fmt db %2$cSully_%%d.s%2$c, 0%1$c    cmd_fmt db %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc -no-pie Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%2$c, 0%1$c    message db %2$c%3$s%2$c, 0%1$c%1$csection .bss%1$c    filename_buf resb 64%1$c    cmd_buf resb 256%1$c%1$csection .text%1$cglobal main%1$cextern dprintf%1$cextern sprintf%1$cextern system%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 32%1$c    %1$c    mov r12, %4$d%1$c    cmp r12, 0%1$c    jl exit%1$c    %1$c    mov rbx, r12%1$c    dec rbx%1$c    cmp rbx, 0%1$c    jl exit%1$c    %1$c    lea rdi, [rel filename_buf]%1$c    lea rsi, [rel filename_fmt]%1$c    mov rdx, rbx%1$c    xor eax, eax%1$c    call sprintf%1$c    %1$c    mov rax, SYS_OPEN%1$c    lea rdi, [rel filename_buf]%1$c    mov rsi, 0x241%1$c    mov rdx, 0644o%1$c    syscall%1$c    test rax, rax%1$c    js exit%1$c    mov r13, rax%1$c    %1$c    mov rdi, r13%1$c    lea rsi, [rel message]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [rel message]%1$c    mov r9, rbx%1$c    xor eax, eax%1$c    call dprintf%1$c    %1$c    mov rax, SYS_CLOSE%1$c    mov rdi, r13%1$c    syscall%1$c    %1$c    lea rdi, [rel cmd_buf]%1$c    lea rsi, [rel cmd_fmt]%1$c    mov rdx, rbx%1$c    xor eax, eax%1$c    call sprintf%1$c    %1$c    lea rdi, [rel cmd_buf]%1$c    call system%1$c    %1$c    exit:%1$c    xor rax, rax%1$c    leave%1$c    ret%1$c", 0

section .bss
    filename_buf resb 64
    cmd_buf resb 256

section .text
global main
extern dprintf
extern sprintf
extern system

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    
    mov r12, 0
    cmp r12, 0
    jl exit
    
    mov rbx, r12
    dec rbx
    cmp rbx, 0
    jl exit
    
    lea rdi, [rel filename_buf]
    lea rsi, [rel filename_fmt]
    mov rdx, rbx
    xor eax, eax
    call sprintf
    
    mov rax, SYS_OPEN
    lea rdi, [rel filename_buf]
    mov rsi, 0x241
    mov rdx, 0644o
    syscall
    test rax, rax
    js exit
    mov r13, rax
    
    mov rdi, r13
    lea rsi, [rel message]
    mov edx, 10
    mov ecx, 34
    lea r8, [rel message]
    mov r9, rbx
    xor eax, eax
    call dprintf
    
    mov rax, SYS_CLOSE
    mov rdi, r13
    syscall
    
    lea rdi, [rel cmd_buf]
    lea rsi, [rel cmd_fmt]
    mov rdx, rbx
    xor eax, eax
    call sprintf
    
    lea rdi, [rel cmd_buf]
    call system
    
    exit:
    xor rax, rax
    leave
    ret
