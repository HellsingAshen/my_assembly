assume cs:code 
;100001/100 = 186A1H/64H
	data segment
		dd 186A1H
		dw 64H
		dw 0 ; bus
	data ends
	
	code segment
start:	
	mov ax, data
	mov ds, ax
	mov ax, ds:[0]
	mov dx, ds:[2]
	;mov bx, ds:[4]               div    bx 这样也可以
	div word ptr ds:[4] 
	
	mov ds:[6], ax
;bus -> ax
;rem -> dx
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start