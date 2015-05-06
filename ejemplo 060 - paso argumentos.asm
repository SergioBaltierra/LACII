inicio:
    mov al, numero01
    mov bl, numero02

call procedimiento
call procedimiento
call procedimiento
call procedimiento
call fin

procedimiento proc
    mul bl
    ret
procedimiento endp

fin proc
    hlt
fin endp   

variables:
    numero01 db 1
    numero02 db 2