.model small
.stack 100h
.data 
p db '1$'
n db '0$'
z db '-1$'
.code
main proc 
     mov ax,@data
     mov ds,ax
    
      mov ah,1
      int 21h
      
      mov bl,al
      
      cmp bl,0           
      jg positive       ;jump if gretaer than
      je zero           ;jump if equal
      jl negative       ;jump if less than
      
      
      
      positive: 
                mov ah,9 
                lea dx,p
                int 21h 
                jmp exit
      
      zero:     
                mov ah,9 
                lea dx,z
                int 21h 
                jmp exit
      
      negative:
                mov ah,9 
                lea dx,n
                int 21h
                jmp exit 
      
      exit:
              mov ah,4ch
              int 21h

   main endp
end main
