BITS 64

extern printf
extern scanf
extern atoi

section .data
    temp: db 0

section .rodata
    var4: db "-1", 10,0
    var6: db "%ld", 10, 0

section .bss
    var1: resq 1
    var2: resq 1
    var3: resq 1
    var7: resq 1
    var5: resq 1
    var8: resq 1
    var9: resq 1
    var10: resq 1

section .text
    global main

    main:
        mov QWORD [var1],0x00
        mov QWORD [var2],0x01
        mov QWORD [var3],0x02
        mov QWORD [var5],0x01
        mov QWORD [var7],0x01
        mov QWORD [var10],0x0

        push rbp
        mov rbp,rsp

        mov r10, rdi
        mov r11, rsi

        cmp r10,2
        jl .label3

        mov QWORD [var8], r10
        mov QWORD [var9], r11
        .label1:
              mov QWORD [var10], 0x0
              mov r14, QWORD [var9]
              mov rax, QWORD [var8]
              cmp QWORD [var7], rax
              je .label3
              mov QWORD [var5],0x1
              mov rax, QWORD [var7]
              add rax,0x1
              .label7:
                cmp QWORD[var5], rax
                je  .label8
                add QWORD[var10], 0x8
                inc QWORD [var5]
                jmp .label7


            .label8:
              add r14, QWORD [var10]
              mov r14, [r14]
              mov rdi, r14
              call atoi
              mov r12, rax
              cmp r12,0x1
              je .label4
              cmp r12,0x2
              je .label4
              mov QWORD [var3],0x2
              .label2:
                  cmp r12,0x1
                  jl .label5
                  cmp QWORD [var3],r12
                  je .label6
                  mov rcx, QWORD [var2]
                  ;mov rcx, var1
                  add  rcx, QWORD [var1]
                  mov  rax, QWORD[var2]
                  mov QWORD [var1], rax

                  mov QWORD [var2], rcx
                  inc QWORD [var3]
                  jmp .label2

        .label3:
            mov rax,0
            leave
            ret

        .label4:
            mov rdi, var6
            sub rax,1
            mov rsi, rax
            call printf
            inc QWORD [var7]
            jmp .label1
       

        .label5:
            mov rdi, var4
            call printf
            inc QWORD [var7]
            jmp .label1

        .label6:
            mov rdi, var6
            mov rsi, QWORD [var2]
            call printf
            mov QWORD[var2], 0x1
            mov QWORD[var1], 0X0
            inc QWORD [var7]
            jmp .label1
