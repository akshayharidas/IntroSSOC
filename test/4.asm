BITS 64

extern printf
extern atoi

section .rodata
	out: db"%d",10,0
section .text
	global main

	main:
		push rbp
		mov rbp,rsp

		cmp rdi,3
		jne .exit

		mov rbx, rsi
		mov rdi, [rbx+8]
		call atoi
		mov r12,rax

		mov rdi, [rbx+16]
		call atoi
		add r12, rax
		
		mov rsi, r12
		mov rdi , out
		call printf

		xor rax,rax
	.exit:	leave
		ret
		
