; ejemplo 87, interrupción 10h, ah 0Ch, escribe un pixel

main proc
    declaramos:    
        mov ah, 00h
        mov al, 13h
        int 10h
        
        mov bh, 1       
        mov cx, 100     
        mov dx, 20      
        mov al, 0Fh     
        
    salida:
        mov ah, 0Ch     
        int 10h
        
        inc cx          
        
        cmp cx, 200     
        je fin          
        jmp salida      
        
    fin:
        hlt
main endp