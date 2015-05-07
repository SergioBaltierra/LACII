; suma los 10 primeros números de forma recursiva.

codigo:  
    main proc                   ; procedimiento main
        mov cx, numero          ; igualamos CX igual a numero
        mov ax, 0               ; limpiamos AX == 0
        call suma               ; llamamos a procedimiento suma
        hlt                     ; parada de ejecución
    main endp                   ; fin de procedimiento main
    
    suma proc                   ; Calcula la suma de una lista de enteros     
        cmp cx, 0               ; comparamos CX == 0
        jz return               ; si es cero saltamos a return
        add resultado, cx       ; de lo contrario sumamos a variable resultado valor de CX
        dec cx                  ; decrementamos CX en 1
        call suma               ; llamamos a procedimiento suma
        
        return:                 ; return
            ret                 ; retornamos donde fuimos llamados
    suma endp                   ; fin de procedimiento suma
    
variables:                      
    resultado dw 0              ; declaramos variable resultado
    numero dw 10                ; declaramos hasta que número calculará la suma sucesiva.


