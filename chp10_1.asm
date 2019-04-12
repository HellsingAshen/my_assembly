assume cs:code
	stk segment
		db 16 dup (0)
	stk ends
	
	code segment
		mov ax, 4c00H
		int 21H
	start:	
		mov ax, stk
		mov ss, ax
		mov sp, 10H
		mov ax, 0
		push ax
		mov bx, 0
		ret ;pop IP
	code ends 
end start