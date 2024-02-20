.model small 
.stack 100h 
.data 
msg1 db 10,13,'**********$'
msg2 db 10,13,'****'
a db ?,""
b db ?,''
c db ?,'****$'  
.code        
             
main proc      
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov a,al
    
    int 21h
    mov b,al
    
    int 21h
    mov c,al
    
    mov ah,9
    lea dx,msg1
    
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    
    lea dx,msg2
    int 21h
    
    lea dx,msg1
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
             
    mov ah,2
    mov dl,7  ;beep sound
    int 21h
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
