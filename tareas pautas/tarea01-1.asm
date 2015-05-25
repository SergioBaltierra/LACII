; Tarea 01, resolver expresión...
; Nombre Completo...
; RUN: ...

; Algoritmo: 
;    Resolver la siguiente expresión AX = 2+3-5*(-4)/(-2).

mov ax, -4  ; resolvemos primero división, asignando al registro AX = -4
mov bx, -2  ; asignamos al registro BX = -2

idiv bx     ; dividimos AX / BX 

mov cl, al  ; copiamos cociente que se almacen en registro AL en registro CL.

mov ax, 5   ; asignamos al registro AX = 5.
mov bx, cx  ; asignamos al registro BX = CX.

imul bx     ; resolvemos multiplicación BX*AX (5*(-4)/(-2)).

mov cx, ax  ; copiamos el valor de BX*AX al registro CX

mov ax, 2   ; asignamos al registro AX = 2
mov bx, 3   ; asignamos al registro BX = 3

add ax, bx  ; sumamos AX+BX (2+3)
sub ax, cx  ; restamos AX-CX (2+3-5*(-4)/(-2))       





