; ejemplo , instrucci�n 20h, termino aplicaci�n.

main proc    
    mov ax, 0
    mov bx, 0
    mov cx, 5
    mov dx, 3
    
    itera:
        inc bx
        cmp bx, dx
        je para
        loop itera
        
        para:
            int 20h         
main endp            