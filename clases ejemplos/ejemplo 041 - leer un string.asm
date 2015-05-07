; ejemplo 41, leer un string

iniciar:
	mov ax, 0
    mov si, 0
	mov cx, 12	
    lea bx, string01
    jmp leer

leer:
	mov al, [bx+si]
   	inc si
   	loop leer  

salir:
    hlt

declarar:
    string01 db "Hola Mundo $"