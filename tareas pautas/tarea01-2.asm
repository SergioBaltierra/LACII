; Tarea 01, resolver expresión.
; Nombre Completo...
; RUN: ...

; Algoritmo: 
;    Resolver la siguiente expresión AX = 2+3-5*(-4)/(-2).
                                         
mov ax, -4  ; resolvemos primero división, asignando al registro AX = -4
mov bx, -2  ; asignamos al registro BX = -2

idiv bx     ; dividimos AX / BX (-4)/(-2)

mov ah, 0   ; limpiamos registro AH
mov bx, 5   ; asignamos al registro BX = 5.

imul bx     ; resolvemos multiplicación BX*AX (5*(-4)/(-2)).

mov bx, 2   ; asignamos al registro BX = 2
mov cx, 3   ; asignamos al registro CX = 3

add bx, cx  ; sumamos BX+CX (2+3)                  

xchg ax, bx ; intercambiamos los valores entre los registros AX y BX

sub ax, bx  ; restamos AX-CX (2+3-5*(-4)/(-2))                                                                           