.model small 
.stack 100h   
.data
 

MSG1 db 'Enter  a lower case letter: $'
MSG2 db 10,13,"In upper case it is : $"  
char db ?,"$"
.code        
             
main proc   
    ;initialize DS
    mov ax,@data    ; get data segment
    mov ds,ax       ; initialize ds
    ;print user prompt
    
    lea dx,MSG1     ;get first message
    mov ah,9        ; display string function
    int 21h
    
    ;input a character and convert to upper case
    mov ah,1        ; read character function
    int 21h         ; read a small letter into AL 
    sub al,20h      ; convert it to upper case
    mov char,al        ; and store it
   
    
    ;display to the next line
    lea dx,MSG2     ;get second message
    mov ah,9        ;display string function
    int 21h
      
    mov ah,2
    mov dl,char
    int 21h         ;display message and uppercase letter in front  
    
    
    ;dos exit
    exit:      
    mov ah,4ch
    int 21h
    main endp
end main
