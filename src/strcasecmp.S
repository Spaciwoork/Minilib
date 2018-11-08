section .text
	global strcasecmp

strcasecmp:
	push rbp
        mov rbp, rsp

loop:
	mov r8b, byte [rdi]
       	mov r9b, byte [rsi]
	cmp r8b, 65
	jl loop_next
	je check_maj

loop_next:
	cmp r9b, 65
	jl compare
	je check_maj

check_maj:
	cmp r8b, 91
	jl down_mini_fisrt_str
	je loop_next
	cmp r9b, 91
	jl down_mini_sec_str
	jmp compare

down_mini_fisrt_str:
	add r8b, 32
	jmp check_maj

down_mini_sec_str:
	add r9b, 32
	jmp check_maj

compare:
	cmp r8b, r9b
     	jne end
       	cmp r8b, 0
       	je end
        cmp r9b, 0
        je end
        inc rsi
        inc rdi
	jmp loop

end:
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp
	pop rbp
	ret