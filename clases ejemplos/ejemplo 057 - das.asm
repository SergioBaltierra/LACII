declaramos:
	mov al, numero01
	mov bl, numero02

operacion:
	sub al, bl

ajuste:
	das

fin:
	hlt
	
variable:
    numero01 db 85h
    numero02 db 48h