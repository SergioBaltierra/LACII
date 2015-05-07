; ejemplo 35, almacenado en un arreglo de tipo dw.

iniciamos:
	mov di, 0
   	mov cx, 5
   	jmp leer

leer:
	lea bx, datos    
   	jmp recorrido
   	
recorrido:
	mov [bx+di], di
	add di, 2
	loop recorrido

fin:
	hlt    

variables:
	datos dw 5 dup(0)