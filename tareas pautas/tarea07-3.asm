; Tarea 7: La constelación
; Nombre Completo: ...
; RUN: ...

; Algoritmo: dada dos coordenadas donde una es de origen y otra es de destino, trazar una línea recta mediante el algoritmo de Bresenham.
; Las coordenadas deben estar contenidas en dos vectores, donde el primer vector están las coordendas de origen y el segundo vector estan las coordenadas de destino.


main proc 
    cargamos:
        lea si, vector_inicio       ; cargamos SI-ésima celda del vector_inicio en el registo SI.
        lea di, vector_termino      ; cargamos DI-ésima celda del vector_termino en el registro DI.
        
        mov ax, estrellas           ; copiamos variable cantidad de estrellas en el registro AX.
        mul dos                     ; multiplicamos por dos el registro AX.
        mov estrellas, ax           ; copiamos el nuevo valor de AX en la variable estrellas, esto porque siempre usaremos dos estrellas por linea recta.
        
        mov ah, 00h                 ; mostramos modo de video con la subinterrupción AH = 00h.
        mov al, 13h                 ; indicamos las características del modo de video con el registro AL (320x200).
        int 10h                     ; mostramos el modo de video con la interrupción 10h.
    
    calculo:                        ; etiqueta calculo.
        mov ax, [si]                ; copiamos SI-ésima celda del vector_inicio al registro AX.
        mov x_0, ax                 ; copiamos registro AX en la variable x_0 (primer elemento del par SI, que será x_0).
        mov ax, [di]                ; copiamos DI-ésima celda del vector_termino al registro AX.
        mov x_1, ax                 ; copiamos registro AX en la variable x_1 (primer elemento del par DI, que será x_1).
        
        mov ax, [si+2]              ; copiamos SI+2-ésima celda del vector_inicio al registro AX.
        mov y_0, ax                 ; copiamos registro AX en la variable y_0 (segundo elemento del par SI, que será y_0).
        mov ax, [di+2]              ; copiamos DI+2-ésima celda del vector_termino al registro AX.
        mov y_1, ax                 ; copiamos registro AX en la variable y_1 (segundo elemento del par DI, que será y_1)
        
        add si, 4                   ; incrementamos SI en 4, para los siguientes coordenadas del vector_inicio.
        add di, 4                   ; incrementamos DI en 4, para las siguientes coordenadas del vector_termino. 
        sub estrellas, 2            ; decrementamos en dos la variable estrellas.
    
        mov dx, x_0                 ; copiamos la variable x_0 al registro DX.
        mov ax, x_1                 ; copiamos la variable x_1 al registro AX.
        sub ax, dx                  ; restamos los registros AX - DX (x_1 - x_0).
        mov delta_x, ax             ; copiamos el valor de AX en la variable delta_x.
        mul dos                     ; multiplicamos por dos el registro AX.
        mov dos_delta_x, ax         ; copiamos el valor del registro AX en la variable dos_delta_x.
       
        xor ax, ax                  ; limpiamos el registro AX.
        xor dx, dx                  ; limpiamos el registro DX.
        mov dx, y_0                 ; copiamos la variable y_0 al registro DX.
        mov ax, y_1                 ; copiamos la variable y_1 al registro AX.
        sub ax, dx                  ; restamos los registros AX - DX (y_1 - y_0).
        mov delta_y, ax             ; copiamos el valor de AX en la variable delta_y.
        mul dos                     ; multiplicamos por dos el registro AX.
        mov dos_delta_y, ax         ; copiamos el valor del registro AX en la variable dos_delta_y.

        mov dx, dos_delta_x                     ; copiamos dos_delta_x en el registro DX.
        mov ax, dos_delta_y                     ; copiamos dos_delta_y en el registro AX.
        sub ax, dx                              ; restamos AX - DX (dos_delta_y - dos_delta_x).
        mov dos_delta_y_menos_dos_delta_x, ax   ; copiamos el valor del registro AX en la variable dos_delta_y_menos_dos_delta_x.
        mov p, ax                               ; copiamos el valor del registro AX en la variable p.
        
        mov ax, delta_x             ; copiamos la variable delta_x en el registro AX.
        cmp ax, 0                   ; comparamos AX == 0 (verificamos que delta_x sea positivo).
        je delta_x_cero             ; si AX es 0, saltamos a la etiqueta delta_x_cero.
        jl negativo                 ; de lo contrario saltamos a etiqueta negativo.
        jmp no_negativo             ; por descarte delta_x es positivo, entonces saltamos a etiqueta no_negativo.
            
        delta_x_cero:               ; etiqueta delta_x_cero.
            mov ax, delta_y         ; al ser delta_x == 0, usamos delta_y y lo copiamos al registro AX.
            cmp ax, 0               ; comparamos AX == 0.
            jl negativo             ; si es menor que 0, saltamos a la etiqueta negativo.
            jmp no_negativo         ; de lo contrario saltamos a etiqueta no_negativo.
            
        negativo:                   ; etiqueta negativo
            neg ax                  ; negamos el valor de AX (haciendo delta_x o delta_y > 0).
        
        no_negativo:                ; etiqueta no_negativo
            mov k, ax               ; copiamos registro AX a la variable k.
            inc k                   ; incrementamos k en uno.

        call recta                  ; llamamos a procedimiento recta.
        
        xor ax, ax                  ; limpiamos registro AX.
        mov ax, estrellas           ; copiamos la variable estrellas en el registro AX.
        cmp ax, 0                   ; comparamos AX == 0.
        je termino                  ; si son iguales saltamos a etiqueta termino.
        jmp calculo                 ; de lo contrario saltamos a etiqueta calculo.
        
        termino:                    ; etiqueta termino.
            hlt                     ; hlt paramos ejecución.
