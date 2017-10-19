;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Date      :   15/12/2016                                                     ;
; Program   :   print "Hello world" using printf                               ;
; Note      :   This program was tested on Ubuntu 14.04 64 bit using           ;
;               nasm 2.10.09 and gcc 4.8.4.                                    ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 64

extern printf                               ; declare that printf is defined elsewhere

section .rodata                             ; start of data section
    hello_world: db "Hello, world!", 10, 0  ; string we wish to print out
					    ; db -declear byte ;10-\n
section .text                               ; start of text section
    global main                             ; declare main as globally visible

    main:
        push rbp                            ; set up main's stack frame
        mov rbp, rsp                        ; on top of it's caller's frame ; mov destination, source
					    ; seck setuping
        mov rdi, hello_world                ; set only argument to printf
        call printf                         ; and invoke it. ;printing 

        mov rax, 0                          ; set return value
        mov rsp, rbp                        ; destroy main's stack frame and
        pop rbp                             ; restore main's caller's stack frame
        ret                                 ; return to main's caller ; return 0
