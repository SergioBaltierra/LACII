; ejercicio 9, divide un vector en dos subvectores de n�meros primos y n�meros no primos.

main proc                           ; procedimiento main.
    declaramos:                     ; etiqueta declaramos.                                            
        mov bx, ds:divisor          ; copiamos valor al registro BX mediante modo directo y absoluto del dividor.        
        mov cx, ds:largo            ; copiamos el largo del vector al registro CX que usaremos como contador mediante modo directo y absoluto.       
        lea si, vector              ; copiamos direcci�n de memoria del vector al registro puntero si.        
        mov ax, [si]                ; copiamos la primera celda al registro AX para despu�s copiarla a la variable numero.
        cmp ax, 1                   ; verificamos que el primer n�mero es 1.
        je NoPrimo                  ; si es 1 saltamos a etiqueta NoPrimo.
        mov ds:numero, ax           ; copiamos valor al registro AX mediante modo directo y absoluto.
        jmp calcular                ; saltamos a la etiqueta calcular.
    
    calcular:                       ; etiqueta calcular.
        push ax                     ; almacenamos el n�mero en la pila antes de verificar si es primo, respaldo.
        div bx                      ; dividimos el n�mero por un divisor.
        cmp dx, 0                   ; comparamos que el cociente sea cero.
        je verificar                ; si es cero saltamos a etiqueta verificar.
        mov ax, ds:numero           ; si no es cero copiamos nuevamente el valor de numero con modo directo y absoluto.
        inc bx                      ; incrementamos el divisor bx en uno.
        mov dx, 0                   ; limpiamos el registro dx.
        jmp calcular                ; saltamos a la etiqueta calcular.
    
    verificar:                      ; etiqueta verificar.
        pop ax                      ; extraemos el valor de numero a verificar si es primo de la pila.
        cmp ax, bx                  ; comparamos si el n�mero es igual al divisor (propiedad de los primos).
        je SiPrimo                  ; si son iguales salta a etiqueta SiPrimo.
        jne NoPrimo                 ; de lo contrario salta a etiqueta NoPrimo.
    
    SiPrimo:                        ; etiqueta SiPrimo.
        call es_primo               ; llamamos al procedimiento es_primo, donde almacenamos el n�mero en el vectorPrimos
        dec cx                      ; decrementamos contador CX en uno.
        cmp cx, 0                   ; si CX = 0 llegamos al �ltimo n�mero del vector.
        je fin                      ; si son iguales saltamos a la etiqueta fin.
        jmp calcular                ; saltamos a etiqueta calcular.
    
    NoPrimo:                        ; etiqueta NoPrimo.    
        call no_es_primo            ; llamamos al procedimiento no_es_primo, donde almacenamos el n�mero en el vectorNoPrimos
        dec cx                      ; decrementamos contador CX en uno.
        cmp cx, 0                   ; si CX = 0 llegamos al �ltimo n�mero del vector.
        je fin                      ; si son iguales saltamos a la etiqueta fin.  
        jmp calcular                ; saltamos etiqueta calcular.
    
    fin:                            ; etiqueta fin.
        hlt                         ; parade de ejecuci�n.
main endp                       ; fin de procedimiento main

es_primo proc                   ; procedimiento es_primo
    lea di, vectorPrimos        ; cargamos la direcci�n de memoria de vectorPrimos
    add di, indicePrimo         ; sumamos el indicePrimo al registro DI con el fin de desplazarnos a la celda disponible para almacenar el numero primo encontrado.
    mov [di], ax                ; copiamos el valor verificado en el vector cuyo registro DI mediante direccionamiento indirecto con �ndice.   
    inc ax                      ; incrementamos el registro AX que ser� el siguiente n�mero a verificar si es primo.
    mov ds:numero, ax           ; copiamos el registro AX en la variable numero mediante modo directo y absoluto.
    mov bx, ds:divisor          ; copiamos la variable divisor al registro BX.  
    add indicePrimo, 2          ; incrementamos en dos el indicePrimo, que ser� nuestra pr�xima celda a guardar un nuevo n�mero primo encontrado.
    ret                         ; retonamos donde se invoco al procedimiento es_primo
es_primo endp                   ; fin de procedimiento es_primo                                                                              

no_es_primo proc                ; procedimiento no_es_primo
    lea di, vectorNoPrimos      ; cargamos la direcci�n de memoria de vectorNoPrimos
    add di, indiceNoPrimo       ; sumamos el indiceNoPrimo al registro DI con el fin de desplazarnos a la celda disponible para almacenar el numero no primo encontrado.
    mov [di], ax                ; copiamos el valor verificado en el vector cuyo registro DI mediante direccionamiento indirecto con �ndice.
    inc ax                      ; incrementamos registro ax en uno.
    mov ds:numero, ax           ; copiamos el registro ax en la variable numero con modo directo y absoluto.
    mov bx, ds:divisor          ; copiamos la variable divisor al registro bx mediante modo directo y absoluto.
    add indiceNoPrimo, 2        ; incrementamos en dos el indiceNoPrimo, que ser� nuestra pr�xima celda a guardar un nuevo n�mero no primo encontrado.
    ret                         ; retonamos donde se invoco al procedimiento no_es_primo
no_es_primo endp                ; procedimiento no_es_primo

variables:                               ; etiqueta variable.                                
    ;vector dw 1,2,3,4,5,6,7,8,9,10       ; vector a dividir
    vector dw 600,601,602,603,604,605
    largo dw ($-vector)/2                ; calculamos el largo del vector
    vectorPrimos dw largo dup(0)         ; declaramos vectorPrimos de tama�o largo duplicado con valores ceros de tipo dw.
    vectorNoPrimos dw largo dup(0)       ; declaramos vectorNoPrimos de tama�o largo duplicado con valores ceros de tipo dw.
    numero dw 0                          ; declaramos variable numero con valor 2 de tipo dw.
    divisor dw 2                         ; declaramos variable divisor con valor 2 de tipo dw.    
    indicePrimo dw 0                     ; variable indicePrimo que almacenar� los �ndices del vectorPrimo seg�n vaya encontrando n�meros primos.
    indiceNoPrimo dw 0                   ; variable indiceNoPrimo que almacenar� los �ndices del vectorNoPrimo seg�n vaya encontrando n�meros no primos.