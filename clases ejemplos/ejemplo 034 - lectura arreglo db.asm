; ejemplo 34, lectura de un arreglo de tipo db

iniciamos:
	mov si, 0
   	mov cx, 5
	jmp leer

leer:
	lea bx, datos
   	jmp recorrido

recorrido:
	mov al, [bx+si]    
   	inc si
	loop recorrido
	
fin:
	hlt

variables:
   	datos db 1,2,3,4,5 
        		