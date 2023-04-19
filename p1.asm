.model small
print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
data segment
array dw 1111h,2222h,3333h,3344h,4455h
len equ($-array)
key dw 2221h
msg1 db "key found $"
msg2 db "key not found $"
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
lea si,array
mov cx,len
mov bx,key
next:mov ax,[si]
cmp ax,bx
je found
inc si
dec cx
jnz next
jne nf
nf:print msg2
jmp exit
found:print msg1
exit:mov ah,4ch
int 21h
code ends
end start
