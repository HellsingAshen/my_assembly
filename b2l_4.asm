; 内存来做缓冲
assume cs:code
	data segment
		db 'unIX' ;75 6e 49 58
		db 'SHEN'
		db 'JINN'
		dw 0	  ; use this to store cx
		db '....' ; cache 1 start from 12
		db '....' ; cache 2
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
	mov ds:[0bH], cx
;loop char
		mov cx,4
		mov bx, 0
	s1: 
		mov al, ds:[di + bx] ;不能内存到内存，那是高级语言
		or al, 20H
		mov ds:[di + bx], al
		inc bx
		loop s1
	
	mov cx, ds:[0bH]
	add di, 4
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start