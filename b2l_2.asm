assume cs:code
	data segment
		db 'unIX'
		db 'SHEN'
		db 'JINN'
	data ends

	code segment
start:	
	mov ax, data
	mov ds, ax
	
	mov bx, 0
	mov cx, 3
;loop words	
s:
	mov si, cx
;loop char
		mov cx,4
	s1: 
		mov al, ds:[bx]
		or al, 20H
		mov ds:[bx], al
		inc bx
		loop s1
	
	mov cx, si
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start