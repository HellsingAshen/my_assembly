assume cs:useStack
    useStack segment
			dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h  ;8 个字 16个字节 32bit
			dw 0, 0, 0, 0, 0, 0, 0, 0
			mov ax, cs
			mov ss, ax
			mov sp,20h
			
			mov bx, 0
			mov cx, 8
		s:	push cs:[bx]
			add bx, 2
			loop s
		
			mov bx, 0
			mov cx, 8
		q:  pop cs:[bx]
			add bx, 2
			loop q
			
			mov ax, 4c00H
            int 21H
    useStack ends
end
