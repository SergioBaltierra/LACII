main proc
    lea bx, vector    
    call busqueda_binaria
    lea di, vector
    mov bl, posicion    
    cmp bl, -1    
    je no_encontrado
    mov al, [di+bx-1]
    mov numero, al
    jmp salir   
    
    no_encontrado:
        mov numero, -1
    
    salir:
        hlt
main endp    

busqueda_binaria proc
    calculo_mitad:        
        mov al, fin
        mov ah, inicio
        sub al, ah
        xor ah, ah
        div dos
        mov ah, inicio
        add al, ah
        mov mitad, al
        xor ax, ax
    
    if_1:
        mov ah, inicio
        mov al, fin
        cmp ah, al        
        jg return_1
        jmp if_2
        
        return_1:
            mov posicion, 1
            neg posicion
            ret
            
    if_2:
        mov al, buscar
        mov cl, mitad
        mov si, cx
        mov dl, [bx+si]
        cmp al, dl
        je return_2
        jmp if_3
        
        return_2:            
            mov posicion, cl
            inc posicion
            ret
    
    if_3:
        mov cl, mitad
        mov si, cx
        mov ah, [bx+si]
        mov al, buscar
        cmp ah, al
        jg return_3
        jmp else
        
        return_3:
            mov al, mitad
            dec al
            mov fin, al
            call busqueda_binaria
            ret
    
    else:
        return_4:
            mov al, mitad
            inc al
            mov inicio, al
            call busqueda_binaria
            ret        
busqueda_binaria endp


variables:
    buscar db 7
    vector db 0,1,2,3,4,5,6,7
    ;vector db 0,1,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,39,40,42,50,51,58,59,60,61,62,63,64,68,69,70,71,74,75,76,77,81,82,88,89,90,91,97,98,99
    fin db $-vector
    inicio db 0       
    mitad db 0
    dos db 2
    posicion db 0
    numero db 0