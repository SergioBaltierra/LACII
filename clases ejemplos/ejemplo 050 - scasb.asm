; ejemplo 50, instrucción scasb
 
inicio:
    mov al, 'i'
    lea di, string
    mov cl, largo
    
comparar:
    repne scasb
    jz igual
    jnz noigual
    
noIgual:
    mov dx, 0
    jmp fin
    
igual:
    mov dx, 1
    jmp fin
    
fin:
    hlt

variables:                
    string db "aeiou $"
    largo db $-string