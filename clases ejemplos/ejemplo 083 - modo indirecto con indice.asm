; ejemplo 83, modo indirecto con índice  
 
mov [di+4h], 1

mov al, 0                   
mov al, [di+4h]

mov dl, 0
mov dl, ds:di+4h 