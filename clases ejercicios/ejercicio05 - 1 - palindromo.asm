; Verificamos si un string es un palindromo.
; Ejemplos: Ana, arenera, arepera, anilina, ananá, Malayalam, Neuquén, Oruro, oso, radar, 
;reconocer, rotor, salas, seres, somos y sometemos.

declarar:               ; etiquet declarar
    mov ax, 0           ; inicializamos ax
    lea bx, string      ; cargamos dirección de memoria string en bx
    lea di, string      ; cargamos dirección de memoria string en DI
    mov si, largo       ; declaramos largo del string para verificar desde la última celda a la primera
    dec si
    mov cx, largo       ; declaramos la cantidad de iteraciones para el loop    
    jmp inicio          ; saltamos a etiqueta inicio

inicio:                 ; declaramos etiqueta inicio
    mov al, [bx + si]   ; copiamos valor de la ultima celda del string al registro AL
    scasb               ; comparamos celda ES:DI con registro AL si son iguales (ZF = 1) o no (ZF = 0)
    jnz noIguales       ; si es falso saltamos a etiqueta noIguales (ZF = 0)
    dec si              ; decrementamos registro puntero SI
    loop inicio         ; hacemos loop etiqueta inicio
    ;jmp iguales        ; saltamos etiqueta iguales al descartar si no era palindromo el string
    
    iguales:            ; declaramos etiqueta iguales
        mov dx, 1       ; copiamos valor 1 (verdadero) en registro DX
        jmp fin         ; saltamos a etiqueta fin
    
    noIguales:              ; declaramos etiqueta noIguales
        mov dx, 0           ; copiamos valor 0 (falso) en registro DX
        jmp fin             ; saltamos a etiqueta fin
    
fin:                    ; etiqueta fin    
    hlt                 ; parada de ejecución

variables:                              ; etiqueta variables
    string db "reconocer"               ; declaramos string a verificar si es palindromo
    ;string db "arenera"
    ;string db "oso"
    ;string db "solas"
    largo dw $ - string     ; calculamos la cantidad de iteraciones
    ;iteraciones dw largo
    ;largo db (iteraciones-1)            ; calculamos el largo del string
    