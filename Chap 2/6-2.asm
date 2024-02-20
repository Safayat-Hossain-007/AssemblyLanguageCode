.model small
.data
.code
    main proc
    
    mov dl,-3
    
    cmp dl,0
    jge positive
    jmp negation
    
    negation:
        neg dl
        
        add dl,48
        mov ah,2
        int 21h
        jmp exit
     
    
    positive:
        add dl,48
        mov ah,2
        int 21h
    
    exit:    
        mov ah,4ch
        int 21h  
        
        
    main endp
end main