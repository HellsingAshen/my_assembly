assume cs:codeseg
    codeseg segment
            mov ax, 2
            mov ax, ax
            add ax, ax
			
            mov ax, 4c00H
            int 21H
    codeseg ends
end
