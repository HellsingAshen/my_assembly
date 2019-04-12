assume cs:codeseg
	codeseg segment

	start:	
		mov sp, 10H
		mov ax, 0123H
		mov ds:[0], ax
		; call word ptr ds:[0] ; IP = ?? ; 最后jmp 到ds:[0],所以IP = 0123  4BYTES
		mov word ptr ds:[2], 0
		call dword ptr ds:[0] ; CS = ?? ; 最后push CS， push ip， jmp add，这里push CS之后，CS的值就是0了  4BYTES
		
		;call s	3BYTES
		mov ax, 4c00H
		int 21H
		
	codeseg ends 
end start