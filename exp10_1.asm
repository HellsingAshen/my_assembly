; 不存寄存器版本, 找个存颜色的寄存器好难！！！都被用了
; call 要保存将要被改变的 寄存器
assume cs:codeseg 
	dataseg segment
		db 'Hello masm!',0
	dataseg ends
	
	codeseg segment
	start:	
		mov dh, 8			; line
		mov dl, 5			; coloum
		mov cl, 082H		; color
		;mov cl, 02H		 ; color
		mov ax, dataseg
		mov ds, ax
	
		mov si, 0
		call show_str

		mov ax, 4c00H
		int 21H
		
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