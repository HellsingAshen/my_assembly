; @desc: dtoc show num in decimal
; @in:
; 		(ax) = word 
; 		ds:si = first_str_pos
; @out:
;		dx = quotient hig_16		
;		ax = quotient low_16
;		cx = remainder 
assume cs:codeseg 
	dataseg segment
		db 10 dup (0)
	dataseg ends
	
	codeseg segment
	start:	
		mov ax, 123
		mov bx, dataseg
		mov ds, bx
		mov si, 0
		call dtoc
		
		mov dh, 8			; line
		mov dl, 5			; coloum
		mov cl, 082H		; color
		call show_str		

		mov ax, 4c00H
		int 21H
dtoc:
	; save env 
	push dx
	push cx
	push di
	push ax
	push bx
	push si

	mov bx, 0
	x:
	mov dx, 0
	mov cx, 10
	div cx
	mov cx, ax
	add dx, '0'
	push dx
	inc bx
	jcxz f
	jmp x
	f:
	mov cx, bx
	x1:
	pop ds:[si]
	inc si
	loop x1
	

	pop si
	pop bx
	pop ax
	pop di
	pop cx
	pop dx
	ret

		
show_str:
		; save env
		push dx
		push cx
		push ax
		push di
		push si
		push es
		
		; 1 line = 80 word = 160 bytes
		; mul 160 * 8 + 2 * 2
		mov al, 0A0H
		mul dh
		add al, dl
		add al, dl
		mov bx, 0B800H
		mov es, bx
		mov bx, 0
		
		mov dl, cl			; color 

		s:
			mov di, ax
			mov cl, ds:[si]
			jcxz ok
			
			mov bl, cl
			mov bh, dl
			mov es:[di], bx
			inc si
			add ax, 2
			loop s
		ok:
			; recover env
			pop es 
			pop si
			pop di
			pop ax
			pop cx
			pop dx

			ret
		
	codeseg ends 
end start