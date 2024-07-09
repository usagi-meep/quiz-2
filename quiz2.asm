section .data
	a dd 1		; pre-defined example value
	b dd 4		; example value
	c dd 7		; example value
	d dd 10		; example value

section .text
	global _start

_start:
	; working inside out, a*b
	mov eax, [a]	; put a into eax
	imul eax, [b]	; multiplies a by b
	mov ecx, eax	; stores a*b so it does not
			; get overwritten

	; c*d
	mov eax, [c]	; put c into eax
	imul eax, [d]	; multiply c by d

	; a*b + c*d
	add eax, ecx	; adds the two products,
			; stores in eax
	mov [result], eax	; stores answer in result

	; exit program
	mov eax, 1	; syscall exit
	xor ebx, ebx	; exit code 0
	int 0x80	; call kernel

section .bss
	result resd 1	; reserves double word
