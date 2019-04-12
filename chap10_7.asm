; 有意思的东西，主函数调用子函数用汇编来理解
assume cs:codeseg
	codeseg segment

	start:	
		main:
			call sub1 ; 调用子函数1, push IP1
			; do something
		mov ax, 4c00H
		int 21H
		
	sub1:
		call sub2 ;调用子函数2， push IP2
		; do something 
		ret		   ; pop IP1, goto "call sub1".next_IP
	
	sub2:
		; do something 
		ret ; pop IP2, goto "call sub2".next_IP
		
		
	codeseg ends 
end start