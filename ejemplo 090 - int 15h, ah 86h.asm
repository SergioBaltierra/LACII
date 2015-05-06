; ejemplo 90, interrupción 15h, ah = 86h, pausa

main proc
    mov ah, 86h
    mov cx, 100
    int 15h
main endp