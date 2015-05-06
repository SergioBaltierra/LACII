; ejemplo 44, instrucción compsb
 
carga:
    lea si, string01
    lea di, string02
    mov cl, largo
    
compara:
    repe cmpsb
    jz iguales
    jnz noIguales
    
iguales:    
    mov ax, 1 ; verdadero
    jmp fin
    
noIguales:
    mov ax, 0 ; falso
    jmp fin
    
fin:
    hlt
    
variables:
    string01 db "string 01 $"
    string02 db "string 02 $"
    largo db $-string02   