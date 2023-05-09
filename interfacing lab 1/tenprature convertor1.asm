org 100h
 lea si,inputDisp
 mov ah,2
 mov cx,25
    loop1:
     mov dl,[si]
     inc si
     int 21h
     loop loop1
 
 lea bx,input
 mov si,bx
 mov ah,1
 mov cx,2
  loops2:
   int 21h 
   mov [si],al
   inc si
    loop loops2
    
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h   
    
lea si,input
mov al,[si]
sub al,30h
inc si
mov bh,[si] 
sub bh,30h
mov bl,10
mul bl
add al,bh


mov bl,9
mul bl
mov bl,5
div bl
add al,32 
   
  mov dh,ah
  mov ah,0
  mov bl,100
  mov bh,0
  cmp ax,bx
  jge divBy100
  
  mov bl,10
  div bl
  add al,30h
  
  add ah,30h
  lea si,results
 inc si
  mov [si],al
  inc si
  mov [si],ah 
     
   mov al,dh 
   mov ah,0
    mul bl
    mov bl,5
   div bl
   add al,30h
   inc si
   inc si
   mov [si],al


LEA SI,results
MOV AH,2
MOV CX,6
LOOP3:

MOV DL,[SI]
INT 21H
INC SI 
 LOOP LOOP3


   jmp ending
     
   divBy100:
   mov bl,100
   div bl
   add al,30h
   lea si,results
   mov [si],al
 MOV CH,AH
MOV AH,0
MOV AL, CH
MOV BL, 10
DIV BL
ADD AL,30H
ADD AH,30H
INC SI
MOV [SI],AL
INC SI
MOV [SI],AH


MOV AL,DH
MOV AH,0
MUL BL
MOV BL,5
DIV BL
ADD AL,30H
INC SI 
INC SI
MOV [SI] ,AL
 
LEA SI,results
MOV AH,2
MOV CX,6
LOOP4:

 MOV DL,[SI]
 INT 21H
 INC SI 
 LOOP LOOP4
ENDING :
  
ret

 inputDisp db "enter a temperature in c:"    
 input db '0','0'
 results db '0','0','0','.','0','0'