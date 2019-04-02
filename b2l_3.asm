; 外循环控制
assume cs:code
	data segment
		db 'unIX' ;75 6e 49 58
		db 'SHEN'
		db 'JINN'
	data ends

	code segment
start:	
	mov ax, data
	mov ds, ax
	mov di, 0
	
;	mov bx, 0
	mov cx, 3
;loop words	
s:
	mov si, cx
;loop char
		mov cx,4
		mov bx, 0
	s1: 
		mov al, ds:[di + bx]
		or al, 20H
		mov ds:[di + bx], al
		inc bx
		loop s1
	
	mov cx, si
	add di, 4
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start