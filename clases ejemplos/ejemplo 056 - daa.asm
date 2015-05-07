declaramos:
    mov al, numero01
    mov bl, numero02
    
operacion:
    add al, bl
    
ajuste:
    daa
    
fin:
    hlt
    
variables:
    numero01 db 35h
    numero02 db 48h   