; stack来做缓冲2
assume cs:code
	data segment
		db 'UNIXUNIX' ;75 6e 49 58
		db 'SHENSHEN' ;75 6e 49 58
		db 'JINNJINN' ;75 6e 49 58
	data ends

	stackseg segment
		dw 0, 0, 0, 0, 0, 0, 0, 0	  ; use this to store cx 24 + 16 = 40 = 28h
	stackseg ends
	data1 segment
		db 'shenshenshenshen' ;75 6e 49 58		  ; 不满足16个字
	data1 ends

	code segment
start:	
	mov ax, data 
	mov ds, ax
; ss + sp
	mov ax, stackseg
	mov ss, ax
	mov sp, 10h
;	mov bx, 0
	mov cx, 3
;loop words	
s:
	push cx
;loop char
		mov cx,8
		mov bx, 0
	s1: 
		mov al, ds:[di + bx] ;不能内存到内存，那是高级语言
		or al, 20H
		mov ds:[di + bx], al
		inc bx
		loop s1
	
	pop cx
	add di, 8
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start