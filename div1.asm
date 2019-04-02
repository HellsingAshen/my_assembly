assume cs:code 
;100001/100 = 186A1H/64H
	code segment
start:	
	mov ax, 86A1H
	mov dx, 01H
	mov bx, 64H
	div bx
;bus -> ax
;rem -> dx
	mov ax, 4c00H
	int 21H
	
	code ends 
	
end start