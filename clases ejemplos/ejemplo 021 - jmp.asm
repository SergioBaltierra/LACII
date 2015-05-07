; ejemplo 21, instrucciones jmp

jmp declarar

funcion:
    add ax, bx
    hlt

declarar:
    mov ax, 10
    mov bx, 12
    jmp funcion