MiMacro01 macro p1,p2
    mov ax, p1
    mov bx, p2    
MiMacro01 endm

MiMacro02 macro
    add ax, bx    
MiMacro02 endm

fin macro
    hlt
fin endm