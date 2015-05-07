; Tarea 05, máximo par en un string.
; Nombre Completo...
; RUN: ...

; Algoritmo: 
; Dado un string de tamaño n, encuentre el par que más veces se repite en el string.
; donde el par se debe almacenar en un string al igual que la cantidad de veces.

inicio:             
    lea di, string      ; cargamos dirección de memoria del string en registro DI
    lea bx, string      ; cargamos dirección de memoria del string nuevamente, donde este registro lo usaremos.
    lea si, vector      ; cargamos vector, que almacenará el contador de pares.
    mov cl, largo       ; copiamos en CL el largo del string.
    mov iteracion, cl   ; copiamos a la variable iteracion el valor del registro CL.
    jmp for_j           ; saltamos a etiqueta for_j
    
    for_i:                  ; etiqueta for_i
        inc bx              ; incrementamos BX en uno, y nos desplazamos al siguiente par del string.
        dec iteracion       ; decrementamos la variable iteración, para buscar el siguiente par del string.
        cmp iteracion, 0    ; comparamos iteracion con el valor 0.
        je mayor            ; si iteracion == 0, saltamos a mayor.
        mov cl, largo       ; copiamos el valor de la variable largo al registro CL.
        lea di, string      ; cargamos dirección de memoria del string en registro DI.
        mov al, contador    ; cargamos contador al registro AL, que contienen todos los pares contados del string.
        mov [si], al        ; copiamos el valor del registro AL al celda SI-ésima del vector.
        inc si              ; incrementamos SI en uno.
        mov contador, 0     ; limpiamos la variable contador.
        
        for_j:              ; etiqueta for_j
            mov al, [bx]    ; copiamos valor de celda [BX] al registro AL
            scasb           ; comparamos el caracter AL con la posicion ES:DI (primer caracter del par a buscar)
            jz igual        ; si con iguales salta a etiqueta igual
            loop for_j      ; de lo contrario hacemos loop a for_j
            jmp for_i       ; al terminar de iterar saltamos a for_i
        
        igual:              ; etiqueta igual.
            mov al, [bx+1]  ; copiamos valor de la celda [BX+1] al registro AL.
            scasb           ; comparamos el caracter AL con la posición ES:DI (segunda caracter del par a buscar).
            jnz incrementar ; si son distintos saltamos a etiqueta incrementar.
            inc contador    ; de lo contrario, es un par que existe en el string e incrementamos en uno la variable contador.
        
        incrementar:        ; etiqueta incrementar.
            jmp for_j       ; saltamos a etiqueta for_j.
        
mayor:                  ; etiqueta mayor.
    lea bx, vector      ; cargamos dirección de vector en el registro BX.
    mov al, [bx]        ; copiamos el valor de la BX-ésima celda al registro AL, asumiendo que la primera celda de BX es el número mayor.
    inc bx              ; incrementamos el registro BX, para comparar desde la segunda celda del vector en adelante.
    mov cl, largo       ; copiamos el largo de la variable al registro CL.
    xor dl, dl          ; limpiamos el registro DL, que será el índice donde se encuentra el par que mas veces se repite. 
    
    comparar:           ; etiqueta comparar.
        inc dl          ; incrementamos DL.
        cmp al, [bx]    ; comparamos el valor del registro AL con la BX-ésima celda de vector.
        jl cambiar      ; si es mayor saltamos a etiqueta cambiar
        inc bx          ; de lo contrario incrementamos BX en uno, siguiendo con la celda siguiente del vector.
        loop comparar   ; hacemos loop a la etiqueta comparar.
        mov maximo, al  ; el valor del registro AL, lo copiamos a la variable maximo.
        jmp extraerPar  ; saltamos a etiqueta extraerPar.
    
    cambiar:            ; etiqueta cambiar.
        mov al, [bx]    ; copiamos valor de la celda BX-ésima al registro AL, que es nuestro nuevo número mayor.
        inc bx          ; incrementamos BX en uno.
        mov indice, dl  ; copiamos el valor del registro DL en la variable indice.
        loop comparar

extraerPar:             ; etiqueta extraer par.
    lea di, string      ; cargamos dirección de memoria de string en registro DI.
    lea si, vector      ; cargamos dirección de memoria de vector en registro SI.
    lea bx, par         ; cargamos dirección de memoria de string par en registro BX.
    mov al, [si]        ; copiamos la SI-ésima celda de vector en registro AL, el cual contiene el contador.
    cmp al, maximo      ; comparamos el registro AL con la variable maximo, buscamos la posicion donde esta contenido el maximo par.
    je sacar            ; si es igual, encontramos al vector y que corresponde la misma ubicación tanto en vector como en string.
                                          
    sacar:
        xor cx, cx      ; limpiamos el registro CX.
        mov cl, indice  ; copiamos indice en registro CL.
        add di, cx      ; copiamos en registro DI el valor de CL, nos trasladamos a la ubicación de la primera letra del maximo par.
        mov dh, [di]    ; copiamos la primera letra del par en registro DH.        
        mov dl, [di+1]  ; copiamos la segunda letra del par en registro DL.
        mov [bx], dh    ; copiamos la primera letra en la primera celda del string par.
        mov [bx+1], dl  ; copiamos la segunda letra en la primera celda del string par.
        jmp fin  

    fin:                    ; etiqueta fin.
        hlt                 ; parada de ejecución.    

variables:                                      ; declaración de variables.         
    ;string db "miami"                          ; string a buscar máximo par.
    ;string db "abradacadabrab"
    string db "ciclopentanoperhidrofenantreno"
    ;string db "paralelepipedo"
    largo db $ - string                         ; calculamos el largo del string.
    vector db largo dup(?)                      ; creamos el vector vector que contendrá la cuenta de pares.
    par db 2 dup(?)                             ; string par que almacenará el máximo par.
    contador db 0                               ; variable contador.
    iteracion db 0                              ; variable iteración.
    maximo db 0                                 ; variable maximo, que almacena el maximo par.
    indice db 0                                 ; variable indice.