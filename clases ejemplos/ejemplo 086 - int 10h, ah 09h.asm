; ejemplo 86, interrupción 10h, ah 09h, despliega un caracter con atributo

main proc
    pantalla:
        mov ah, 00h
        mov al, 13h
        int 10h
    
    despliega:
        mov ah, 09h
        mov al, 'a'
        mov bh, 01h
        mov bl, 0Fh
        mov cx, 01h
        int 10h
    
    fin:
        hlt
main endp