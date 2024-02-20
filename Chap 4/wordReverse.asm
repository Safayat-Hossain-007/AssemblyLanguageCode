.model small
.stack 100h
.data 
msg1 db "Enter the string to reverse each word : $" 
x      db "$"

c db 0dh,0ah,"Every word in reverse : $"

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
         mov ah,9 
         lea dx,msg1
         int 21h 
         
         and cx,0 
         
         mov ah,1   
         input:  
             int 21h 
             
             cmp al,0dh
             je next 
             
             inc cx
             
             push ax
             
             jmp input 
         
         
         
            next: 
                mov ah,9
                lea dx,c
                int 21h
            
            mov bp,50h
            mov si,0
            
            cmp cx,0
            je exit
            
            exchange:
                inc si
                pop dx 
                xchg bp,sp
                push dx
                xchg bp,sp
                loop exchange 
            xor cx,cx 
            
             
             
           reverse:   
                cmp si,0
                je print_word     
            
              
                dec si
                xchg bp,sp
                pop dx
                xchg sp,bp  
                   
                cmp dl,20h
                je print_word
              
           
                push dx
                inc cx
                
                jmp reverse
              
             
             
              print_word:
                  jcxz print_space
                  mov ah,2
                  pop dx
                  int 21h
                  loop print_word
            
              
              
              print_space:
                  mov ah,2
                  mov dl,32
                  int 21h 
               
              cmp si,0
              jne reverse
       
        exit:
        mov ah,4ch
        int 21h
    
    main endp
    end main