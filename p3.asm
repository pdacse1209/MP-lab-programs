.model small
data segment
s db "madam"
l dw $-s
rs db 10 dup(?)
m1 db "palindrome $"
m2 db"not palindrome $"
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov es,ax
mov cx,l
lea si,s
lea di,rs
add di,cx
dec di
b:mov al,[si]
mov [di],al
inc si
dec di
loop b
lea si,s
lea di,rs
cld
mov cx,l
repe cmpsb
jne np
lea dx,m1
mov ah,09h
int 21h
jmp d
np:lea dx,m2
mov ah,09h
int 21h
d:mov ah,4ch
int 21h
code ends
end start