main endp                           ; fin de procedimiento main

recta proc                          ; procedimiento recta
    declaramos_recta:               ; etiqueta declaramos_recta.
        xor ax, ax                  ; limpiamos registro AX.
        xor bx, bx                  ; limpiamos registro BX.
        xor cx, cx                  ; limpiamos registro CX.
        xor dx, dx                  ; limpiamos registro DX.
        
        mov ax, x_0                 ; copiamos valor de la variable x_0 al registro AX.
        mov x_add_1, ax             ; copiamos valor del registro AX en la variable x_add_1.
        
        mov ax, y_0                 ; copiamos valor de la variable y_0 al registro AX.
        mov y_add_1, ax             ; copiamos valir dek registro AX en la variable y_add_1.
        jmp dibujar_recta           ; saltamos a etiqueta dibujar_recta.
        
    bresenham_recta:                ; etiqueta bresenham_recta.
        xor ax, ax                  ; limpiamos registro AX.
        mov ax, delta_y             ; copiamos valor de la variable delta_y en el registro AX.
        cmp ax, 0                   ; comparamos AX == 0 (primeros asumimos que m == 0).
        je menor_recta              ; si son iguales saltamos a etiqueta menor_recta, delta_y == 0.
        jl excepcion_1              ; de lo contrario, si es menor saltamos a etiqueta expcecion_1, delta_y < 0.
        
        mov ax, delta_x             ; copiamos valor de la variable delta_x en el registro AX.
        cmp ax, 0                   ; comparamos AX == 0 (asumimos que m == ind).
        je llamar_direccion_y       ; si son iguales, saltamos a etiqueta llamar_direccion_y (m es ind, solo crece en el eje y).
        jmp no_excepcion            ; de lo contrario saltamos a etiqueta no_excepcion.
        
        excepcion_1:                ; etiqueta excepcion_1
            mov ax, delta_x         ; copiamos la variable delta_x en el registro AX.
            cmp ax, 0               ; comparamos AX == 0.
            je llamar_direccion_y   ; si son iguales saltamos a etiqueta llamar_direccion_y
            jg excepcion_2          ; si es mayor saltamos a etiqueta excepcion_2.
            jmp no_excepcion        ; de lo contrario saltamos a etiqueta no_excepcion.
            
            excepcion_2:            ; etiqueta excepcion_2.
                jmp no_menor_recta  ; saltamos etiqueta no_menor_recta.
   
        no_excepcion:               ; etiqueta no_excepcion (descartamos que m == 0 o m == ind). 
            mov ax, p               ; copiamos variable p al registro AX.
            cmp ax, 0               ; coparamos AX == 0.
        
            jl menor_recta          ; si es menor saltamos a etiqueta menor_recta.
            jmp no_menor_recta      ; de lo contrario saltamos a etiqueta no_menor_recta.
                
        menor_recta:                ; etiqueta menor_recta.
            call direccion_x        ; llamamos a procedimiento direccion_x.
            
            mov ax, p               ; copiamos valor de la variable p en el registro AX.
            add ax, dos_delta_y     ; sumamos al registro AX + dos_delta_y. 
            mov p, ax               ; copiamos valor del registro AX a la variable p.

            jmp dibujar_recta       ; saltamos a etiqueta dibujar_recta.
            
        no_menor_recta:             ; etiqueta no_menor_recta.
            call direccion_x        ; llamamos a procedimiento_x.
            call direccion_y        ; llamamos a procedimiento_y.
            
            mov ax, p                              ; copiamos la variable p al registro AX.
            add ax, dos_delta_y_menos_dos_delta_x  ; sumamos al registro AX + dos_delta_y_menos_dos_delta_x.
            mov p, ax                              ; copiamos valor del registro AX a la variable p.
            jmp dibujar_recta                      ; saltamos a etiqueta dibujar_recta.
            
        llamar_direccion_y:         ; etiqueta llamar_direccion_y.
            call direccion_y        ; saltamos a procedimiento direccion_y.
            mov ax, p               ; copiamos valor de la variable p al registro AX.
            add ax, dos_delta_x     ; sumamos AX + dos_delta_x.
            mov p, ax               ; copiamos valor del registro AX a la variable p.
               
        dibujar_recta:              ; etiqueta dibujar_recta.
            mov bh, 1               ; marcamos pagina 1 en el registro BH.
            mov cx, x_add_1         ; copiamos coordenada eje x (x_add_1) en el registro CX.
            mov dx, y_add_1         ; copiamos coordenada eje y (y_add_1) en el registro DX.
            mov al, 0Fh             ; marcamos con color blanco el pixel a dibujar con el registro AL.       
            mov ah, 0Ch             ; asignamos la subinterrupción dibujar un pixel con AH = 0Ch. 
            int 10h                 ; llamamos a la interrupción modo de video 10h.
        
        salir_recta:                ; etiqueta salir_recta.
            dec k                   ; decrementamos k en uno.
            mov ax, k               ; copiamos variable k en el registro AX.
            cmp ax, 0               ; comparamos registro AX == 0.
            je fin_recta            ; si son iguales saltamos a etiqueta fin_recta.
            jmp bresenham_recta     ; de lo contrario saltamos a etiqueta bresenham_recta.
                                    
    fin_recta:                      ; etiqueta fin_recta.
        ret                         ; retornamos a procedimiento main.
