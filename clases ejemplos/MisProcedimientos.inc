define_procedimiento macro	
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
define_procedimiento endm