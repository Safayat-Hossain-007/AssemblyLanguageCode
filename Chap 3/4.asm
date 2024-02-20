.model small
.stack 100h
.data 

a db 10,13,"Enter a Hex digit: $"
b db 10,13,"In decimal it is: $" 
c db "Enter a Hex digit: $"
d db 10,13,"Illegal character. enter 0..9 or A..F  :   $" 
e db 10,13,"Do you want to do it again : $"
f db 10,13,"Too many illegal tries.$"

.code
main proc
  mov ax,@data
  mov ds,ax  
  
  mov ah,9
  lea dx,c
  int 21h 
  mov cl,0
  jmp begin
   
  again: 
      mov ah,9
      lea dx,a
      int 21h
       
  begin:
        mov ah,1 
        int 21h
        mov bl,al
  compare:
       cmp bl,'0'
       jge first
       jl illegal
  
     illegal: 
         inc cl
         cmp cl,3
         je terminate
         
         mov ah,9
         lea dx,d
         int 21h
         jmp begin 

     first:
         cmp bl,'9'
         jle num
         jg char
     
     char: 
         cmp bl,'A'
         jge third
         jl illegal
     
     third:
     cmp bl,'F'
     jle hex
     jg illegal
     
     hex:
         mov cl,0  
         mov ah,9
         lea dx,b
         int 21h 
         
         mov ah,2
         mov dl,'1'
         int 21h
         sub bl,65
         add bl,48
         
         mov ah,2
         mov dl,bl
         int 21h 
         jmp try
     
      num:  
          mov cl,0
          mov ah,9
          lea dx,b
          int 21h 
          mov ah,2
          mov dl,bl
          int 21h 
          jmp try
      
      try:
          mov ah,9
          lea dx,e
          int 21h
          mov ah,1
          int 21h
          cmp al,'y'
          je again
          cmp al,'Y'
          je again
          jmp exit 
      
      terminate:
       mov ah,9
       lea dx,f
       int 21h

     exit:
     mov ah,4ch
     int 21h

main endp
end main
