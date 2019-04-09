assume cs:codeseg 
	codeseg segment
	start:	
		mov ax, 2000H
		mov bx, 0
		s:
			mov cl, ds:[bx]
			mov ch, 0
			jcxz ok
			inc bx
			jmp short s
		ok:
			mov dx, bx			
	mov ax, 4c00H
	int 21H
	
	codeseg ends 
	
end start