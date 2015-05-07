; ejemplo 91, interrupción 16h, AH = 00h, lee una pulsación del teclado.

main proc
    mov ah, 00h
    int 16h
main endp