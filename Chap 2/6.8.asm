.model small
.stack 100h
.data
.code                          
main proc 
    
   mov ah,2
   mov dl,'*'
   
   mov cx,80    ;coungter register count 80 times  
   
   top:
   int 21h
   loop top    ; loop executes 80 times
   
   exit:
   mov ah, 4ch
   int 21h
   
   main endp
end main
