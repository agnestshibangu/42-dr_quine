;colleen
global main
extern printf

section .text

main:
    push rbx

    lea rsi, [rel format]
    mov rdi, rsi
    mov edx, 0x0A
    mov ecx, 0x22
    mov eax, 0

    call printf

    pop rbx
    ret

format:
    db ";colleen%2$cglobal main%2$cextern printf%2$c%2$csection .text%2$c%2$cmain:%2$c    push rbx%2$c%2$c    lea rsi, [rel format]%2$c    mov rdi, rsi%2$c    mov edx, 0x0A%2$c    mov ecx, 0x22%2$c    mov eax, 0%2$c%2$c    call printf%2$c%2$c    pop rbx%2$c    ret%2$c%2$cformat:%2$c    db %3$c%1$s%3$c, 0%2$c", 0