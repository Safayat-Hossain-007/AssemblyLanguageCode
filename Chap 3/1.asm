.model small
.stack 100h
.data
.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov ah,2
  mov dl,'?'
  int 21h
  mov dl,10
  int 21h
  mov dl,13
  int 21h 
  
  mov ah,1
  int 21h
  mov bl,al
  int 21h
  mov cl,al 
  
  mov ah,2
  mov dl,10
  int 21h
  mov dl,13
  int 21h
  
 cmp bl,cl
     ja next        ;jump if above
     mov ah,2
     mov dl,bl
     int 21h 
     mov dl,cl
     int 21h
     jmp exit
  
     next:
     mov ah,2
     mov dl,cl
     int 21h
     
     mov dl,bl
     int 21h
     jmp exit
     
     exit:
     mov ah,4ch
     int 21h

main endp
end main
