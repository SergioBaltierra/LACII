; ejemplo 103, interrupción 21h, AH = 3Fh

main proc
    declaramos:
        mov ax, 0
        mov bx, 0
        mov cx, 0
        mov dx, 0
        jmp abrir
    
    abrir:
        mov ah, 3Dh
        mov al, 2
        lea dx, archivo
        int 21h 
        
        mov handle, ax
        
    lectura:
        mov ah, 3Fh
        mov bx, handle
        mov cl, largo
        lea dx, sms02
        int 21h
         
    cierre:
        mov ah, 3Eh
        mov bx, handle
        int 21h
        
    pantalla:
        mov ah, 09h
        mov bx, 0
        mov bl, largo
        mov sms02[bx+2], '$'
        lea dx, sms02
        int 21h      
            
    fin:
        hlt           
main endp
   
variables:
    handle dw ?
    archivo db "C:\archivo01.txt", 0
    sms01 db "Mensaje 01"
    largo db $ - sms01
    
    sms02 db largo dup(' ')