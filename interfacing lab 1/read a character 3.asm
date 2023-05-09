read PROC
    mov cx, 0 ; initialize character count to 0
    mov ah, 1 ; set up for reading a character from keyboard
    lea si, prompt  
    mov AH,2  
    mov cx,26   
    display:      
    mov dl,[si]  
    int 21h      
    inc si   
    loop display
read_loop: 

    
    mov ah,1
    int 21h      ; read a character from keyboard
    sub al, 30h
    cmp al, 5h   ; check if the character is a carriage return 
    je read_done ; if so, exit the loop
    inc cx       ; increment character count
    cmp cx, 5    ;check if the maximum number of characters has been reached
    je read_done ; if so, exit the loop
                 ; 
    jmp read_loop; jump back to the top of the loop to read another character
read_done:
    ret
read ENDP
prompt dw 'the carriage return is 5: '