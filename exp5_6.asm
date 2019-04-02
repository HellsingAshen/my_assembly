assume cs:code
	a segment
		db 1, 2, 3, 4, 5, 6, 7, 8, 9, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 0ffh
	a ends
	b segment
		db 0, 0, 0, 0, 0, 0, 0, 0
	b ends
	code segment
	
start:
; determine ss
	mov ax, b
	mov ss, ax
	mov sp, 10h
	
; determine ds
	mov ax, b
	mov ds, ax
	
	mov bx, 0
	mov cx, 8
; 
s:	
	push ds:[bx]
	add bx, 2
	loop s
; end
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start