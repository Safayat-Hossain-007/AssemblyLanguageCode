.model small
.stack 100h
.data
mgs db 10,13,"Total number of characters:$"
.code
main proc 
   mov ax,@data
   mov ds,ax
   
   mov cl,0
   mov ah,1
   int 21h
   
 while_loop:
       cmp al,0dh
       je exit          ; jump if equal newlineread, jump exit level
       
       inc cl 
       int 21h
       jmp while_loop  ;jmp unconditional loop 
       
  exit:
      
        add cl,30h    ;add 48 indecimal
        
        mov ah,9
        lea dx,mgs
        int 21h
    
        
        mov ah,2
        mov dl,cl
        int 21h 
    
        mov ah,4ch
        int 21h
        main endp
        end main