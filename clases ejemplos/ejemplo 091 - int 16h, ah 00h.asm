; ejemplo 91, interrupci�n 16h, AH = 00h, lee una pulsaci�n del teclado.

main proc
    mov ah, 00h
    int 16h
main endp