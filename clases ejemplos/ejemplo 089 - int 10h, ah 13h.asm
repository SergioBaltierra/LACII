; ejemplo 89, interrupción 10h, ah 13h, imprime un string por pantalla.

main proc
    pantalla:
        mov al, 00h
        mov ah, 13h
        int 10h

    escribimos:
        mov al, 01h
        mov bh, 00h
        mov bl, 0Fh
        mov cl, largo
        mov dh, 00h
        mov dl, 00h
        lea bp, string01

        int 10h

    fin:
        hlt
main endp

variables:
    string01 db "Hola Mundo", 0
    largo db $ - string01