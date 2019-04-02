; stack来做缓冲
assume cs:code
	data segment
		db 'unIX' ;75 6e 49 58
		db 'SHEN'
		db 'JINN'
		dw 0	  ; use this to store cx
		db 'abcd' ; cache 1 start from 12
		db 'abcd' ; cache 2
		db 'abcd' ; cache 3
; 24 byte + 1 word = 26 = 1ah  不满足16个字，补齐
; stack top 26 + 2 * 8 = 42 = 2ah 
; sp 按字来处理,sp = sp -2,实验看下
; sp 的初始地址按字节来算，内存全按字节来算
	data ends
	stackseg0 segment
		dw 0bh, 0bh, 0bh, 0bh, 0bh, 0bh, 0bh, 0bh	  ; use this to store cx
	stackseg0 ends
	stackseg segment
		dw 0ah, 0, 0, 0, 0, 0, 0, 0fh	  ; use this to store cx
	stackseg ends
	data1 segment
		db 'unIX' ;75 6e 49 58		  ; 不满足16个字
	data1 ends
	stackseg1 segment
		dw 1, 2, 0, 0, 0, 0, 0, 8	  ; use this to store cx
	stackseg1 ends
	
	data2 segment
		db 'shen' ;75 6e 49 58
	data2 ends
	code segment
start:	
	mov ax, data
	mov ds, ax
; ss + sp
	mov ss, ax
	mov sp, 2ah
;	mov bx, 0
	mov cx, 3
;loop words	
s:
	push cx
;loop char
		mov cx,4
		mov bx, 0
	s1: 
		mov al, ds:[di + bx] ;不能内存到内存，那是高级语言
		or al, 20H
		mov ds:[di + bx], al
		inc bx
		loop s1
	
	pop cx
	add di, 4
	loop s
	
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start