; ejemplo 22, instrucción cmp (incluye también ja y jb)

declaramos:
    mov ax, num1
    mov bx, num2
    
comparamos:
    cmp ax, bx
    cmp bx, ax
    ja mayor
    jb menor
    
mayor:
    mov ax, num1
    jmp fin

menor:
    mov ax, num2
    jmp fin

fin:
    hlt
    
constantes:
    num1 equ 0
    num2 equ 5