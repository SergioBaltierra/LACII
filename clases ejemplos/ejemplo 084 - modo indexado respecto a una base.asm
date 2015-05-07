; ejemplo 84, modo indexado respecto a una base

mov bx, 10
mov di, 10
mov dato, 4h

mov [bx+di+dato], 1

mov al, 0
mov al, [bx+di+dato]

mov dl, 0
mov dl, ds:bx+di+dato

variable:
    dato db 0