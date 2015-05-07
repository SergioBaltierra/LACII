; ejemplo 40, escribir en un string 

iniciar:
    mov ax, 0
    lea bx, string01 
    jmp leer

leer:
    mov al, 'H'
    mov [bx+si], al
    inc si
    
    mov al, 'o'
    mov [bx+si], al
    inc si
    
    mov al, 'l'
    mov [bx+si], al
    inc si

    mov al, 'a'
    mov [bx+si], al
    inc si
    
    mov al, ' '
    mov [bx+si], al
    inc si
    
    mov al, 'M'
    mov [bx+si], al
    inc si
    
    mov al, 'u'
    mov [bx+si], al
    inc si
    
    mov al, 'n'
    mov [bx+si], al
    inc si
    
    mov al, 'd'
    mov [bx+si], al
    inc si
    
    mov al, 'o'
    mov [bx+si], al
    inc si

    mov al, ' '
    mov [bx+si], al
    inc si
    
    mov al, '$'
    mov [bx+si], al
    inc si

    jmp fin

fin:
    hlt

declarar:
    string01 db 12 dup(0) ;"Hola Mundo $"