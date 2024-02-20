.model small 
.stack 100h   
.code        
             
main proc      
    mov ah,1   ; input  
    int 21h     
    add al,20h
    mov dl,al 
    
   
    mov ah,2 
    ;mov dl,bl 
    int 21h    
                      
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
