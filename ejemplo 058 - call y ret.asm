; ejemplo 58, instrucciones de subrutinas: call y ret

call inicio
call suma
call multiplicacion
call fin

multiplicacion:
    mul bx
    ret

suma:
    add ax, cx
    ret

inicio:
    mov ax, 10
    mov bx, 2
    mov cx, 11    
    ret      
    
fin:
    hlt    