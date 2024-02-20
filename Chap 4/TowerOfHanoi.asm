.model small
.stack 100h
.data
s1 db "enter 5 digit: $"
s2 db 10,13,"after sorting : $"
.code
main proc
    mov ax,@data
    mov ds,ax
     
     mov ah,9
     lea dx,s1
     int 21h 
     
     mov cx,5
     input:
        mov ah,1
        int 21h
        push ax
        
        mov ah,2
        mov dl,32
        int 21h
        loop input
    
    mov bx,50h
    mov si,0
    
    pop dx
    mov cx,4
    
    mov ax,dx
    
    xchg bx,sp
    push dx
    inc si
    
    xchg sp,bx
    
    start:
        pop dx
        
        check:
            cmp dx,ax
            jg problem
            
            go:
                xchg bx,sp
                mov ax,dx
                push dx
                inc si 
                
                xchg sp,bx
                loop start
                
                jmp print
       problem:
            xchg bx,sp
            pop di
            dec si
            
            xchg sp,bx
            push di
            inc cx
            
            cmp si,0
            jne check
            
      jmp go
      
      print:
        mov ah,9
        lea dx,s2
        int 21h
        
        mov cx,5
        xchg bx,sp
        
            top:
                mov ah,2
                pop dx
                int 21h
                
                mov dl,32
                int 21h
                
                loop top
                

        
                    
          exit:
            mov ah,4ch
            int 21h
            main endp
end main
                    
                    