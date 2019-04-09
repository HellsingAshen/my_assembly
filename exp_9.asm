assume cs:code 
;100001/100 = 186A1H/64H
	data segment
		db 'w e l c o m e   t o   m a s m ! '
	data ends
	stk segment
			dw 16 dup(0)
	stk ends
	code segment
start:	
	; push stack
	mov ax, stk
	mov ss, ax
	mov sp, 20H
	
	mov ax, data
	mov ds, ax
	
	mov cx, 10H
	mov bx, 1EH

	s:
		push ds:[bx]
		sub bx, 2
		loop s
		
	mov ax, 0B800H
	mov ds, ax
	
	mov cx, 10H
	mov bx, 140H; start line 3
	s1:
		pop ds:[bx]
		;mov byte ptr ds:[bx + 1], 88H ;闪烁你的眼睛
		mov byte ptr ds:[bx + 1], 0CAH ;红背绿字闪亮你的眼
		add bx, 2
		loop s1

	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start