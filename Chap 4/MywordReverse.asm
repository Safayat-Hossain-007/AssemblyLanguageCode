.model small
.stack 100h
.data 
s1 db "Enter the string to reverse each word : $" 
s2 db 10,13,"Every word in reverse : $"
a db ?
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
        
        cmp al,13
        je check
        inc cx
        push ax
        
        jmp input
        
        
   check:
        mov ah,9
        lea dx,s2
        int 21h
        
    mov bx,50h
    mov si,0 
    
    cmp cx,0
    je exit
    
    
    newstack:   
         pop dx 
         dec cx
         xchg bx,sp
         
         push dx 
         inc si
         xchg sp,bx
         
         
         cmp cx,0
        jne newstack  
        
   mov cx,0
    
    reverse:
            
             cmp si,0
            je printword
              
            
            
            xchg bx,sp
            pop dx
            dec si
            
            xchg sp,bx
            cmp dl,32
            je printword
            
            
            push dx
           
            inc cx
             
           
            jmp reverse
           
     printword:
             
             mov ah,2
             pop dx
             int 21h 
             dec cx
             
             cmp cx,0
             je space
             
             jmp printword
             
             space:
                    mov ah,2
                    mov dl,32
                    int 21h
                    mov cx,0  
                    
                    cmp si,0
                    jne reverse
                        
    
        exit:
        mov ah,4ch
        int 21h
    
    main endp
    end main