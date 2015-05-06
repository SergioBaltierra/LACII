;ejemplo 99, interrupción 21h, AH = 39h

main proc		    
    lea dx, filepath
    mov ah, 39h
    int 21h
    hlt
main endp

filepath db "C:\miDirectorio", 0