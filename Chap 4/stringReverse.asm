.model small
.stack 100h
.data
s1 db "enter string:$"
s2 db 10,13,"reverse string: $"
.code
main proc
    mov ax,@data
    mov ds,ax
     
     mov ah,9
     lea dx,s1
     int 21h 
     
     mov cx,0
     mov ah,1
     
     input: 
        int 21h 
        cmp al,0dh
        je print  
        push ax
        inc cx 
         
        jmp input
        
    print:
        mov ah,9
        lea dx,s2
        int 21h
        
        mov ah,2 
        
        top:
            
            pop dx
            int 21h 
            dec cx
            
            cmp cx,0
            je exit
            jmp top

        
                    
          exit:
            mov ah,4ch
            int 21h
            main endp
end main
                    
                    