; ejemplo 46, instrucci�n lodsb
 
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