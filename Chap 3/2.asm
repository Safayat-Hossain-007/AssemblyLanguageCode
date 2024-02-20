.model small
.stack 100h
.data
.code
main proc
  mov ax,@data
  mov ds,ax
 
    mov cx,128
    mov bh,80h 
    mov bl,0
        
    top:
        mov ah,2
        mov dl,bh
        int 21h 
        mov dl,32
        int 21h
            
        inc bh
        inc bl
        cmp bl,10
        je line
     
    continue:
        loop top 
        
          cmp cx,0
          je exit
    
    line:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        mov bl,0
        jmp continue:
    

     exit:
     mov ah,4ch
     int 21h

main endp
end main
