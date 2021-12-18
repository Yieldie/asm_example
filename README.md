# asm_example
Example program written by me in assembly language

File bintohex.asm is a simple program written in assembly (NASM syntax), reading a single 8-digit (for simplicity) binary number from standard input, converting it into a hexadecimal number and printing the result on standard output. For assembly you obviously need a NASM assembler installed (Arch Linux: ```sudo pacman -S nasm```). This code was originally written for the 32-bit architecture and contains some 32-bit-specific instructions, so it has to be assembled and linked as a 32-bit executable, therefore additional packages might be needed. Compilation: ```make```. Use: ```./bth``` and enter a binary number.