recta endp                          ; fin de procedimiento recta.

direccion_x proc                        ; procedimiento direccion_x
    mov ax, delta_x                     ; copiamos variable delta_x en el registro AX.
    cmp ax, 0                           ; comparamos registro AX == 0.
    jge delta_x_positivo_direccion_x    ; si es mayor o igual, saltamos a etiqueta delta_x_positiva_direccion_x.
    jmp delta_x_negativo_direccion_x    ; de lo contrario saltamos a etiqueta delta_x_negativa_direccion_x.
            
    delta_x_positivo_direccion_x:       ; etiqueta delta_x_positivo_direccion_x.
        mov ax, x_add_1                 ; copiamos variable x_add_1 al registro AX.
        cmp ax, x_1                     ; comparamos registro AX con x_1, verificamos si llegamos a la coordenada x destino.
        je retorno_direccion_x          ; si son iguales saltamos a etiqueta retorno_direccion_x.
        inc ax                          ; incrementamos AX en uno (desplazamos a la derecha en el eje x). 
        cmp ax, 320                     ; comparamos AX con máximo según caracteristicas del modo de video.
        jg cambio_maximo_direccion_x    ; si es mayor, saltamos a etiqueta cambio_maximo_direccion_x.
        jmp suma_x_direccion_x          ; de lo contrario saltamos a etiqueta suma_x_direccion_x.
        
        cambio_maximo_direccion_x:      ; etiqueta cambio_maximo_direccion_x.
            mov ax, 320                 ; copiamos máximo valor de screen (320) al registro AX.

        jmp retorno_direccion_x         ; saltamos a etiqueta retorno_direccion_x.
           
    delta_x_negativo_direccion_x:       ; etiqueta delta_x_negativo_direccion_x.
        mov ax, x_add_1                 ; copiamos variable x_add_1 al registro AX.
        cmp ax, x_1                     ; comparamos registro AX con x_1, verificamos si llegamos a la coordenada x destino.
        je retorno_direccion_x          ; si son iguales saltamos a etiqueta retorno_direccion_x.
        dec ax                          ; decrementamos AX en uno (desplazamos a la izquierda en el eje x).
        cmp ax, 0                       ; comparamos AX con mínimo según características del modo de video.
        jl cambio_cero_direccion_x      ; si es menor saltamos a etiqueta cambio_cero_direccion_x.
        jmp suma_x_direccion_x          ; de lo contrario saltamos a etiqueta suma_x_direccion_x.
        
        cambio_cero_direccion_x:        ; etiqueta cambio_cero_direccion_x.
            mov ax, 0                   ; copiamos mínimo valor de screen (0) al registro AX.
        
    suma_x_direccion_x:                 ; etiqueta suma_x_direccion_x.
        mov x_add_1, ax                 ; copiamos valor del registro AX en la variable x_add_1.
    
    retorno_direccion_x:                ; etiqueta retorno_direccion_x.
        ret                             ; retornamos a procedimiento recta.
