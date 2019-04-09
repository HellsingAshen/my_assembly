assume cs:codeseg 
	codeseg segment
	start:	
		mov ax, 0
		mov bx, 0
		jmp short s
		add ax, 1
		add ax, 1
		add ax, 1
		add ax, 1
		s:
			inc ax

			mov ax, 4c00H
	int 21H
	
	codeseg ends 
	
end start