section .text
	global rindex

rindex:
	push rbp
	mov rbp, rsp
	xor rax, rax
	mov rbx, rsi

loop:
	movsx rcx, byte [rdi]
	cmp rcx, 0h
	je end
	cmp rcx, rbx
	je save
	inc rdi
	jmp loop

save:
	mov rax, rdi
	inc rdi
	jmp loop

curl:
	inc rdi
	jmp loop

end:
	mov rsp, rbp
	pop rbp
	ret