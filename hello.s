global main

section .text

main:
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msg      ;   "Hello, world!\n",
  mov rdx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );
  
  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, msg2     ; "Enter number:\n",
  mov rdx, msg2len  ; sizeof("Enter number:\n")
  syscall           ; );

  mov rax, 0        ; read(
  mov rdi, 2        ; STDIN_FILENO,
  mov rsi, num      ; num,
  mov rdx, numlen   ; numlen
  syscall           ; );

  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, resmsg   ; resmsg,
  mov rdx, resmsglen; resmsglen
  syscall           ; );

  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, num      ; num,
  mov rdx, numlen   ; numlen
  syscall           ; );
  
  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, 10       ; "\n",
  mov rdx, 1        ; sizeof("\n")
  syscall           ; );

  mov rax, 60       ; exit(
  mov rdi, 0        ;   EXIT_SUCCESS
  syscall           ; );

section .data
  msg: db "Hello, world!", 10
  msglen: equ $ - msg
  msg2: db "Enter number or word (8 symbols max):", 10
  msg2len: equ $ - msg2
  num: dq 0
  numlen: equ $ - num
  resmsg: db "You entered: "
  resmsglen: equ $ - resmsg
