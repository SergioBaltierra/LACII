declaramos:
    mov al, numero01
    mov bl, numero02

operacion:
    mul bl

ajuste:
    aam

fin:
    hlt
    
variables:
    numero01 db 05h
    numero02 db 06h  