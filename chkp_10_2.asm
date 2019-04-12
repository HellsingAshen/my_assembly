assume cs:codeseg
	codeseg segment

	start:	
		mov ax, 0
		call s
		inc ax
		s:
			pop ax
		
		mov ax, 4c00H
		int 21H
		
	codeseg ends 
end start