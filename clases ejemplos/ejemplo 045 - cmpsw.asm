; ejemplo 45, instrucción cmpsw
 
cargamos:
    lea si, string01
    lea di, string02
    mov cx, largo

comparamos:
    repe cmpsw
    jz igual
    jnz noIgual

igual:
    mov ax, 1
    jmp fin

noIgual:
    mov ax, 0                
    jmp fin

fin:
    hlt

variables:
    string01 dw "string 01 $"
    string02 dw "string 02 $"
    largo dw ($-string02)/2