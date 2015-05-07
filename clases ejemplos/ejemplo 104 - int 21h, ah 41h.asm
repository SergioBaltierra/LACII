; ejemplo 104, interrupción 21h, AH = 41h

main proc
    declaramos:
        mov cx, 0
        mov dx, 0    
    
    eliminar:
        mov ah, 41h
        lea dx, archivo
        int 21h 
    
    fin:
        hlt
main endp
   
variables:
    archivo db "C:\archivo01.txt", 0