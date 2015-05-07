call procedimiento01
call procedimiento02
call fin

procedimiento01 proc			
    mov ax, 1
    mov bx, 2
    ret	
procedimiento01 endp 

procedimiento02 proc			
    add ax, bx    
    ret	
procedimiento02 endp

fin proc
    hlt
fin endp