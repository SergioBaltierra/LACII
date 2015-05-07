; ejercicio 11, imprime un string por impresora.

main proc
    lea si, string
    mov cx, largo
    
    iteramos:
        mov al, [si]
        mov ah, 00h
        int 17h
        inc si
        loop iteramos
    
    hlt
main endp

variables:
    string dw "hola mundo", 0
    largo dw $ - string