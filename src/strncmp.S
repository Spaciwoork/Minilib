section .text
	global strncmp

strncmp:
	push rbp
	mov rbp, rsp
	push rdx
	xor rcx, rcx
	xor rbx, rbx

loop:
	cmp rbx, rdx
	jz nend
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rcx]
	cmp r8b, r9b
	jz cond
	jne end

cond:
	cmp r8b, 0h
	jz end
	inc rcx
	inc rbx
	jmp loop

end:
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp
	pop rbp
	ret

nend:
	mov rax, 00
	mov rsp, rbp
	pop rbp
	ret