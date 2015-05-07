; ejemplo 39, manejo de caracteres.

iniciamos:
    lea bx, caracteres
    mov si, 0
    jmp leemos

leemos:
    mov ch, [bx+si]
    inc si
    mov cl, [bx+si]
    inc si
    mov dh, [bx+si]
    inc si
    mov dl, [bx+si]
    jmp fin
    
fin:
    hlt

declaramos:
    caracteres db 'a','b','c','d'