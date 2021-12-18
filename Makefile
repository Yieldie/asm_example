.PHONY = all clean cleanall

targets = bth

all: $(targets)

bth: bintohex.asm
	nasm -f elf -o $@.o $< && ld -m elf_i386 $@.o -o $@
	
clean:
	rm -f *.o
	
cleanall: clean
	rm -f $(targets)

