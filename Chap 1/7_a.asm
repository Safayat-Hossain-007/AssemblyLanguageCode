.model small 
.stack 100h   
.code        
             
main proc      
    mov ah,1   ; input  
    int 21h     
    mov bl,al  
    
    mov ah,2   ; output newLine
    mov dl,0Ah ; new line
    int 21h    
    mov dl,13  ; caries return
    int 21h
    
    
    mov ah,2   
    mov dl,bl  ; output
    int 21h    
                      
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
