.model small
data segment
a db 11h,33h,99h,22h,44h
len equ($-a)
data ends
code segment
assume cs:code,ds:data
org 1000h
start: mov ax,data
mov ds,ax
mov bx,len
dec bx
outloop: mov cx,bx
lea si,a
inloop: mov al,a[si]
inc si
cmp al,a[si]
jnb nochange
xchg al,a[si]
mov a[si-1],al
nochange: loop inloop
dec bx
jnz outloop
mov ah,4ch
int 21h
code ends
end start
