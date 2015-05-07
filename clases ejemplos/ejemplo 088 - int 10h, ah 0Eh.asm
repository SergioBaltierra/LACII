; ejemplo 87, interrupción 10h, ah 0Eh, salida de teletipo.

main proc
     mov ah, 0Eh
     mov al, 'a'
     int 10h
main endp