.model small
.stack 100h

.data
    a DB "Enter the first number: $"
    b DB 10,13,"Enter the second number: $"
    r DB 10,13,"The biggest number is: $"

.code
main proc
    mov ax, @data
    mov ds,ax
         
    
    mov ah,9
    lea  dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
        
    
    mov ah,9
    lea  dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 
    
    mov ah,9
    lea  dx,r
    int 21h
    
    
       
    ;mov cx,ax
    cmp bh,bl
    jge  l1
    jmp l2 
    
   
    
    l2:  
        mov ah,2
        mov dl,bl
        int 21h
        jmp exit  
    l1:
        mov ah,2
        mov dl,bh
        int 21h
        jmp exit
        
    exit:  
        mov ah,4ch
        int 21h
        main endp
    end main