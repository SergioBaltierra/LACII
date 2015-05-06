;ejemplo 98, interrupción 21h, AH = 0Ah

main proc		    
    leemos:
        mov ah, 0Ah
        lea dx, string
        int 21h
          
    imprimir:
        mov ah, 09h
        mov bx, 0
        mov bl, string[1]
        mov string[bx+2], '$'
        lea dx, string+2
        int 21h
               
    fin:
        hlt
main endp

variables:
    string db 10 dup(' ')