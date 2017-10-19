BITS 64

extern printf

section .text
	global main

	main:
		push rbp
		mov rbp,rsp
		cmp rdi,2
		jne .exit
		mov rdi, [rsi+8]
		call printf

	.exit:
		mov rax,0
		leave
		ret
		
		
		
