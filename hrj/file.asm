extern fopen
extern fread
extern printf

section .rodata
	read : db "r",0
	print db "%s", 0

section .bss
	var5 : resb 100
	var1 : resq 1
 	fp : resq 1

section .text
	global main

	main:
		push rbp
		mov rbp , rsp

		cmp rdi , 2
		jne .exit

		mov rax, [rsi + 8]
		mov QWORD[var1] , rax

		mov rsi, read
		mov rdi, QWORD[var1]
		call fopen

		mov QWORD[fp], rax

		mov rcx, QWORD[fp]
		mov rdx, 100
		mov rsi, 1
		mov rdi, var5
		call fread
		mov BYTE[var5 + 100], 0

		mov rdi, print
		mov rsi, var5
		call printf

		.exit:
			xor rax, rax
			leave
			ret
