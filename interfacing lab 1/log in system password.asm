org 100h

lea si,disp
mov ah,2
mov cl,27

screen:
mov dl,[si]
int 21h
inc si
loop screen:

lea si,input
mov ah,1
mov cl,5

user:
int 21h
mov [si],al
inc si
loop user:

lea di,passcode
sub si,5 
mov cl,5

compare:
mov dl,[si]
mov al,[di]
cmp dl,al
jne denial
inc si
inc di
loop compare

mov ah,2
lea si,disp1
mov cl,15

permission:
mov dl,[si]
int 21h
inc si
loop permission
hlt

denial:

mov ah,2

lea si,disp2
mov cl,14

denied:
mov dl,[si]
int 21h
inc si
loop denied  
hlt

ret
passcode db "eshet" 
input db "00000"
disp db "please enter your password "  
disp1 db " access granted"
disp2 db " access denied"