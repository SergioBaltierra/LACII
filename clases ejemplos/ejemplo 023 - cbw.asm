; ejemplo 23, instrucción cbw

mov ax, 0   ; ah = 0, al = 0
mov al, -5  ; ax=00FBh (-5) , ah-al = 00FBh
cbw         ; ax=FFFBh (-5) , ah-al = FFFBh
hlt