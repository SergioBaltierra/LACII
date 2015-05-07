; Tarea 02, ...
; Nombre Completo...
; RUN: ...    

; algoritmo: suma los 10 primeros n�meros fibonacci
; 1+1+2+3+5+8+13+21+34+55=143

declaramos:     ; declaramos registros
    mov ax, 1   ; iniciamos AX = 1, primer o pen�ltimo n�mero fibonacci
    mov bx, 1   ; iniciamos BX = 1, segundo o �ltimo n�mero fibonacci
    mov cx, 9   ; iniciamos CX = 9, contador de iteraciones.
    add resultado, ax   ; sumamos el primer n�mero fibonacci a resultado.

sumaFibonacci:          ; etiqueta suma fibonacci
    add resultado, bx   ; sumamos el CX-�simo n�mero fibonacci
    add ax, bx          ; calculamos el siguiente n�mero fibonacci sumando AX y BX, donde AX es el pen�ltimo y BX el �ltimo n�mero fibonacci
    xchg ax, bx         ; cambiamos AX por BX y BX por AX respetando la l�gica que AX y BX contiene el pen�ltimo y �ltimo n�mero fibonacci respectivamente
    loop sumaFibonacci  ; hacemos un loop a la etiqueta sumaFibonacci
    
fin:                    ; etiqueta fin
    hlt                 ; se detiene la ejecuci�n
                 
variables:              ; declaramos variables
    resultado dw 0      ; declaramos la variable resultado de tipo DW