; Tarea 03, resolver expresi�n.
; Nombre Completo...
; RUN: ...
                               
; Algoritmo: EL CAMINO M�S CORTO.
;   Dado un n�mero N, tiene que llegar a �l recorriendo el camino m�s corto, este camino se hace de la siguiente manera:
;
;	A[i+1]=A[i]*2 o A[i+1]=A[i]+1
;
;	Comenzando A[i]=1, donde i = 1.	
                               
declaramos:             ; etiqueta declarar.
    mov ax, 0           ; asignamos al registro AX valor 0.

while:                      ; etiqueta while
    inc indice              ; incrementamos indice, debido a que A[1] = 1 es un paso.
    cmp antecesor, numero   ; comparamos si el numero que queremos llegar es el que estamos posicionados.
    je fin                  ; si son iguales saltamos a etiqueta fin.
   
    mov ax, antecesor       ; de lo contrario copiamos al registro AX el valor de antecesor.
    mov aux, ax             ; copiamos a la variable auxiliar aux el valor de AX.
    mul dos                 ; multiplicamos AX por dos ( paso : A[i+1]=A[i]*2).
    cmp ax, numero          ; comparamos si el paso A[i+1]=A[i]*2 llega al n�mero.
    jle multiplicacion      ; si es menor o igual, saltamos a la etiqueta multiplicaci�n.
    
    mov ax, aux             ; de lo contrario recuperamos numero almancenado en la variable auxiliar aux al registro AX.
    inc ax                  ; incrementamos AX en 1 (paso A[i+1]=A[i]+1).
    cmp ax, numero          ; comparamos si el paso A[i+1]=A[i]+1 llega al n�mero.
    jle suma                ; si es menor o igual, saltamos a la etiqueta suma
    
    multiplicacion:         ; etiqueta multiplicaci�n.
        mov antecesor, ax   ; copiamos el valor del paso A[i+1]=A[i]*2 a la variable antecesor.
        jmp while           ; saltamos a etiqueta while.
        
    suma:                   ; etiqueta suma.
        mov antecesor, ax   ; copiamos el valor del paso A[i+1]=A[i]+1 a la variable antecesor.
        jmp while           ; saltamos a etiqueta while.
 
fin:                        ; etiqueta fin.
   hlt                      ; paramos ejecuci�n.
          
constantes:                 ; etiqueta constantes.
    numero equ 30;17        ; constante n�mero cuyo valor queremos buscar.
    dos dw 2                ; constante dos 
    
variables:                  ; etiqueta variables.
    indice dw 0             ; variable indice, donde almacenamos los pasos que daremos.
    antecesor dw 1          ; variable antecesor, donde almacenamos temporalmente el valor del paso dado, comenzamos desde 1.
    aux dw 0                ; variable aux, usaremos para almacenar el paso previo y as� ver que siguiente paso nos sirve.

