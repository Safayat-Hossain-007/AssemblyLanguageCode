.model small 
.stack 100h 
.data
msg db 10,13,"The sum of "
a db ?," and "
b db ?," is "
c db ?," $ "
  
.code        
             
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    mov dl,"?"
    int 21h
    
         
    mov ah,1   ; 1st input  
    int 21h     
    mov a,al  
    
    mov ah,1   ; 2nd input  
    int 21h     
    mov b,al 
    
    add al,a
    sub al,30h
    mov c,al
    
    mov ah,9
    lea dx,msg
    int 21h   
                      
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
