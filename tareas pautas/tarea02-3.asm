; Tarea 02, ...
; Nombre Completo...
; RUN: ...    

; sumamos solo algunos numeros fibonacci (ver si pares o impares)

declaramos:
    mov ax, 1
    mov bx, 1
    mov cx, 9
    ;add resultado, ax

sumaFibonacci:  
    ;add resultado, bx
    add ax, bx
    div dos    
    cmp dx, 0          
    xchg ax, bx
    loop sumaFibonacci
    
fin:
    hlt    
    
              
VariablesYConstantes:              
    resultado dw 0
    dos equ 2
    
