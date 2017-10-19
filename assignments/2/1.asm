BITS 64

%define STDOUT 1
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
	msg: db 10,0	
section .text
	global _start

	_start:
		mov r15, rsp
		mov r14, 16
		;mov r12, rax

	.loop:	
		mov rdi,[r15+8*r14] 
		call strlen
		mov r13, rax
		mov rax,SYS_WRITE
		mov rdi, STDOUT
		mov rsi ,QWORD[r15 + r14*8]
		mov rdx, r13
		syscall

		
		mov rax, SYS_WRITE         
	        mov rdi, STDOUT            
                mov rsi, msg               
                mov rdx, 1               
                syscall        

		inc r14
		cmp QWORD[r15 +8*r14],0
		je .exit
		jmp .loop
		
	
	 .exit:                         
              xor rdi, rdi
              mov rax, SYS_EXIT
              syscall

 	strlen:
         	 push rbp
         	 mov rbp, rsp

         	 xor rax, rax                    
          	xor rcx, rcx                    
          	dec rcx                        
	       	cld                            
          	repne scasb                   
                                         
          	mov rax, rcx                  
          	not rax
          	dec rax
  
	        leave
        	ret

