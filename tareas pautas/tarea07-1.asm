main proc 
    cargamos:
        lea si, vector_inicio
        lea di, vector_termino
        
        mov ax, estrellas
        mul dos
        mov estrellas, ax
        
        mov ah, 00h
        mov al, 13h
        int 10h
    
    calculo:
        mov ax, [si]
        mov x_0, ax
        mov ax, [di]
        mov x_1, ax
        
        mov ax, [si+2]
        mov y_0, ax
        mov ax, [di+2]
        mov y_1, ax
        
        add si, 4
        add di, 4
        sub estrellas, 2
    
        mov dx, x_0
        mov ax, x_1
        sub ax, dx
        mov delta_x, ax
        mul dos
        mov dos_delta_x, ax
       
        xor ax, ax
        xor dx, dx 
        mov dx, y_0
        mov ax, y_1
        sub ax, dx
        mov delta_y, ax
        mul dos        
        mov dos_delta_y, ax

        mov ax, delta_x
        mul dos
        mov dx, ax
        mov ax, dos_delta_y
        sub ax, dx
        mov dos_delta_y_menos_dos_delta_x, ax
        
        mov ax, dos_delta_y_menos_dos_delta_x
        mov p, ax
        
        mov ax, delta_x
        cmp ax, 0
        je delta_x_negativo
        jl negativo       
        jmp no_negativo        
            
        delta_x_negativo:
            mov ax, delta_y
            cmp ax, 0
            jl negativo
            jmp no_negativo
            
        negativo:
            neg ax
            jmp no_negativo    
        
        no_negativo:            
            mov k, ax
            inc k

        call recta
        
        xor ax, ax
        mov ax, estrellas
        cmp ax, 0
        je termino
        jmp calculo
        
        termino:
            hlt
main endp

recta proc
    declaramos_recta:
        xor ax, ax
        xor bx, bx
        xor cx, cx
        xor dx, dx
        
        mov ax, x_0
        mov x_add_1, ax
        
        mov ax, y_0
        mov y_add_1, ax
        jmp dibujar_recta
        
    bresenham_recta:  
        xor ax, ax
        mov ax, delta_y
        cmp ax, 0
        je menor_recta
        jl excepcion_1
        
        mov ax, delta_x
        cmp ax, 0
        je llamar_direccion_y
        jmp no_excepcion
        
        excepcion_1:
            mov ax, delta_x
            cmp ax, 0
            je llamar_direccion_y
            jg excepcion_2
            jmp no_excepcion 
            
            excepcion_2:
                jmp no_menor_recta
   
        no_excepcion:
        mov ax, p
        cmp ax, 0
        
        jl menor_recta
        jmp no_menor_recta
                
        menor_recta:
            call direccion_x
            
            mov ax, p
            add ax, dos_delta_y
            mov p, ax

            jmp dibujar_recta
            
        no_menor_recta:
            call direccion_x
            call direccion_y
            
            mov ax, p
            add ax, dos_delta_y_menos_dos_delta_x
            mov p, ax
            jmp dibujar_recta
            
        llamar_direccion_y: 
            call direccion_y
            mov ax, p
            add ax, dos_delta_x
            mov p, ax
               
        dibujar_recta:
            mov bh, 1       
            mov cx, x_add_1
            mov dx, y_add_1     
            mov al, 0Fh        
        
        mov ah, 0Ch     
        int 10h      
        
        salir_recta:
            dec k
            mov ax, k            
            cmp ax, 0
            je fin_recta
            jmp bresenham_recta
       
    fin_recta:
        ret
recta endp  

direccion_x proc
    mov ax, delta_x
    cmp ax, 0
    jge delta_x_positivo_direccion_x
    jmp delta_x_negativo_direccion_x
            
    delta_x_positivo_direccion_x:
        mov ax, x_add_1
        cmp ax, x_1
        je retorno_direccion_x
        inc ax
        mov x_add_1, ax

        jmp retorno_direccion_x   
           
    delta_x_negativo_direccion_x:
        mov ax, x_add_1
        cmp ax, x_1
        je retorno_direccion_x
        dec ax
        cmp ax, 0
        jl cambio_cero_direccion_x
        jmp suma_y_direccion_x
        
        cambio_cero_direccion_x:
            mov ax, 0
        
        suma_y_direccion_x: 
            mov x_add_1, ax             
    
    retorno_direccion_x:         
        ret
direccion_x endp

direccion_y proc
    mov ax, delta_y
    cmp ax, 0
    jge delta_y_positivo_direccion_y
    jmp delta_y_negativo_direccion_y
            
    delta_y_positivo_direccion_y:
        mov ax, y_add_1
        cmp ax, y_1
        je retorno_direccion_y
        inc ax
        mov y_add_1, ax

        jmp retorno_direccion_y
           
    delta_y_negativo_direccion_y:
        mov ax, y_add_1
        cmp ax, y_1
        je retorno_direccion_y
        dec ax
        cmp ax, 0
        jl cambio_cero_direccion_y
        jmp suma_y_direccion_y
        
        cambio_cero_direccion_y:
            mov ax, 0
        
        suma_y_direccion_y:    
            mov y_add_1, ax             
    
    retorno_direccion_y:         
        ret    
direccion_y endp    

variables:
    x_add_1 dw 0                            
    y_add_1 dw 0
    x_0 dw 0  ;0 ;9 ;0 ;0 ;0  ;10 ;10 ;0
    y_0 dw 0  ;0 ;0 ;0 ;9 ;9  ;0  ;9  ;0
    x_1 dw 0  ;9 ;0 ;0 ;0 ;10 ;0  ;0  ;10
    y_1 dw 0  ;0 ;0 ;9 ;0 ;0  ;9  ;0  ;9
    delta_x dw 0;x_1-x_0
    delta_y dw 0;y_1-y_0
    dos_delta_x dw 0
    dos_delta_y dw 0;2*delta_y
    dos_delta_y_menos_dos_delta_x dw 0;dos_delta_y - 2*delta_x    
    k dw 0
    p dw 0    
    dos dw 2
    
;    vector_inicio dw 0,0,14,7,10,9 
;    vector_termino dw 14,7,10,9,0,0
;    estrellas dw 3

;    vector_inicio dw 96,54,102,52,78,38,120,38,80,70,108,50  
;    vector_termino dw 102,52,108,50,96,54,108,50,96,54,120,80
;    vector_inicio dw 92,54,102,52,80,36,120,38,80,70,110,50 
;    vector_termino dw 102,52,110,50,92,54,110,50,92,54,118,80
;    estrellas dw 6
    
    vector_inicio dw 30,30,10,50
    vector_termino dw 10,50,50,45
    estrellas dw 2
    
    ; 0       1
    ; 0,0  -> 10,9  inc x, inc y ; deltax = 10, deltay = 9
    ; 10,9 -> 0,0   dec x, dec y ; deltax = -10, deltay = -9
    ; 10,0 -> 0,9   dec x, inc y ; deltax = -10, deltay = 9
    ; 0,9  -> 10,0  inc x, dec y ; deltax = 10, deltay = -9