SECTION .text
	global strchr

strchr:
	push rbp
	mov rbp, rsp

loop:
	cmp byte [rdi], sil
	je if_found
	cmp byte [rdi], 0
	je if_not_found
	inc rdi
	jmp loop

if_found:
	mov rax, rdi
	jmp end

if_not_found:
	mov rax, 0
	jmp end

end:
	pop rbp
	ret