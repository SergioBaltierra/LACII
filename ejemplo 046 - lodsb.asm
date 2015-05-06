; ejemplo 46, instrucción lodsb
 
declarar:
    lea si, string
    mov cl, largo
    
cargar:
    rep lodsb
    
fin:
    hlt
    
variables:
    string db "Hola Mundo $"
    largo db $-string