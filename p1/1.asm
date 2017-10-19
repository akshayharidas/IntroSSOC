extern printf
extern scanf

section .rodata
	var1 : db "%d",10,0

section .text
	global main
	
	main:
	    push rbp
	    mov rbp,rsp
	    mov r10,rsi
	    mov r11,rdi
	    mov r14 ,0
	    mov r15, 1
	.label:
		cmp r11,3
		jl .exit
		
		
		add r14, 1
		add r15, 1
		mov r13, qword[r10+r14*8]
		mov r9, qword[r10+r15*8]
		cmp r13, r9 
		je .label1
		jl .label2
		jg .label3
	.label1:
		dec r11
		cmp r11,3
		jl .label4	
		inc r15
		cmp r13,qword[r10+r15*8]
		je .label1
		jl .label2
		jg .label3

	.label2:
		dec r11
		cmp r11,3
		jl .label4 
		add r14, 2
		cmp r9,qword[r10+r14*8]
		je .label1
		jl .label2
		jg .label3
	.label3:
		dec r11
		cmp r11,3
		jl .label5
		inc r15
		cmp r13,qword[r10+r15*8]
		je .label1
		jl .label2
		jg .label3
	.print:
		mov rdi,var1
		call printf
		jmp .exit
	.label4:
		mov rsi,r9
		jmp .print
	.label5:
		mov rsi,r13
		jmp .print
	.exit:
		xor rax, rax
		leave
		iret 
