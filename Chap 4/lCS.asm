include emu8086.inc
.model small
.stack 100h
.data 

.code       
main proc   
    
    
   ; final_star bh  
   ;prev    bl
   ;ch      al    
   ;cnt1    cl
   ;cnt2    ch
   
   mov cl,1
   mov ch,0
   
   mov ah,1
   int 21h
   mov bl,al
   mov bh,bl
   
   input:
        mov ah,1
        int 21h
        inc bl
        
        
        cmp bl,al
        je fun1 
        jmp fun2  
        
        
        
    fun1:
        inc cl
        jmp check
        
    fun2:
        cmp cl,ch
        jg fun3
        jmp fun4
    
    fun3:
        mov ch,cl
        sub bl,cl
        mov bh,bl
        mov bl,al
        mov cl,1
        
        jmp check 
        
    fun4:
        mov bl,al
        mov cl,1
        
        jmp check
   check:
        cmp al,0dh
        je printline
        jmp input
        
        
   
        
        
    printline:
            mov ah,2
            mov dl,10
            int 21h
            mov dl,13
            int 21h
            
            print:
                mov dl,bh
                int 21h
                
                inc bh
                dec ch
                
                cmp ch,0
                je exit
                jmp print
                    
    
    
    exit:
        mov ah,4ch
        int 21h
    main endp
end main