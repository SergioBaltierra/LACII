; ejemplo 51, instrucción scasw
 
inicio:
    mov ax, "oi"
    lea di, string
	mov cx, largo

comparar:
    repne scasw
    jz igual
    jnz noIgual

noIgual:
    mov dx, 0
    jmp fin
                                                                                        
igual:
    mov dx, 1
    jmp fin

fin:
    hlt

variables:
    string dw "aeiou $"
    largo dw ($-string)/2