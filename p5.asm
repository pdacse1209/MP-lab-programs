.model small
.stack
.data
m1 db "current time:$"
m2 db 10,13,"current date:$"
hr db ?
min db ?
s db ?
day db ?
month db ?
year dw ?
.code
mov ax,@data
mov ds,ax
mov ah,2ch
int 21h
mov hr,ch
mov min,cl
mov s,dh
mov ah,2ah
int 21h
mov day,dl
mov month,dh
mov year,cx
lea dx,m1
mov ah,09
int 21h
mov cl,hr
mov ch,0
call disp
mov dl,':'
mov ah,2
int 21h
mov cl,min
mov ch,0
call disp
mov dl,':'
mov ah,02
int 21h
mov cl,s
mov ch,0
call disp
lea dx,m2
mov ah,09
int 21h
mov cl,day
mov ch,0
call disp
mov dl,'/'
mov ah,02
int 21h
mov cl,month
mov ch,0
call disp
mov dl,'/'
mov ah,02
int 21h
mov cx,year
call disp
mov ah,4ch
int 21h
disp proc
mov bx,0
n:mov al,bl
add al,1
daa
mov bl,al
jnc n1
add al,1
daa
mov bh,al
n1:loop n
mov dl,bl
and dl,0f0h
mov cl,4
shr dl,cl
add dl,30h
mov ah,02
int 21h
mov dl,bl
and dl,0fh
add dl,30h
int 21h
ret
disp endp
End