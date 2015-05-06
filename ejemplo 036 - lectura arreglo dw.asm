; ejemplo 36, lectura de un arreglo de tipo dw

iniciamos:
	mov si, 0
	mov cx, 5
	jmp leer
	
leer:
	lea bx, datos
	jmp recorrido
	
recorrido:
	mov ax, [bx+si]
	add si, 2
	loop recorrido
	
fin:
	hlt

variables:
	datos dw 256,257,258,259,260 