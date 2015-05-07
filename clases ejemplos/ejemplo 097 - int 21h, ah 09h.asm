; ejemplo 97, interrupción 21h, ah = 09h

main proc		    
    mov ah, 09h
    lea dx, string
    int 21h
    hlt 
main endp

variables:
    string db "hola mundo $"