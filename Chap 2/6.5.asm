.model small
.stack 100h
.code
   main proc  
    
        mov ah,1
        int 21h
        mov bl,al
        
        cmp bl,'1'
        je ODD 
        cmp bl,'3'
        je ODD
        
        cmp bl,'2'
        je EVEN  
        cmp bl,'4'
        je EVEN
        
        ODD:
        mov ah,2
        mov dl,"o"
        int 21h
        jmp exit
        
        EVEN:
        mov ah,2
        mov dl,"e"
        int 21h
        jmp exit
        
        exit:
        mov ah,4ch
        int 21h 

        main endp
end main 
