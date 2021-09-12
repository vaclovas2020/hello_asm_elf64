# hello_asm_elf64
Simple elf64 assembly. Print two lines: "Hello world!\n " and  "Enter numer or word (8 symbols max):\n". 
Than read user input and print to screen. Finally exit. 
I use linux x64 syscalls.
For learning assembly purposes only.
You need ``gcc`` and ``nasm`` compilers.
Command:
``sh
nasm -o hello.o -f elf64 hello.s && gcc -o hello hello.o
`` 
