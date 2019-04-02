assume cs:code
	data segment
		db 'unIX'
; 75 6e 49 58
	data ends

	code segment
start:	
	mov ax, data
	mov ds, ax
	
	mov bx, 0
	mov cx, 4
s:	
	mov al, ds:[bx]
	or al, 20H
	mov ds:[bx], al
	inc bx
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start