; Tarea 03, camino más corto.
; Nombre Completo...
; RUN: ...
                               
; Algoritmo: EL CAMINO MÁS CORTO.
;   Dado un número N, tiene que llegar a él recorriendo el camino más corto, este camino se hace de la siguiente manera:
;
;	A[i+1]=A[i]*2 o A[i+1]=A[i]+1
;
;	Comenzando A[i]=1, donde i = 1.	
;
; Obs: usamos técnica del laberinto, comenzamos desde la meta y llegamos al inicio.

declaramos:             ; etiqueta declarar.
    mov ax, 0           ; asignamos al registro AX valor 0.

while:                      ; etiqueta while
    inc indice              ; incrementamos indice, debido a que A[1] = 1 es un paso.
    cmp antecesor, 1        ; comparamos si el numero que queremos llegar es el que estamos posicionados.
    je fin                  ; si son iguales saltamos a etiqueta fin.
   
    mov ax, antecesor       ; de lo contrario copiamos al registro AX el valor de antecesor.
    mov aux, ax             ; copiamos a la variable auxiliar aux el valor de AX.
    div dos                 ; verificamos si es par dividiendo por dos a valor almacenado en registro AX, paso A[i+1]=A[i]*2
    cmp dx, 0               ; comparamos el resto con 0.
    je division             ; si DX == 0 (resto == 0) es par y saltamos a etiqueta división.
    
    xor dx, dx              ; de lo contraior limpiamos registro DX haciendo un XOR.
    mov ax, aux             ; copiamos valor almacenado en variable auxiliar. 
    dec ax                  ; decrementamos AX en uno, paso A[i+1]=A[i]+1.
    mov antecesor, ax       ; copiamos nuevo valor a la variable antecesor.
    jmp while               ; saltamos a etiqueta while.   
    
    division:               ; etiqueta division.
        mov antecesor, ax   ; copiamos nuevo valor a la variable antecesor.
        jmp while           ; saltamos a etiqueta while.
    
fin:                        ; etiqueta fin.
   hlt                      ; paramos ejecución.
          
constantes:                 ; etiqueta constantes.
    numero equ 31           ; constante número cuyo valor queremos buscar.
    dos dw 2                ; constante dos 
    
variables:                  ; etiqueta variables.
    indice dw 0             ; variable indice, donde almacenamos los pasos que daremos.
    antecesor dw numero     ; variable antecesor, donde almacenamos temporalmente el valor del paso dado, comenzamos desde el numero.
    aux dw 0                ; variable aux, usaremos para almacenar el paso previo y así ver que siguiente paso nos sirve.