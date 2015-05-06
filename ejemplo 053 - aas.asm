declaramos:
    mov al, numero01
    mov bl, numero02

operacion:
    sub al, bl

ajuste:
    aas

fin:
    hlt

variables:
    numero01 db '8'
    numero02 db '9'