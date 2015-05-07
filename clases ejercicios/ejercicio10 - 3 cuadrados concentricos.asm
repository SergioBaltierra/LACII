; ejercicio 10, muestra por pantalla 3 cuadrados concéntricos.

;   La aristas de cada cuadrado se dibujan de forma horaria, 
; el color de las aristas aparece de forma aleatoria, a medida 
; que va avanzando la arista; los colores van del 1 al 255.
                                                  
main proc
    mov ah, 0       ; carga set modo video 13h - 320x200
    mov al, 13h 
    int 10h                  

    ; dibuja arista horizontal superior:
    mov cx, 100    ; columna.
    mov dx, 20     ; fila.
    mov al, 1      ; se carga comenzando con color azul.
    
    call arista_1   ; llamada procedimiento de la arista superior, cuadrado 1
    call arista_2   ; llamada procedimiento de la arista derecha, cuadrado 1
    call arista_3   ; llamada procedimiento de la arista inferior, cuadrado 1
    call arista_4   ; llamada procedimiento de la arista izquierda, cuadrado 1
    call arista_5   ; llamada procedimiento de la arista superior, cuadrado 2
    call arista_6   ; llamada procedimiento de la arista derecha, cuadrado 2
    call arista_7   ; llamada procedimiento de la arista inferior, cuadrado 2
    call arista_8   ; llamada procedimiento de la arista izquierda, cuadrado 2
    call arista_9   ; llamada procedimiento de la arista superior, cuadrado 3
    call arista_10  ; llamada procedimiento de la arista derecha, cuadrado 3
    call arista_11  ; llamada procedimiento de la arista inferior, cuadrado 3
    call arista_12  ; llamada procedimiento de la arista izquierda, cuadrado 3
    call fin        ; llamada procedimiento fin
main endp           ; fin procedimiento principal

arista_1 proc       ; procedimiento arista_1
    u1:
        mov ah, 0ch    ; salida put pixel.
        int 10h
        
        inc cx         ; inc línea de la arista.
      
        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_1    ; si sobrepasa va a función cambio_1, de lo contrario sigue.
                         
        cmp cx, 100+w1 ; cmp si llegó hasta el tope de la arista. 
        jbe u1         ; de lo contrario vuelve a u1.
    
        cambio_1:          
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 100+w1 ; cmp si llegó hasta el tope de la arista.
            jbe u1         ; de lo contrario vuelve a u1.
    
    ret
arista_1 endp       ; fin procedimiento arista_1
 
arista_2 proc       ; procedimiento arista_2   
    ; dibuja arista vertical derecha:
    mov cx, 100+w1  ; columna.
    mov dx, 20      ; fila.

    u2: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        inc dx         ; inc línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_2    ; si sobrepasa va a función cambio_2, de lo contrario sigue.

        cmp dx, 20+h1  ; cmp si llegó hasta el tope de la arista. 
        jb u2          ; de lo contrario vuelve a u2.

        cambio_2:
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 20+h1  ; cmp si llegó hasta el tope de la arista.
            jb u2          ; de lo contrario vuelve a u2.
                        
    ret
arista_2 endp       ; fin procedimiento arista_2

arista_3 proc       ; procedimiento arista_3
    ; dibuja arista horizontal inferior:
    mov cx, 100+w1  ; columna.
    mov dx, 20+h1   ; fila.

    u3:
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec cx         ; dec línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_3    ; si sobrepasa va a función cambio_3, de lo contrario sigue.

        cmp cx, 100    ; cmp si llegó hasta el tope de la arista. 
        ja u3          ; de lo contrario vuelve a u3.

        cambio_3:
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 100    ; cmp si llegó hasta el tope de la arista.
            ja u3          ; de lo contrario vuelve a u3.
    ret
arista_3 endp         ; fin procedimiento arista_3
                        
arista_4 proc         ; procedimiento arista_4
    ; dibuja arista vertical izquierda:
    mov cx, 100    ; columna.
    mov dx, 20+h1  ; fila.

    u4: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec dx         ; dec línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_4    ; si sobrepasa va a función cambio_4, de lo contrario sigue.

        cmp dx, 20     ; cmp si llegó hasta el tope de la arista. 
        ja u4          ; de lo contrario vuelve a u4.

        cambio_4:          
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 20     ; cmp si llegó hasta el tope de la arista.
            ja u4          ; de lo contrario vuelve a u4.
    
    ret                            
arista_4 endp       ; fin procedimiento arista_4

arista_5 proc       ; procedimiento arista_5
    ; dibuja arista horizontal superior:
    mov cx, 115     ; columna.
    mov dx, 35      ; fila.

    u5:
        mov ah, 0ch    ; salida put pixel.
        int 10h

        inc cx         ; inc línea de la arista.
    
        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_5    ; si sobrepasa va a función cambio_5, de lo contrario sigue.

        cmp cx, 115+w2 ; cmp si llegó hasta el tope de la arista. 
        jbe u5         ; de lo contrario vuelve a u5.

        cambio_5:
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 115+w2 ; cmp si llegó hasta el tope de la arista.
            jbe u5         ; de lo contrario vuelve a u5.
    
    ret                            
arista_5 endp       ; fin procedimiento arista_5

