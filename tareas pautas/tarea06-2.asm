; Tarea 06, búsqueda binaria
; Nombre Completo...
; RUN: ...

; Algoritmo: 
; La búsqueda binaria es un algoritmo recursivo que nos permite encontrar en un vector
; ordenado la posición de un número que se desea encontrar.

main proc                       ; procedimiento main.
    lea bx, vector              ; cargamos la dirección de memoria del vector en registro BX.
    call busqueda_binaria       ; llamamos a procedimiento busqueda_binaria.
    cmp bandera, -1             ; al retornar de procedimiento busqueda_binaria, comparamos bandera con -1.
    je no_encontrado            ; si son iguales, significa que el número a buscar no se encuentra en el vector.
       
    mov ax, mitad               ; de lo contrario, copiamos el valor de la variable mitad al registro AX.
    mov posicion, ax            ; copiamos el valor del registro AX a la variable posicion.
    xor dx, dx                  ; limpiamos el registro DX.
    div dos                     ; dividimos por dos el registro AX.
    cmp dx, 0                   ; comparamos el resto de la división con 0.
    je extraer_numero           ; si son iguales significa que la posicion es par y saltamos a etiqueta extraer_numero.
    dec posicion                ; de lo contrario decrementamos en uno para desplazarnos al byte mas alto de la celda mitad del vector.
    
    extraer_numero:             ; etiqueta extraer_numero.
        inc ax                  ; incrementamos AX en uno.
        mov posicion, ax        ; lo copiamos a variable posición para desplazarnos al byte mas bajo de la celda mitad del vector
        lea di, vector          ; copiamos la dirección del memoria de vector al registro DI.
        add di, mitad           ; agregamos la celda que contiene el valor encontrado en el registro DI.
        mov ax, [di]            ; extraemos la celda DI-ésima y lo copiamos al registro AX.
        mov numero, ax          ; copiamos el valor de AX en la variable numero.
        jmp salir               ; saltamos a etiqueta salir.
    
    no_encontrado:              ; etiqueta no_encontrado.
        mov numero, -1          ; copiamos el valor -1 a variable numero si no se encuentra el numero a buscar.
    
    salir:                      ; etiqueta salir.
        hlt                     ; parada de ejecución.
main endp                       ; fin de procedimiento main.

busqueda_binaria proc           ; procedimiento busqueda_binaria.
    calculo_mitad:              ; etiqueta calculo de la mitad.
        mov ax, fin             ; cargamos variable fin que contiene el largo del vector.
        mov dx, inicio          ; cargamos variable inicio que contiene el valor de la primera celda del vector.
        sub ax, dx              ; restamos fin-inicio.
        shr ax, 1               ; división rápida al registro AX con instrucción de desplazamiento a la derecha (fin-inicio)/2.
        mov dx, inicio          ; cargamos variable inicio que contiene el valor de la primera celda del vector.
        add ax, dx              ; realizamos la suma inicio + (fin-inicio)/2.
        mov mitad, ax           ; el resultado lo guardamos en la variable mitad.
        xor ax, ax              ; limpiamos el registro AX.
    
    if_1:                       ; if inicio > fin
        mov ax, fin             ; cargamos variable fin que contiene el largo del vector. 
        mov dx, inicio          ; cargamos variable inicio que contiene el valor de la primera celda del vector.
        cmp dx, ax              ; comparamos fin con inicio.
        ja return_1             ; si inicio > fin saltamos a etiqueta return_1.
        jmp if_2                ; de lo contrario saltamos a segundo if.
        
        return_1:               ; etiqueta return_1.
            mov posicion, 1     ; asignamos valor 1 a la variable posicion.
            neg posicion        ; negamos el valor posicion.
            neg bandera         ; negamos la bandera.
            ret                 ; retornamos donde se llamo a procedimiento busqueda_binaria.
            
    if_2:                       ; if vector[mitad] == encontrar.
        mov ax, mitad           ; asignamos el valor de la variable mitad al registro AX.
        xor dx, dx              ; limpiamos registro DX.
        div dos                 ; dividimos por dos el registro mitad almacenado en AX.
        cmp dx, 0               ; comparamos DX == 0.
        je comparar             ; si AX es par saltamos a comparar.
        dec mitad               ; de lo contrario decrementamos la variable mitad en 1.
        
        comparar:               ; etiqueta comparar.
            mov si, mitad       ; cargamos variable mitad a registro SI.
            mov ax, [bx+si]     ; extraemos celda BX+SI (vector[mitad] ==  AX) en registro AX.
            mov dx, buscar      ; copiamos número a buscar en registro DX.
            cmp ax, dx          ; comparamos AX con DX.
            je return_2         ; si el número a buscar es igual al de la posición BX+SI, saltamos etiqueta return_2. 
            jmp if_3            ; de lo contrario saltamos a etiqueta if_3.
        
        return_2:               ; etiqueta return_2.
            ret                 ; retornamos donde se llamo a procedimiento busqueda_binaria.
    
    if_3:                       ; etiqueta if_3 (vector[mitad] > encontrar).
        mov si, mitad           ; cargamos variable mitad a registro SI.
        mov ax, [bx+si]         ; extraemos celda BX+SI (vector[mitad] ==  AX) en registro AX.
        mov dx, buscar          ; copiamos número a buscar en registro DX.
        cmp ax, dx              ; comparamos AX con DX.
        ja return_3             ; si es mayor saltamos si esta por encima (no usar jg debido a que los números grandes los lee como si fuesen negativos).
        jmp else                ; de lo contrario saltamos a etiqueta else
        
        return_3:                   ; etiqueta return_3
            mov ax, mitad           ; copiamos valor mitad a registro AX.
            sub ax, 2               ; lo decrementamos en dos, esto porque mitad es de tipo dw por ende nos tenemos que mover dos celdas en vez de una.
            mov fin, ax             ; copiamos valor de AX en variable fin.
            call busqueda_binaria   ; llamamos a procedimiento busqueda_binaria recursivamente.
            ret                     ; retornamos donde se llamo a procedimiento busqueda_binaria.
    
    else:                           ; etiqueta else.
        return_4:                   ; return_4
            mov ax, mitad           ; copiamos valor mitad a registro AX
            add ax, 2               ; incrementamos en dos, esto porque mitad es de tipo dw por ende nos tenemos que mover dos celdas en vez de una.
            mov inicio, ax          ; copiamos valor AX en variable inicio.
            call busqueda_binaria   ; llamamos a procedimiento busquera_binaria recursivamente.
            ret                     ; retornamos donde se llamo a procedimiento busqueda_binaria.
busqueda_binaria endp               ; fin de procedimiento busqueda_binaria

variables:                          ; etiqueta variables
    buscar dw 279                   ; número a buscar.
    ;vector dw 1,2,3,4,5,6,7        ; vector
    ;vector dw 0,1,2,3,4,5,6,7
    vector dw 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279
    fin dw $-vector                 ; calculamos el largo del vector.
    inicio dw 0                     ; variable inicio valor por defecto 0.
    mitad dw 0                      ; variable mitad.
    dos dw 2                        ; variable dos.
    posicion dw 0                   ; variable posición, que contendra la posición del número a buscar.
    numero dw 0                     ; variable número, que contendra el número a buscar.
    bandera dw 1                    ; bandera, en caso de no encontrar el número a buscar.    