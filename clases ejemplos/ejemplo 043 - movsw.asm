; ejemplo 43, instrucción movsw
 
inicio:
    lea si, string01
    lea di, string02
    mov cx, largo

copiamos:
    rep movsw

cargamos:
    lea bx, string02
    mov cx, largo

leer:
    mov ax, [bx]
    add bx, 2
    loop leer

fin:
    hlt

variables:
    string01 dw 'a','e','i','o','u'
    largo dw ($ - string01)/2
	string02 dw largo dup(?)