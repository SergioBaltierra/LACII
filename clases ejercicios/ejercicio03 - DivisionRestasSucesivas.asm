; ejemplo 3, clase 19 y 21 de agosto

; realizar una divisi�n con restas sucesivas.
; 9:3 -> 9-3 = 6-3 = 3-3 = 0, cociente = 3 y resto = 0

declaramos:             ; declaramos registros
    mov ax, dividendo   ; asignamos dividendo a registro AX
    mov bx, divisor     ; asignamos divisor a registro BX
    mov cx, 0           ; limpiamos contador (registro CX)
    cmp ax, bx          ; comprobamos que dividendo sea mayor que divisor
    jl cambiar          ; si dividendo es menor salta a etiqueta cambiar
    jge division        ; de lo contrario salta a etiqueta division

cambiar:
    xchg ax, bx         ; cambiamos dividendo por divisor y viceversa
    jmp division        ; saltamos a etiqueta division

division:               ; dividimos
    sub ax, bx          ; hacemos resta dividendo - divisor
    inc cx              ; incrementamos nuestro contador de restas
    
    cmp ax, bx          ; comparamos si al restar el dividendo >= divisor
    
    jge division        ; si dividendo >= divisor saltamos nuevamente a division
    jle resultado       ; de lo contrario saltamos a resultado
   
resultado:              ; resultado
    mov cociente, cx    ; nuestro cociente ser� la cantidad de restas que se realizaron y se contaron con CX
    mov resto, ax       ; el resto es el resultado de la �ltima resta realizada
    
fin:                    ; fin
    hlt                 ; detenemos ejecuci�n del ejercicio

constantes:                     ; declaraci�n de constantes
    dividendo equ 256;3;12;9    ; declaramos dividendo
    divisor equ 2;12;3;3        ; declaramos divisor

variables:                      ; declaraci�n de variables
    cociente dw 0               ; declaramos cociente
    resto dw 0                  ; declaramos resto
