; ejemplo 48, instrucción stosb
 
inicio:
    mov al, 'a'
    lea di, string
    mov cl, largo
    
almacenamos:
    rep stosb
    
cargar:
    mov al, 0
    lea bx, string
    mov cl, largo
    
leer:
    mov al, [bx]
    inc bx   
    loop leer
    
fin:
    hlt
    
variables:
    string db 4 dup(?)
    largo db $-string