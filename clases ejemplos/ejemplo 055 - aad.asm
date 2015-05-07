dividendo:
    mov ax, numero01
	           
ajuste:
   aad

divisor:
   mov bl, numero02

operacion:
   div bl

fin:
   hlt
   
variables:
    numero01 dw 0307h
    numero02 db 05h