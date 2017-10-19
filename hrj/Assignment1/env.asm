BITS 64

extern getenv
extern printf

section .rodata
    var1 : db "%s", 10,0
    var4 : db "Not found",0    

section .data
    var2: dq  1

section .bss
    var6: resq 1

section .text
    global main

    main:
        push rbp                    ;Creating Stack frame
        mov rbp, rsp
        
        mov r10, rdi                ;Command Line Argument
        mov r11, rsi            
        mov r12, rdx
        
        cmp r10,2
        je .label2
        cmp r10,1
        jne .label3      

        .label1:
            mov rsi, [r12]
            mov rdi, var1           
            cmp QWORD rsi,0x00
            je .label3
            add r12,8
            call printf
            jmp .label1      
        
        .label2:
            mov rax, [r11 + 8]
            mov QWORD [var6], rax
            mov rdi, QWORD [var6]
            call getenv
            mov rdi, rax
            cmp QWORD rax, 0x00
            je .label4
            call printf      

       .label3:
            mov rax,0 
            xor rax, rax
            leave
            ret  

        
      .label4:
            mov rdi, var1
            mov rsi, var4
            call printf
            jmp .label3
