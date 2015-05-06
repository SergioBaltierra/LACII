; ejemplo 42, instrucción movsb 
 
cargar:
    lea si, string01
    lea di, string02
    
copiamos:
    mov cl, largo
    rep movsb

resultados:
    lea bx, string02
    mov cl, largo
    
leemos:
    mov al, [bx]
    inc bx
    loop leemos

fin:
    hlt
    
variables:
    string01 db 'a','e','i','o','u'
    largo db $-string01
    string02 db largo dup(?)