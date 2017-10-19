  extern fclose
  extern fopen
  extern fread
  extern fscanf
  extern printf
  
  section .rodata
      var1 : db "Cannot open file! Exiting!", 10, 0
      var2 : db "r", 0
      var3 : db "%s", 0
      var4 : db "Usage: %s FILENAME", 10, 0
  
  section .bss
      var5 : resb 100 + 1
      var6 : resq 1
      var7 : resq 1
  
  section .text
      global main
 
      main:
          push rbp
          mov rbp, rsp
  
          mov r10, rdi
          mov r11, rsi
  
          cmp r10, 3
          jne .exit
  
          mov rax, [r11 + 8]        
          mov QWORD [var6],rax
          mov rsi, var2
          mov rdi, QWORD [var6]
          call fopen
          test rax, rax           
          jz .label2
  	  jne .label3
         
	.label3 :
		mov rsi,var5
		mov rdi,var3
		call fascanf

	.label2:
		
              mov rdi, var1
              call printf
              mov rax, 1
              jmp .exit

 
	.exit:
		leave
		ret
