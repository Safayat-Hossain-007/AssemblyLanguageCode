.model small
.stack 100h
.data 
a db "Enter a string of capital letters: $"

b db 10,13,"The longest consecutively increaseing string is : $"
.code 
main proc
mov ax,@data
 mov ds,ax    
   mov ah,1
   int 21h
   mov ch,1
   mov cl,1
   mov bl,al
   mov dh,al
   mov bh,al
    second:
    
    mov ah,1
    int 21h  
    cmp al,0dh
    je final
    
    inc bl
    
    cmp bl,al
    je equal
    jmp check
    
    equal:
    inc cl  
    mov bl,al
    jmp second
    
    
    
    check:
    cmp cl,ch
    jg increase
    mov bh,al
    mov bl,al 

    mov cl,1
    jmp second 

    increase: 
    mov dh,bh
    mov bh,al
    mov ch,cl
    mov cl,1 
    mov bl,al
    jmp second

     increaseagain:
     mov ch,cl 
     mov dh,bh
    
     jmp end


final:
      cmp ch,cl
      jl increaseagain
      
  end:   
        mov ah,2
        mov dl,10
        int 21h

  
  top:
  mov ah,2
  mov dl,dh
  int 21h
  inc dh
  dec ch
  cmp ch,0
  je exit
   jmp top
    
   
    
  
 
 exit:     
mov ah,4ch
int 21h 

main endp
end main