arista_6 proc       ; procedimiento arista_6
    ; dibuja arista vertical derecha:
    mov cx, 115+w2  ; columna.
    mov dx, 35      ; fila.

    u6: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        inc dx         ; inc línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_6    ; si sobrepasa va a función cambio_6, de lo contrario sigue.

        cmp dx, 35+h2  ; cmp si llegó hasta el tope de la arista. 
        jb u6          ; de lo contrario vuelve a u6.

        cambio_6:
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 35+h2  ; cmp si llegó hasta el tope de la arista.  
            jb u6          ; de lo contrario vuelve a u6.
    
    ret                            
arista_6 endp       ; fin procedimiento arista_6

arista_7 proc       ; procedimiento arista_7
    ; dibuja arista horizontal inferior:
    mov cx, 115+w2  ; columna.
    mov dx, 35+h2   ; fila.

    u7: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec cx         ; dec línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_7    ; si sobrepasa va a función cambio_7, de lo contrario sigue.

        cmp cx, 115    ; cmp si llegó hasta el tope de la arista. 
        ja u7          ; de lo contrario vuelve a u7.

        cambio_7:
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 115    ; cmp si llegó hasta el tope de la arista.
            ja u7          ; de lo contrario vuelve a u7.
    
    ret                            
arista_7 endp       ; fin procedimiento arista_7

arista_8 proc       ; procedimiento arista_8
    ; dibuja arista vertical izquierda:
    mov cx, 115     ; columna.
    mov dx, 35+h2   ; fila.
    
    u8: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec dx         ; dec línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_8    ; si sobrepasa va a función cambio_8, de lo contrario sigue.

        cmp dx, 35     ; cmp si llegó hasta el tope de la arista. 
        ja u8          ; de lo contrario vuelve a u8.

        cambio_8:
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 35     ; cmp si llegó hasta el tope de la arista.
            ja u8          ; de lo contrario vuelve a u8.
    ret
arista_8 endp      ; fin procedimiento arista_8
                  
arista_9 proc      ; procedimiento arista_9
    ; dibuja arista horizontal superior:
    mov cx, 130    ; columna.
    mov dx, 50     ; fila.
    
    u9: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        inc cx         ; inc línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_9    ; si sobrepasa va a función cambio_9, de lo contrario sigue.

        cmp cx, 130+w3 ; cmp si llegó hasta el tope de la arista. 
        jbe u9         ; de lo contrario vuelve a u9.

        cambio_9:
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 130+w3 ; cmp si llegó hasta el tope de la arista.
            jbe u9         ; de lo contrario vuelve a u9.
            
    ret            
arista_9 endp       ; fin procedimiento arista_9

arista_10 proc      ; procedimiento arista_10
    ; dibuja arista vertical derecha:
    mov cx, 130+w3  ; columna.
    mov dx, 50      ; fila.

    u10:
        mov ah, 0ch    ; salida put pixel.
        int 10h

        inc dx         ; inc línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_10   ; si sobrepasa va a función cambio_10, de lo contrario sigue.

        cmp dx, 50+h3  ; cmp si llegó hasta el tope de la arista. 
        jb u10         ; de lo contrario vuelve a u10.

        cambio_10:         
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 50+h3  ; cmp si llegó hasta el tope de la arista.
            jb u10         ; de lo contrario vuelve a u10.
                                                      
    ret
arista_10 endp      ; fin procedimiento arista_10

arista_11 proc      ; procedimiento arista_11
    ; dibuja arista horizontal inferior:
    mov cx, 130+w3  ; columna.
    mov dx, 50+h3   ; fila.

    u11: 
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec cx         ; dec línea de la arista.

        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_11   ; si sobrepasa va a función cambio_11, de lo contrario sigue.

        cmp cx, 130    ; cmp si llegó hasta el tope de la arista. 
        ja u11         ; de lo contrario vuelve a u11.

        cambio_11:
            mov al, 1      ; carga el color comenzando con 1.
            cmp cx, 130    ; cmp si llegó hasta el tope de la arista.
            ja u11         ; de lo contrario vuelve a u11.                           
    ret
arista_11 endp      ; fin procedimiento arista_11                          

arista_12 proc      ; procedimiento arista_12
    ; dibuja arista vertical izquierda:
    mov cx, 130     ; columna.
    mov dx, 50+h3   ; fila.

    u12:
        mov ah, 0ch    ; salida put pixel.
        int 10h

        dec dx         ; dec línea de la arista.
    
        inc al         ; inc el color.
        cmp al, 255    ; cmp si el color sobrepasa el límite 255.
        je cambio_12   ; si sobrepasa va a función cambio_12, de lo contrario sigue.

        cmp dx, 50     ; cmp si llegó hasta el tope de la arista.
        ja u12         ; de lo contrario vuelve a u12.     

        cambio_12:
            mov al, 1      ; carga el color comenzando con 1.
            cmp dx, 50     ; cmp si llegó hasta el tope de la arista.
            ja u12         ; de lo contrario vuelve a u12.       

    ret
arista_12 endp  ; fin procedimiento arista_12

fin proc        ; procedimiento fin
    hlt         ; parada de ejecución del programa
fin endp        ; fin procedimiento fin             

variables:    
    ; dimesiones del cuadrado 1:
    w1 equ 130  ; ancho
    h1 equ 130  ; alto 
     
    ; dimensiones del cuadrado 2:
    w2 equ 100  ; ancho
    h2 equ 100  ; alto
    
    ; dimensiones del cuadrado 3:
    w3 equ 70   ; ancho
    h3 equ 70   ; alto