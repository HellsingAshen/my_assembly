assume cs:code
	a segment
		db 1, 2, 3, 4, 5, 6, 7, 8
	a ends
	b segment
		db 1, 2, 3, 4, 5, 6, 7, 8
	b ends
	c segment
		db 0, 0, 0, 0, 0, 0, 0, 0
	c ends
	code segment

	
start:	mov ax, a
	mov ds, ax
	
	mov bx, 0
	mov cx, 8
; a addr x   b addr x + 1 c addr x + 2
s:	mov al, ds:[bx]
	add al, ds:[bx + 10h]
	mov ds:[bx + 20h], al
	inc al
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start