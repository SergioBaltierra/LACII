; Ejemplo 4, clase 26 y 28 de agosto

; Separa un arreglo en dos subarreglos, donde un subarreglo es de números pares 
; y otro subarreglo es de números impares

declaramos:         ; etiqueta declaramos
    mov ax, 0       ; igualamos registro AX = 0
    mov bx, 0       ; igualamos registro BX = 0
    mov cx, 0       ; igualamos registro CX = 0
    mov cl, largo   ; igualamos registro CL = largo (cantidad de iteraciones y valor calculado en variables)
    mov dx, 0       ; igualamos registro DX = 0
    mov si, 0       ; igualamos registro SI = 0
    mov di, 0       ; igualamos registro DI = 0
    jmp cargamos    ; saltamos a etiqueta cargamos
    
cargamos:                   ; etiqueta cargamos
    lea bx, arreglo         ; cargamos dirección de memoria a registro BX de la primera celda del arreglo que contiene todos los números
    lea di, arregloPar      ; cargamos dirección de memoria a registro DI de la primera celda del arreglo de los números pares
    lea si, arregloImpar    ; cargamos dirección de memoria a registro SI de la primera celda del arreglo de los números impares
                                                                                                   
leeArreglo:             ; etiqueta leeArreglo
    cmp cx, 0           ; comparamos CX con 0 (cantidad de iteraciones)
    je fin              ; si CX == 0 saltamos a fin
    dec cx              ; de lo contrarios decrementamos CX en uno
    
    mov ah, 0           ; limpiamos registro AH (registro que contiene el resto de la división)
    mov al, [bx]        ; asignamos al registro AL el valor de la BX-ésima celda del arreglo
    inc bx              ; incrementamos BX para avanzar a la siguiente celda
    push ax             ; copiamos el valor de AX en la pila para almacenarlo y usarlo posteriormente (en esta caso usamos la pila como auxiliar)
    div dos             ; dividimos por dos el valor de la ésima celda del arreglo que se asignó en AX
    
    cmp ah, 0           ; comparamos el resto de la división con cero
    je par              ; si son iguales, AX es par y saltamos a etiqueta par
    jne impar           ; de lo contrario es impar y saltamos a etiqueta impar

par:                    ; etiqueta par
    pop ax              ; extraemos valor de la pila que almacenamos anteriormente
    mov [di], al        ; copiamos el valor del registro AL en el arreglo par cuyo registro de desplazamiento es DI
    inc di              ; incrementamos DI en uno
    jmp leeArreglo      ; saltamos a etiqueta leeArreglo
    
impar:                  ; etiqueta impar
    pop ax              ; extraemos valor de la pila que almacenamos anteriormente
    mov [si], al        ; copiamos el valor del registro AL en el arreglo par cuyo registro de desplazamiento es SI
    inc si              ; incrementamos SI en uno
    jmp leeArreglo      ; saltamos a etiqueta leeArreglo
    
fin:                    ; etiqueta fin
    hlt                 ; parada de ejecución

variables:              ; declaración de variables
    arreglo db 1,2,3,4,5,6,7,8,9,10     ; arreglo que contiene los valores a separar
    largo db $ - arreglo                ; calculamos el valor del arreglo y lo almacenamos en variable largo
       
    arregloImpar db largo dup(0)        ; declaramos arreglo arregloImpar con n = largo duplicado en 0
    arregloPar db largo dup(0)          ; declaramos arreglo arregloPar con n = largo duplicado en 0

    dos db 2                            ; variable dos del mismo valor que su nombre