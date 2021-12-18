section .bss
	input:	resb 9

global _start

section .text

binhex:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	dword[ebp-4], 0	;outer loop's iterator
	mov	edx, input
	xor	ecx, ecx
	xor	eax, eax
	xor	ebx, ebx
	
.loop:					;Horner's formula
	cmp	ecx, 4
	jge	.endloop
	add	eax, eax		;eax*2
	xor	ebx, ebx
	mov	bl, byte[edx]
	sub	bl, '0'
	add 	eax, ebx
	inc	ecx
	inc	edx
	jmp	.loop

.endloop:
	cmp	eax, 9
	jg	.gt9
	add	eax, '0'
	jmp	.repeat
	
.gt9:
	add	eax, 'A'-10
	
.repeat:
	mov	dword[ebp-8], eax
	mov	edx, 1
	mov	ecx, esp
	mov	ebx, 1
	mov	eax, 4
	int 	80h
	mov	eax, dword[ebp-4]
	cmp	eax, 0
	jg	.endbinhex
	inc	eax
	mov	dword[ebp-4], eax
	mov	edx, input
	add	edx, 4
	xor	ecx, ecx
	xor	eax, eax
	xor	ebx, ebx
	jmp 	.loop

.endbinhex:
	mov 	eax, 10
	mov	dword[ebp-8], eax
	mov	edx, 1
	mov	ecx, esp
	mov	ebx, 1
	mov	eax, 4
	int 	80h
	leave
	ret

_start:
	mov	edx, 9
	mov	ecx, input
	mov 	ebx, 0
	mov	eax, 3
	int 	80h
	
	call	binhex
	
	mov	ebx, 0
	mov 	eax, 1
	int 	80h
	
