; ejemplo 85, interrupción 10h, AH = 00h, modo de video

main proc
    mov ah, 00h
    mov al, 00h
    int 10h  

    mov ah, 00h
    mov al, 01h
    int 10h
    
    mov ah, 00h
    mov al, 02h
    int 10h
             
    mov ah, 00h
    mov al, 03h
    int 10h
    
    mov ah, 00h
    mov al, 04h
    int 10h  
    
    mov ah, 00h
    mov al, 05h
    int 10h
                      
    mov ah, 00h
    mov al, 06h
    int 10h  
    
    mov ah, 00h
    mov al, 07h
    int 10h
    
    mov ah, 00h
    mov al, 08h
    int 10h  
    
    mov ah, 00h
    mov al, 09h
    int 10h   
    
    mov ah, 00h
    mov al, 10h
    int 10h  
    
    mov ah, 00h
    mov al, 11h
    int 10h
                  
    mov ah, 00h
    mov al, 12h
    int 10h  
    
    mov ah, 00h
    mov al, 13h
    int 10h
main endp