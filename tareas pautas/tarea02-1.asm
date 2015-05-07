; Tarea 02, ...
; Nombre Completo...
; RUN: ...    

declaramos:
    mov ax, 1
    mov bx, 1
    mov cx, 9
    add resultado, ax

sumaFibonacci:  
    add resultado, bx
    add ax, bx
    mov dx, ax
    mov ax, bx
    mov bx, dx
    loop sumaFibonacci
    
fin:
    hlt 
    
              
variables:              
    resultado dw 0