; ejemplo 102, interrupción 21h, AH = 40h

main proc
	declaramos:             
        mov cx, 0
        mov dx, 0
        jmp abrir
   
    abrir:
        mov ah, 3Dh
        mov al, 02h
        lea dx, archivo
        int 21h                       
        
        mov handle, ax
        
    escribir:
        mov ah, 40h
        mov bx, handle
        mov cl, largo
        lea dx, sms01
        int 21h
                 
    cierre:
        mov ah, 3Eh
        mov bx, handle
        int 21h
        
    fin:
        hlt
main endp
         
variables:
    archivo db "C:\archivo01.txt", 0
    sms01 db "Mensaje 01"
    largo db $ - sms01
    handle dw ?