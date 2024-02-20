.model small 
.stack 100h 
.data 
stars db 0ah,0dh,"**********$"
  
.code        
             
main proc    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,stars
    
    int 21h 
    int 21h
    int 21h
    int 21h
    int 21h
    
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    
    
        
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
