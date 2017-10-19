BITS 64

%define BUF_SIZE 20
%define ELEM_SIZE 1
%define O_RDONLY 0

; Macros for file descriptors
%define STDIN 0
%define STDOUT 1
%define STDERR 2

; Macros for syscalls
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_OPEN 2
%define SYS_CLOSE 3
%define SYS_EXIT 60

section .rodata
    open_error : db "Cannot open file! Exiting!", 10, 0
    open_error_len : equ $ - open_error
    usage : db "Please specify a FILENAME as argument", 10, 0
    usage_len : equ $ - usage

section .bss
    buffer : resb BUF_SIZE
    fh: resq 1
    filename: resq 1

section .text
    global _start

    _start:
        mov rax, QWORD [rsp]            ; argument count check
        cmp rax, 0x2
        jne .nofilename

        mov rax, QWORD [rsp + 16]       ; retrieve address of filename from stack
        mov [filename], rax
	
	;open(filenaem,0,0)

        mov rax, SYS_OPEN               ; open file in read only mode
        mov rdi, [filename]
        xor rsi, rsi
        mov rdx, O_RDONLY
        syscall
        cmp rax, 0                      ; test if read failed
        jl .openfailed
        mov [fh], rax

	; read(filedescriptor= fh,*buff,size=20) ; read from fiedec fh with size 20and stored in buffer
        mov rax, SYS_READ               ; read BUF_SIZE bytes from file into buffer
        mov rdi, [fh]
        mov rsi, buffer
        mov rdx, BUF_SIZE
        syscall

	mov r13, buffer
	call strlen
	mov r12,rax
	cmp rsp, 3
	jne .final
	mov r15,[rsp+24]
	call strlen
	mov r14, rax
	mov r10,r14
	mov rdx, 0
     .repeat:
	mov rax,r10
	jmp .loop 
     .loop: 
	  
	  ;cmp r14, r12   
	  ;je .final
	  ;jl .repeat
	  mov al, BYTE[r13+rax]
	  xor BYTE [r15+rdx],al
	  inc rax
	  inc rdx
	  dec r13
	  dec r15
	  cmp r12, 0
	  je .print
	  cmp r14,0
	  je .repeat
	  jne .loop

        xor rdi, rdi                    ; exit(0)
        jmp .final
     .print:
 	      mov rax, SYS_WRITE
              mov rdi, STDOUT
              mov rsi, r15
              mov rdx, r12
              syscall

        .openfailed: 
	;write(stderr,open_error,len)                   ; display file open failed error message
            mov rax, SYS_WRITE
            mov rdi, STDERR
            mov rsi, open_error
            mov rdx, open_error_len
            syscall
            mov rdi, 1 ; set the arg to the exit system call
            jmp .final

        .nofilename:   
	;write(seterr,usage,len)                 ; display usage message
            mov rax, SYS_WRITE
            mov rdi, STDERR
            mov rsi, usage
            mov rdx, usage_len
            syscall
            mov rdi, 1                  ; exit(1)
            jmp .final


	 .final:                         ; exit syscall
            mov rax, SYS_EXIT


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

