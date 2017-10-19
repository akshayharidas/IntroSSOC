BITS 64

extern printf
extern scanf

section .rodata
	input:db "%d",0
	out: db"sum is %d",10,0
	msg:db"Enter number:",10,0
section .bss 
	n1:resq 1
	n2:resq 1
section .text
	global main
	main:
		push rbp
		mov rbp, rsp

		mov rdi, msg
		call printf
		
		mov rsi,n1
		mov rdi,input
		call scanf

		mov rdi, msg
		call printf

		mov rsi, n2
		mov rdi, input
		call scanf

		mov rsi, QWORD[n1]
		add rsi, QWORD[n2]
		mov rdi, out
		call printf
	
		mov rax,0
		mov rsp,rbp
		pop rbp
		ret
