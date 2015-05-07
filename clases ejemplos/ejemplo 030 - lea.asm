cargar :
    lea bx, palabra
    mov ax, [bx]

fin:
    hlt

variables:
    palabra dw 1234h