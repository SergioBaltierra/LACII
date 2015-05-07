; ejercicio 6, suma de dos vectores en codificaci�n BCD desempaquetados

inicio:
    lea si, vector01	; cargamos vector01.
    lea di, vector02	; cargamos vector02.
    lea bx, vector03	; cargamos vector03, que contendr� el resultado final.
    mov al, largo		; copiamos el largo a registro AX.
    dec ax 				; decrementamos en uno, porque largo es 4 celda pero comienza desde 0.
    add si, ax 			; sumamos valor de AX en SI, as� nos trasladamos a la posici�n final de la celda.
    add di, ax 			; sumamos valor de AX en DI, as� nos trasladamos a la posici�n final de la celda.
    add bx, ax 			; sumamos valor de AX en BX, as� nos trasladamos a la posici�n final de la celda.
    mov cl, largo		; copiamos valor de largo al registro CX, el cual lo usaremos para iterar.
    
suma:
    mov al, [si]		; copiamos el valor de la celda, desde la �ltima hasta la primera, del vector01 en el registro AL.
    mov dl, [di] 		; copiamos el valor de la celda, desde la �ltima hasta la primera, del vector02 en el registro DL.
    adc al, dl 			; sumamos con instrucci�n adc, en caso de haber sumar con acarreo.
    aaa					; realizamos ajuste con instrucci�n AAA para que el resultado est� expresado en notaci�n BCD desempaquetada.
    mov [bx], al 		; copiamos el resultado de la suma en el vector03 que contiene el resultado.
    dec si 				; decrementamos en uno el registro SI, as� nos desplazamos por el vector01 de derecha a izquierda.
    dec di 				; decrementamos en uno el registro DI, as� nos desplazamos por el vector02 de derecha a izquierda.
    dec bx 				; decrementamos en uno el registro BX, as� nos desplazamos por el vector03 de derecha a izquierda.
    loop suma 			; loop a suma.
    
fin:
    hlt 				; paramos ejecuci�n.

variables:
    vector01 db "01234" 		; declaramos vector01 con codificaci�n BCD desempaquetada.
    vector02 db "56789" 		; declaramos vector02 con codificaci�n BCD desempaquetada.
    largo db $-vector02			; calculamos el largo del vector02.
    vector03 db largo dup(0)    ; declaramos vector03 con valores 0.