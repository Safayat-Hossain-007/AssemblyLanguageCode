.model small
.stack 100h
.data
.code
   main proc
      
      mov bl,0
      mov ah,1    
      
      repeat:
         int 21h
         cmp al,' '         ;compare with space
         je end  
         inc bl             ; increament bl value
         jne repeat:
      
      end:
        add bl,30h
        mov dl,bl
        mov ah,2
        int 21h
      
   main endp
end main
