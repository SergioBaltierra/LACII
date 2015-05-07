; ejemplo 24, instrucción cwd

mov dx, 0   ; dx = 0
mov ax, 0   ; ax = 0
mov ax, -5  ; dx-ax = 0000-FFFBh
cwd         ; dx-ax = FFFF-FFFBh