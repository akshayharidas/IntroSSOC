extern fclose
extern fopen
extern fread
extern memset
extern printf
extern atoi
extern fgetc

section .rodata
    var1 : db "Cannot open file! Exiting!", 10, 0
    var2 : db "r", 0
    var3 : db "%s", 0
    var4 : db "Usage: %s FILENAME", 10, 0
    var9 : db "%d", 0
    var11: db "%c", 0

section .bss
    var5 : resb 26 + 1
    var10 : resb 26 + 1
    var6 : resq 1
    var7 : resq 1
    var8 : resq 1
    key  : resq 1

section .text
    global main

    main:
        push rbp                         ;Creating stack Frame
        mov rbp, rsp

        mov r10, rdi                     ;Command line argument, number of argument
        mov r11, rsi                     ;Input string to r11

        cmp r10,3                       ;if r10 not equal to 2 then label1
        jg .label4

        mov rax, [r11 + 8]               ;value of the string
        mov QWORD [var6], rax            ;

        mov rax, [r11 + 16]
        mov QWORD [key], rax
        mov rdi, QWORD [key]
        call atoi
        mov QWORD[key],rax
        mov r10, QWORD [key]
        .rem:
            cmp r10, 26
            jg .label10
        mov QWORD [key], r10
        
        mov rsi, var2                    ;Passing arguments for fopen()
        mov rdi, QWORD [var6]
        call fopen
        test rax, rax
        jz .label2

        mov [var7], rax

        ;mov rdx, 26
        ;xor rsi, rsi
        ;mov rdi, var5
        ;call memset

        ;mov rcx, QWORD [var7]
        ;mov rdx, 26
        ;mov rsi, 1
        ;mov rdi, var5
        ;call fread    
        ;mov BYTE [var5 + 26], 0
        ;mov r12, var5 
        mov rdi, QWORD [var7]
        call fgetc
        mov r14, QWORD [key]
        mov r13,0x00
        .loop:
            ;mov al, BYTE [ r12]
            mov r15, rax
            sub r15, 65
            add r15, QWORD [key]
            .checkneg:
                cmp r15,0
                jl .label12
            .check:
                cmp r15, 26
                jge .label11
            add r15,65
            mov rdi, var11
            mov rsi, r15
            call  printf 
            mov rdi, QWORD [var7]
            call fgetc
            cmp rax,0xa
            je .newline
            cmp eax,0xffffffff
            jne .loop

        .newline:
        mov rdi, QWORD [var7]
        call fclose
        mov rax, 0
        jmp .label2

        .label1:
            mov rsi, r11
            mov rsi, QWORD [rsi]
            mov rdi, var4
            ;call printf
            mov rax, 1
            jmp .label4

        .label2:
            mov rax, 0
            jmp .label4      

        .label4:
            xor rax,rax
            leave
            ret

        .label10:
            sub r10, 26
            jmp .rem

        .label11:
            sub r15,26
            jmp .check

        .label12: 
            add r15,26
            jmp .checkneg

