section .text
global strpbrk

strpbrk:
	push rbp
	mov rbp, rsp
	xor rbx, rbx
	cmp rdi, 0
	je .notfound
	cmp rsi, 0
	je .notfound

.loop:
	mov r8b, byte [rdi]
	mov r9b, byte [rsi + rbx]
	cmp r8b, 0
	jz .notfound
	cmp r9b, 0
	jz .reset
	cmp r8b, r9b
	je .found
	inc rbx
	jmp .loop

.reset:
	mov rbx, 0
	inc rdi
	jmp .loop

.found:
	mov rax, rdi
	jmp .end

.notfound:
	mov rax, 0

.end:
	mov rsp, rbp
	pop rbp
	ret