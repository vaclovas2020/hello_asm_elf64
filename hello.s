global main
global getinput
global printhello
global printmessage

section .text

printmessage:
  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, msg2     ; "Enter number:\n",
  mov rdx, msg2len  ; sizeof("Enter number:\n")
  syscall           ; );
  ret               ; end printmessage

printhello:
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msg      ;   "Hello, world!\n",
  mov rdx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );
  ret               ; end printhello

getinput:
  mov rax, 0        ; read(
  mov rdi, 2        ; STDIN_FILENO,
  mov rsi, num      ; num,
  mov rdx, 9        ; numlen
  syscall           ; );

  mov rax, 1         ; write(
  mov rdi, 1         ; STDOUT_FILENO,
  mov rsi, resmsg    ; resmsg,
  mov rdx, resmsglen ; resmsglen
  syscall            ; );

  mov rax, 1             ; write(
  mov rdi, 1             ; STDOUT_FILENO,
  mov rsi, num           ; num,
  mov rdx, 9             ; sizeof(num)
  syscall                ; );

  mov rax, 1        ; write(
  mov rdi, 1        ; STDOUT_FILENO,
  mov rsi, 10       ; "\n",
  mov rdx, 1        ; sizeof("\n")
  syscall           ; );
  ret               ; end getinput

exitprogram:
  mov rax, 60       ; exit(
  mov rdi, 0        ;   EXIT_SUCCESS
  syscall           ; );
  ret               ; end exitprogram

main:
  call printhello   ; print "Hello World\n"
  
  call printmessage ; print "Enter number or word (8 symbols max):\n"

  call getinput     ; get user input (8 bytes long + 1 reserved byte for zero-bit)

  call exitprogram ; exit program

section .data ; defined variables
  msg: db "Hello, world!", 10
  msglen: equ $ - msg
  msg2: db "Enter number or word (8 symbols max):", 10
  msg2len: equ $ - msg2
  resmsg: db "You entered: "
  resmsglen: equ $ - resmsg

section .bss
  num resb 9 ; unintialized variable for user input (9 bytes)