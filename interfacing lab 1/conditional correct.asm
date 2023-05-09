;data segment
org 100h
x DW 0
y DW 0

;code segment
.code
main proc
    
    ;ask the  user to enter the value of x
    
    lea si, input_x
    mov ah, 2
    mov cx, 22
    display_x:
    mov dl , [si]
    int 21h
    inc si 
    loop display_x
    
    
    
    mov ah,01h
    int 21h    ;input for x
    sub al,30h ;convert ASCIITO binary
    mov bl,al  ;save x to bl
    
    
    ;this give the space
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
    
    ;ask the user to enter the value of y 
    lea si, input_y
    mov ah, 2
    mov cx, 22
    display_y:
    mov dl , [si]
    int 21h
    inc si 
    loop display_y
    
    mov ah,01h ; input for y
    int 21h
    sub al,30h ;convert ASCII to binary
    mov cl,al  ;save y to cl
    
    
    cmp bl,cl       ; compare x and y 
    jle increment_x ;if x<=y,jump to increment_x
    increment_y:
    add cl,1        ;y=y+1
    jmp print_results ;jump to print result
    increment_x:
    add bl,1 ;x=x+1
    print_results:
   
   ;this gives the space 
    
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h  
    
    
    mov ah,02h ;print x
    mov dl,bl;load x to dl
    add dl,30h;convert binary to ASCII
    int 21h
    
    ; this gives the space          
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
     
     
    mov ah,02h ;print y
    mov dl,cl ;load x to dl
    add dl,30h ;convert binary to ASCII
    int 21h
    
    ;exit program
    mov ah,4ch
    int 21h
    main endp
 
input_x dw 'enter the value of x: '
input_y dw 'enter the value of y: '
