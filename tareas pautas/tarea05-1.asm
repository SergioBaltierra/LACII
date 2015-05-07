inicio:             
    lea di, string    
    lea bx, string
    lea si, vector
    mov cl, largo
    mov iteracion, cl
    jmp for_j
    
for_i:
    inc bx
    dec iteracion
    cmp iteracion, 0
    je mayor
    mov cl, largo   
    lea di, string
    mov al, contador
    mov [si], al
    inc si
    mov contador, 0     
    
    for_j:   
        mov al, [bx]
        cmp al, [di]
        jz igual     
        inc di
        loop for_j
        jmp for_i
        jmp mayor
    
    igual: 
        mov al, [bx+1]
        cmp al, [di+1]
        jnz incrementar        
        inc contador       
        inc di
        jmp for_j
    
    incrementar:
        inc di
        jmp for_j    

mayor:
    lea bx, vector
    mov al, [bx]
    inc bx
    mov cl, largo   
    mov dl, 0
    comparar:
        inc dl
        cmp al, [bx]
        jl cambiar        
        inc bx        
        loop comparar
        mov maximo, al
        jmp extraerPar
    
    cambiar:
        mov al, [bx]
        inc bx        
        mov indice, dl
        loop comparar

extraerPar:
    lea di, string
    lea si, vector
    lea bx, par    
    mov al, [si]
    cmp al, maximo
    je sacar
    
    sacar:
        xor cx, cx
        mov cl, indice
        add di, cx        
        mov dh, [di]
        inc di
        mov dl, [di]
        mov [bx], dh
        mov [bx+1], dl
        jmp fin  

fin:
    hlt    

variables:                       
    ;string db "abradacadabrab"
    string db "ciclopentanoperhidrofenantreno"
    largo db $ - string
    vector db largo dup(?)
    par db 2 dup(?)
    contador db 0
    iteracion db 0
    maximo db 0
    indice db 0
    
