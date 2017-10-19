BITS 64
extern printf
extern getenv
extern environ

section .rodata
    var1 : db "%s",10,0
    var2: db "Not found",10,0

section .bss
   val : resq 1

section .text
    global main

    main:
        push rbp
        mov rbp,rsp
	sub rsp,0x40
	;sub rsp,24
        mov r10, rdi
        mov r11, rsi

	cmp r10, 2
	jne .label1

	mov rax, QWORD[r11+8]
	mov rdi,rax
	call getenv
	cmp rax,0
	je .label5 
	mov rsi,rax
	mov rdi,var1
	call printf
	jmp .label3
	.label1:
	     mov QWORD[rbp-8],0
	     mov rdx, QWORD[environ]
	     mov QWORD [val],rdx
		.label4:
			mov rdx,QWORD [val]
			mov rbx,QWORD[rbp-8]
			mov rcx, QWORD[rdx+rbx*8]
			cmp rcx,0
			je .label3
			mov rsi, rcx
			mov rdi, var1
			call printf
			inc QWORD[rbp-8]
	
		        jmp .label4
       .label5: 
		mov rdi,var2
		call printf
		
       .label3:
	     xor rax,rax
	     leave
	     ret
