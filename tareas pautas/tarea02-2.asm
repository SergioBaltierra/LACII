; Tarea 02, ...
; Nombre Completo...
; RUN: ...    

; algoritmo: suma los 10 primeros números fibonacci
; 1+1+2+3+5+8+13+21+34+55=143

declaramos:     ; declaramos registros
    mov ax, 1   ; iniciamos AX = 1, primer o penúltimo número fibonacci
    mov bx, 1   ; iniciamos BX = 1, segundo o último número fibonacci
    mov cx, 9   ; iniciamos CX = 9, contador de iteraciones.
    add resultado, ax   ; sumamos el primer número fibonacci a resultado.

sumaFibonacci:          ; etiqueta suma fibonacci
    add resultado, bx   ; sumamos el CX-ésimo número fibonacci
    add ax, bx          ; calculamos el siguiente número fibonacci sumando AX y BX, donde AX es el penúltimo y BX el último número fibonacci
    xchg ax, bx         ; cambiamos AX por BX y BX por AX respetando la lógica que AX y BX contiene el penúltimo y último número fibonacci respectivamente
    loop sumaFibonacci  ; hacemos un loop a la etiqueta sumaFibonacci
    
fin:                    ; etiqueta fin
    hlt                 ; se detiene la ejecución
                 
variables:              ; declaramos variables
    resultado dw 0      ; declaramos la variable resultado de tipo DW