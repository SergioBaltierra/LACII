; ejemplon 100, interrupción 21h, AH = 3Ah

main proc
    lea dx, filepath
    mov ah, 3Ah
    int 21h
    hlt
main endp
                   
filepath db "C:\miDirectorio", 0