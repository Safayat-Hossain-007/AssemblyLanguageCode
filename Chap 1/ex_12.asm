.model small 
.stack 100h 
.data 
stars db 0ah,0dh,"**********","$"
  
.code        
             
main proc    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,stars 
    int 21h     
    
    mov cx,10
    L:
    int 21h
    loop L
        
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
