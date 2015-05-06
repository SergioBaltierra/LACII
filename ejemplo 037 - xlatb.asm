; ejemplo 37, instrucción xlatb

cargar:
    lea bx, arreglo01

leemos:  
    mov al, 2
    xlatb
    
fin:
	hlt

variables:
    arreglo01 db 9,8,7,6,5,4,3,2,1,0 