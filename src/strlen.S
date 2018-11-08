section .text
        global strlen

strlen:
        push rbp
        mov rbp, rsp
        xor rax, rax

loop:
        cmp byte [rdi], 0h
        jz end
        inc rax
        inc rdi
        jmp loop

end:
	pop rbp
	ret
