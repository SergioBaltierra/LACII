;ejemplo 96, interrupci�n 21h, ah = 02h

main proc		    
    mov ah, 02h
    mov dl, 'a'
    int 21h
main endp 