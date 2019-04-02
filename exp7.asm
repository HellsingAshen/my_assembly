assume cs:codeseg 
	data segment
		db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
		db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
		db '1993', '1994', '1995' 

		dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
		dd 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000
; 5A9768 5937000
;84 + 21 * 4 byte = 168 = A8H
		dw 3, 7, 9, 13, 28, 38, 130, 220, 475, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
		dw 11542, 14430, 15257, 17800
; 8845 17800
; 168 + 21 * 2 = 210 = D2H; start pos = D0H
	data ends

	table segment
		db 21 dup ('year summ ne ?? ')
	table ends
		
	stkdb segment
		db 21 dup ('0000')
	stkdb ends
	
	stkdd segment
		dd 21 dup (0, 0)
	stkdd ends
	
	stkdw segment
		dw 21 dup (0)
	stkdw ends
	
	codeseg segment
start:	
;year
	; ss + sp
	mov ax, stkdb
	mov ss, ax
	mov sp, 54H
	; ds
	mov ax, data
	mov ds, ax

	mov cx, 2AH
	mov bx, 52H ; 80 point to 1995
	s:
		push ds:[bx]
		sub bx, 2H
		loop s
	
	; insert into table
	mov ax, table
	mov ds, ax
	
	mov cx, 15H
	mov bx, 0H
	s1:
		pop ds:[bx]	; 2 bytes
		add bx, 2H
		pop ds:[bx]	; 2 bytes
		add bx, 0EH ; start 2 to 15  = 15 - 2 + 1 = 14 = E;到处是坑
		loop s1;
;summ
;dd
	; ss + sp
	mov ax, stkdd
	mov ss, ax
	mov sp, 54H ; 21 * 4 = 84bytes = 54H stTop
	; ds + [ip]
	mov ax, data
	mov ds, ax
	;mov bx, 0A8H
	mov bx, 0A6H ; first ele addr 0A6H
	
	mov cx, 2AH
	s2:
		; push 
		push ds:[bx] ; 
		sub bx, 2H
		loop s2
; insert into table		
	mov ax, table
	mov ds, ax
	
	mov cx, 15H
	mov bx, 5H
	s3:
		; do with dd everytime 
		pop ds:[bx]
		add bx, 2H
		pop ds:[bx]
		add bx, 0EH
		loop s3

; ne start 
;
	; ss + sp
	mov ax, stkdw
	mov ss, ax
	mov sp, 2AH  ; stack top 21 * 2 = 42 = 2AH
	; ds + [ip]
	mov ax, data
	mov ds, ax
	mov bx, 0D0H  
	
	mov cx, 15H
	s4:
		; push 
		push ds:[bx] ; 
		sub bx, 2H
		loop s4
; insert into table		
	mov ax, table
	mov ds, ax
	
	mov cx, 15H
	mov bx, 0AH
	s5:
		; do with dw everytime 
		pop ds:[bx]
		add bx, 10H
		loop s5
; ne end

; div start
; 32 bytes
;db 21 dup ('year summ ne ?? ')
; dd / dw 
	mov ax, table
	mov ds, ax
	
	mov bx, 0H
	mov cx, 15H ; loop 21
	s6:
		mov ax, ds:[bx + 5]
		mov dx, ds:[bx + 7]
		div word ptr ds:[bx + 10]
		mov ds:[bx + 13], ax
		add bx, 10H
		loop s6
; div end 

;bus -> ax
;rem -> dx
	mov ax, 4c00H
	int 21H
	
	codeseg ends 
	
end start