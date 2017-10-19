extern printf
extern getenv

section .rodata:
	var1: db "%s",10,0
	var2: db "not found",10,0


section .text
	global main
	
	main:
		push rbp
		mov rbp, rsp

		mov r10, rdi
		mov r11,rsi

		cmp rdi,2
		jne .label1

		mov rax,QWORD[r11+8]
		mov rdi, rax
		call getenv
		cmp rax, 0
		je .label2
		mov rsi, rax
		mov rdi, var1
		call printf
		jmp .label1
		.label2:
			mov rdi, var2
			call printf
		.label1:
			leave
			ret
