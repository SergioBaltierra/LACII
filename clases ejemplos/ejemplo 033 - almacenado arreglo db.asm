; ejemplo 33, almacenado de un arreglo tipo db

iniciamos:
	mov di, 0
   	mov cx, 5
   	jmp leer

leer:
   	lea bx, datos    
   	jmp recorrido
   	
recorrido:
   	mov [bx+di], di
   	inc di
   	loop recorrido

fin:
   	hlt    

variables:
	datos db 5 dup(0)