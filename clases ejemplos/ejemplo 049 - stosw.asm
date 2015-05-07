; ejemplo 49, instrucción stosw
 
inicio:
    mov ax, palabra
    lea di, string
    mov cx, largo

almacenar:
    rep stosw

cargar:
    mov ax, 0
    lea bx, string
    mov cx, largo

leer:
    mov ax, [bx]
    add bx, 2
    loop leer

fin:
    hlt

variables:
    palabra dw "ab"
    string dw 4 dup(?)
    largo dw ($-string)/2