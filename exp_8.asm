assume cs:codeseg 
	codeseg segment
		mov ax, 4c00H ; -10 处
		int 21H
	start:	
		mov ax, 0
		s:
			nop
			nop			;jmp -10
			
			mov di, offset s
			mov si, offset s2
			mov ax, cs:[si]
			mov cs:[di], ax
		s0:
			jmp short s	; jmp -16
			
		s1:
			mov ax, 0
			int 21H
			mov ax, 0
		s2:
			jmp short s1 ; jmp -10
			nop
	codeseg ends 
	
end start