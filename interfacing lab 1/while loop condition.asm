; Define variables
x DW ?
y DW 1

; Prompt user for input
MOV DX, OFFSET input_message
MOV AH, 09h
INT 21h

            ;Read input for x
MOV AH, 01h ; Set AH to read input
INT 21h     ;Call interrupt
SUB AL, 30h ; Convert ASCII to decimal
mov bl,al
mov ax,y
; Execute while loop
WHILE_LOOP:
    CMP bl, 0000h ;Compare x to zero
    JLE END_LOOP  ;Jump to end of loop if x<=0 
    MUL bx        ; Multiply AX 
    dec bx        ; Decrement x
    jmp WHILE_LOOP; Jump back to beginning of loop

END_LOOP:
input_message DB "Enter the value of x: $"
