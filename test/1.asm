BITS 64

extern printf

section .rodata
	msg: db "Hello, world!", 10, 0
	

section .text
	global main

	main:
	    push rbp
	    mov rsp, rbp

            mov rdi, msg
	    call printf
		
	    mov rax, 0
            mov rsp, rbp
	    pop rbp
	    ret
