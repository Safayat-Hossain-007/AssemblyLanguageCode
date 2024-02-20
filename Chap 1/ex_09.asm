.model small 
.stack 100h 
.data
msg db 10,13,"Enter 3 initializer : $"
c1 db ?,0ah,0dh
c2 db ?,0ah,0dh
c3 db ?," $ "
  
.code        
             
main proc 
    mov ax,@data
    mov ds,ax  
    
    mov ah,9
    lea dx,msg
    int 21h
         
    mov ah,1   ; 1st input  
    int 21h     
    mov c1,al  
    
    mov ah,1   ; 2nd input  
    int 21h     
    mov c2,al 
    
    mov ah,1   ; 3rd input  
    int 21h     
    mov c3,al   
    
    mov ah,2
    mov dl,0ah
    int 21h   
    mov dl,0dh
    int 21h 
    
    mov ah,9
    lea dx,c1
    int 21h
    
            
              
     
                      
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
