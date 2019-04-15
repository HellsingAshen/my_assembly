; @desc: divdw
; @in:
; 		numerator  = ax + dx * (1<<16)
; 		denominator  = cx
; @out:
;		dx = quotient hig_16		
;		ax = quotient low_16
;		cx = remainder 
assume cs:codeseg 
	dataseg segment
		db 'Hello masm!',0
	dataseg ends
	
	codeseg segment
	start:	
		mov ax, 4240H
		mov dx, 000FH
		mov cx, 0AH
		call divdw

		mov ax, 4c00H
		int 21H
divdw:
; cal hig_16 -> dx
; cal low_16 ->ax
; cal remainder ->cx
	push bx ; save env 
	push ax
	
	mov ax, dx
	mov dx, 0
	div cx
	mov di,0
	mov bx, ax ;save hig_16 dx is remainder as hig_16 of next numerator
	
	pop ax
	div cx 	   ; numerator = dx << 16 + ax
			   ; ax low_16
	mov cx, dx ;remainder
	mov dx, bx ; hig_16
	
	pop bx
	ret
	
	codeseg ends 
	
end start