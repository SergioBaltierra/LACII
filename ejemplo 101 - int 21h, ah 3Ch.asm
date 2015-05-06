; ejemplo 101, interrupción 21h, AH = 3Ch

main proc
 	mov ah, 3Ch
    mov cx, 0
    lea dx, filename
    int 21h
    
    mov handle, ax
    hlt                
main endp
       
handle dw ?
filename db "C:\archivo01.txt", 0  