direccion_x endp                        ; fin de procedimiento direccion_x.

direccion_y proc                        ; procedimiento direccion_y.
    mov ax, delta_y                     ; copiamos valor la variable delta_y al registro AX.
    cmp ax, 0                           ; comparamos AX == 0.
    jge delta_y_positivo_direccion_y    ; si es mayor o igual saltamos a etiqueta delta_y_positivo_direccion_y.
    jmp delta_y_negativo_direccion_y    ; de lo contrario saltamos a etiqueta delta_y_negativo_direccion_y.
            
    delta_y_positivo_direccion_y:       ; etiqueta delta_y_positivo_direccion_y.
        mov ax, y_add_1                 ; copiamos variable y_add_1 al registro AX.
        cmp ax, y_1                     ; comparamos registro AX con y_1, verificamos si llegamos a la coordenada y destino.
        je retorno_direccion_y          ; si son iguales saltamos a etiqueta retorno_direccion_y.
        inc ax                          ; incrementamos AX en uno (desplazamiento hacia abajo en el eje y).
        cmp ax, 200                     ; comparamos AX con máximo según características del modo de video.
        jg cambio_maximo_direccion_y    ; si es mayor saltamos a etiqueta cambio_maximo_direccion_y.
        jmp suma_y_direccion_y          ; de lo contrario saltamos a etiqueta suma_y_direccion_y.
        
        cambio_maximo_direccion_y:      ; etiqueta cambio_maximo_direccion_y.
            mov ax, 200                 ; copiamos máximo valor de screen (200) al registro AX.

        jmp retorno_direccion_y         ; saltamos a etiqueta retorno_direccion_y.
           
    delta_y_negativo_direccion_y:       ; etiqueta_y_negativo_direccion_y.
        mov ax, y_add_1                 ; copiamos_variable y_add_1 al registro AX.
        cmp ax, y_1                     ; comparamos registro AX con y_1, verificamos si llegamos a la coordenada y destino.
        je retorno_direccion_y          ; si son iguales saltamos a etiqueta_retorno_direccion_y.
        dec ax                          ; decrementamos AX en uno (desplazamiento hacia arriba en el eje y).
        cmp ax, 0                       ; comparamos AX con mínimo según características del modo de video.
        jl cambio_cero_direccion_y      ; si es menor saltamos a etiqueta cambio_cero_direccion_y.
        jmp suma_y_direccion_y          ; de lo contrario saltamos a etiqueta suma_y_direccion_y.
        
        cambio_cero_direccion_y:        ; etiqueta cambio_cero_direccion_y
            mov ax, 0                   ; capiamos mínimo valor de screen (0) al registro AX.
        
    suma_y_direccion_y:                 ; etiqueta suma_y_direccion_y.
        mov y_add_1, ax                 ; copiamos valor del registro AX a la variable y_add_1.
    
    retorno_direccion_y:                ; etiqueta retorno_direccion_y.
        ret                             ; retorno al procedimiento recta.
direccion_y endp                        ; fin de procedimiento direccion_y.

variables:                              ; declaracion de variables.
    x_add_1 dw 0                            
    y_add_1 dw 0
    x_0 dw 0  ;0 ;9 ;0 ;0 ;0  ;10 ;10 ;0
    y_0 dw 0  ;0 ;0 ;0 ;9 ;9  ;0  ;9  ;0
    x_1 dw 0  ;9 ;0 ;0 ;0 ;10 ;0  ;0  ;10
    y_1 dw 0  ;0 ;0 ;9 ;0 ;0  ;9  ;0  ;9
    delta_x dw 0;x_1-x_0
    delta_y dw 0;y_1-y_0
    dos_delta_x dw 0
    dos_delta_y dw 0;2*delta_y
    dos_delta_y_menos_dos_delta_x dw 0;dos_delta_y - 2*delta_x    
    k dw 0
    p dw 0    
    dos dw 2
    
;    vector_inicio dw 0,0,14,7,10,9 
;    vector_termino dw 14,7,10,9,0,0
;    estrellas dw 3 

    vector_inicio dw 300,180,320,180
    vector_termino dw 321,201,320,200
    estrellas dw 2

    
    ; 0       1
    ; 0,0  -> 10,9  inc x, inc y ; deltax = 10, deltay = 9
    ; 10,9 -> 0,0   dec x, dec y ; deltax = -10, deltay = -9
    ; 10,0 -> 0,9   dec x, inc y ; deltax = -10, deltay = 9
    ; 0,9  -> 10,0  inc x, dec y ; deltax = 10, deltay = -9