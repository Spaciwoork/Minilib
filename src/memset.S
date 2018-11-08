SECTION .text
	global memset

memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
	cmp rcx, rdx
	jz end
	mov byte [rdi + rcx], sil
	inc rcx
	jmp loop

end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
