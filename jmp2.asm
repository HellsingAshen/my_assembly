assume cs:codeseg 
	codeseg segment
	start:	
		mov ax, 0
		mov bx, 0
		jmp far ptr  s
		db 256 dup (0)	; 0B + offsetaddress0100H = 010BH
		s:
			inc ax
			
	mov ax, 4c00H
	int 21H
	
	codeseg ends 
	
end start