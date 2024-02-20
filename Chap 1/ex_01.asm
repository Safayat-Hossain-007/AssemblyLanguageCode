.model small 
.stack 100h   
.code        
             
main proc   
    mov ah,2    ;display character funtion
    mov dl,"?"  ; display character is "?"
    int 21h     ; display it
    
      
    mov ah,1     ; input  
    int 21h     
    mov bl,al  
    
    mov ah,2   ; output newLine
    mov dl,0DH ; new line
    int 21h    
    mov dl,0AH  ; caries return
    int 21h
    
    
    ;mov ah,2   
    mov dl,bl  ; output
    int 21h    
                      
    
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
