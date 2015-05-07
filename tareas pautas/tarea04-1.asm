; Tarea 04, sucesión de padovan
; Nombre Completo...
; RUN: ...

; Algoritmo: calcula la sucesión de Padovan con la siguiente fórmula
;   a(n) = a(n-2) + a(n-3)
;  	1, 0, 0, 1, 0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12, 16, 21, 28, 37, 49, 65, 86, 114, 151, 200, 265, 351, 
;   465, 616, 816, 1081, 1432, 1897, 2513, 3329, 4410, 5842, 7739, 10252, 13581, 17991, 23833, 31572, 41824, 55405

declaramos:         ; declaramos registros.
    mov ax, 0       ; limpiamos registro AX = 0.
    mov bx, 0       ; limpiamos registro BX = 0.
    mov cx, 0       ; limpiamos registro CX = 0.
    mov di, 0       ; limpiamos registro DI = 0.
    jmp cargamos    ; saltamos a etiqueta cargamos.
    
cargamos:                       ; etiqueta cargamos.
    lea di, sucesionPadovan     ; cargamos arreglo sucesionPadova en registro DI.
    mov [di], 1                 ; copiamos valor a(0)=1.
    mov [di+2], 0               ; copiamos valor a(1)=0.
    mov [di+4], 0               ; copiamos valor a(2)=0.
    add di, 6                   ; incrementamos di en 6 (para llegar a a(3)).
    mov cx, largo               ; copiamos valor de la variable largo que corresponde al largo de arreglo en el registor CX.
    jmp calculoSucesion         ; saltamos a etiqueta calculoSucesion.

calculoSucesion:                ; calculo de sucesion.
    mov ax, [di-4]              ; extraemos valor de la celda a(n-2) en el registro AX.
    mov bx, [di-6]              ; extraemos valor de la celda a(n-3) en el registro BX.
    add ax, bx                  ; sumamos registros AX y BX, que corresponden a a(n-2) y a(n-3) respectivamente.
    mov [di], ax                ; copiamos valor del registro AX en la celda di-esima (a(n) = a(n-2) + a(n-3)).
    add di, 2                   ; incrementamos di en dos.
    loop calculoSucesion        ; iteramos a etiqueta calculoSucesion.
             
fin:                            ; etiqueta fin.
    hlt                         ; parada de ejecución.

variables:                                  ; declaración de variables.
    sucesionPadovan dw 46 dup(0)            ; creamos arreglo de tipo DW que contendra los 46 valores de la sucesión de padovan.
    largo dw ($ - sucesionPadovan)/2 - 3    ; calculamos el largo del arreglo y sacando los 3 primeros valores que serán asignados en etiqueta cargamos.