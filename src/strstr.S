section .text
	global strstr

strstr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	cmp rdi, 0h
	jz end
	cmp rsi, 0h
	jz end

loop:
	xor rdx, rdx
	mov r10b, byte [rdi]
	mov r11b, byte [rsi]
	cmp r10b, r11b
	je comp
	cmp r10b, 0h
	je end

comp:
	inc rdx
	mov r8b, byte [rdi + rdx]
	mov r9b, byte [rsi + rdx]
	cmp r9b, 0h
	je found
	cmp r8b, r9b
	je comp
	jne curl

curl:
	inc rdi
	jmp loop

end:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

found:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret