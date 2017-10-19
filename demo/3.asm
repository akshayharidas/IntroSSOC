BITS 64

extern printf
extern scanf

section .data                         ; section is the specific unit 
    var1 :    dq 1		      ; dq declraed as qword so 8 byte var1 = 1

section .rodata
    var2 :    db "%d", 10, 0	      ; decleare byte -db  ; var2 pointing to data type

section .text
    global main			      ;global

    main:
        push rbp                      ;Create stack frame ; stack contruct before main
        mov rbp, rsp		      ;rbp - rsp = size

        .label1:
            mov rsi, QWORD [var1]     ;call printf
            mov rdi, var2
            call printf

            inc QWORD [var1]          ;increment var1

            cmp QWORD [var1], 10      ;Compare the var1 and 10
            jg .label2                ;jump to label2 when var1 greater than 10 ; jg -> jump if greater
            jmp .label1               ;jump to label1
				      ;it prints 1 to 10
        .label2:                      
            xor rax, rax	      ; rax = 0 it means return value is zero
            leave		      ;destoying stack frame
            ret			      ;return 


