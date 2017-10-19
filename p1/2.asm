BITS 64

%define STDOUT 1
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
    msg:    db "Hello World", 10, 0     
    len:    equ $-msg 
    var1:   db "Hello ",0
                      
    len2:   equ $-var1
section .text
    global _start                       

    _start:
	
	mov rax, QWORD [rsp]            
        cmp rax, 0x2
	je .print
	mov rax, SYS_WRITE              
	mov rdi, STDOUT                 
 	mov rsi,msg                     
        mov rdx, len                   
        syscall
	jmp .exit
	.print:
		mov rax, SYS_WRITE              
		mov rdi, STDOUT                 
 		mov rsi,var1                     
 	        mov rdx, len2                   
 	        syscall
		
		
		mov rdi,qword[rsp+16]
		call strlen
		mov rdx,rax

		mov rax, SYS_WRITE              
	        mov rdi, STDOUT                
 	        mov rsi, qword[rsp+16]                           
        	syscall                         
		jmp .exit
.exit:	
        mov rax, SYS_EXIT               
        xor rdi, rdi                    
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


