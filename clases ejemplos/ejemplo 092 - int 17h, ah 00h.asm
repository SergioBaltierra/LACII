; ejemplo 92, interrupci�n 17h, AH 00h, servicios de impresora.

main proc
    mov al, 'a'
    mov ah, 00h
    int 17h
main endp