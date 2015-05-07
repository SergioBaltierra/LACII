; ejercicio 6, suma de dos vectores en codificación BCD desempaquetados

inicio:
    lea si, vector01	; cargamos vector01.
    lea di, vector02	; cargamos vector02.
    lea bx, vector03	; cargamos vector03, que contendrá el resultado final.
    mov al, largo		; copiamos el largo a registro AX.
    dec ax 				; decrementamos en uno, porque largo es 4 celda pero comienza desde 0.
    add si, ax 			; sumamos valor de AX en SI, así nos trasladamos a la posición final de la celda.
    add di, ax 			; sumamos valor de AX en DI, así nos trasladamos a la posición final de la celda.
    add bx, ax 			; sumamos valor de AX en BX, así nos trasladamos a la posición final de la celda.
    mov cl, largo		; copiamos valor de largo al registro CX, el cual lo usaremos para iterar.
    
suma:
    mov al, [si]		; copiamos el valor de la celda, desde la última hasta la primera, del vector01 en el registro AL.
    mov dl, [di] 		; copiamos el valor de la celda, desde la última hasta la primera, del vector02 en el registro DL.
    adc al, dl 			; sumamos con instrucción adc, en caso de haber sumar con acarreo.
    aaa					; realizamos ajuste con instrucción AAA para que el resultado está expresado en notación BCD desempaquetada.
    mov [bx], al 		; copiamos el resultado de la suma en el vector03 que contiene el resultado.
    dec si 				; decrementamos en uno el registro SI, así nos desplazamos por el vector01 de derecha a izquierda.
    dec di 				; decrementamos en uno el registro DI, así nos desplazamos por el vector02 de derecha a izquierda.
    dec bx 				; decrementamos en uno el registro BX, así nos desplazamos por el vector03 de derecha a izquierda.
    loop suma 			; loop a suma.
    
fin:
    hlt 				; paramos ejecución.

variables:
    vector01 db "01234" 		; declaramos vector01 con codificación BCD desempaquetada.
    vector02 db "56789" 		; declaramos vector02 con codificación BCD desempaquetada.
    largo db $-vector02			; calculamos el largo del vector02.
    vector03 db largo dup(0)    ; declaramos vector03 con valores 0.