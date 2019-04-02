assume cs:code
	data segment
		db 'wlecome to masm!'
		db '................'
	data ends

	code segment
start:	
	mov ax, data
	mov ds, ax
	
	mov bx, 0
	mov cx, 8
s:	
	mov di, ds:[bx]
	mov ds:[16+bx], di
	add bx, 2
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start