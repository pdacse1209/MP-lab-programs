.model small
data segment
s1 db "enter n:$"
s2 db 10,13,"enter r: $"
s3 db 10,13,"error n<r $"
s4 db 10,13, "ncr:$"
n db ?
r db ?
nn db ?
rr db ?
diff db ? 
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
lea dx,s1
mov ah,09h
int 21h
mov ah,1h 
int 21h
sub al,30h
mov n,al
mov ch,0h
mov cl,n
mov ax,1h
call fact
mov nn,al
lea dx,s2
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov r,al
mov ah,n
cmp ah,al
jb pe
mov ch,0h
mov cl,r
mov ax,01h
call fact
mov rr,al
mov ah,n
mov al,r
sub ah,al
mov diff,ah
mov ax,1h
mov ch,0h
mov cl,diff
call fact
mov cl,rr
mul cl
mov cl,al
mov al,nn
div cl
aam
mov bx,ax
lea dx,s4
mov ah,09h
int 21h
add bx,3030h
mov dl,bh
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
jmp exit
pe:
lea dx,s3
mov ah,09h
int 21h
exit:
mov ah,4ch
int 21h
fact proc
cmp cl,0h
je f0
f:
mul cl
loop f
ret
f0:
ret
fact endp
code ends
end start