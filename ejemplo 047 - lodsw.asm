; ejemplo 47, instrucción lodsw
                                                                                                                
declarar:
    lea si, string
    mov cx, largo

cargar:
    rep lodsw

fin:
    hlt

variables:
    string dw "Hola Mundo $"
    largo dw ($-string)/2                                                         