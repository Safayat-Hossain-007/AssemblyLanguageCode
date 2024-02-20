.model small 
.stack 100h 
.data
msg1 db 0ah,0dh,"Enter a Hex digit:  $"  
msg2 db 0ah,0dh,"In decimal it is 1"
c1 db ?,"$"
  
.code        
             
main proc 
    mov ax,@data
    mov ds,ax  
    
    mov ah,9
    lea dx,msg1
    int 21h
         
    mov ah,1    
    int 21h 
    sub al,11h   
    mov c1,al  
    
    mov ah,9
    lea dx,msg2
    int 21h  
    
    
                             
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
