; ejercicio 8, multiplicaci�n r�pida con dos n�meros usando instrucci�n de desplazamiento

; observaci�n realiza la siguiente multiplicaci�n 123*36 donde el segundo multiplicando (36) 
; tiene que ser descomponido en suma de n�meros de potendia de dos, es decir 36 = 2^5 + 2^2

main proc
    mov ax, numero_01
    mov bx, ax
    shl ax, 5
    shl bx, 2                      
    add ax, bx
main endp

variables:
    numero_01 dw 123
    