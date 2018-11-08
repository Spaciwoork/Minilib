section .text
	global strcspn

strcspn:
	push rbp
	mov rbp, rsp
	push rdx
	xor rcx, rcx
	xor rbx, rbx
	cmp rsi, 0h
	jz end

loop:
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rbx]
	cmp r8b, 0h
	jz end
	cmp r9b, 0h
	jz reset
	inc rcx
	inc rbx
	jmp loop

reset:
	mov rbx, 0
	jmp loop

end:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret