null equ -1
valor equ 0
izq equ 2
der equ 6
; in_order
; push << head >>
; add sp, 4
; recorre puntero in_order y lo imprime

IN_ORDER:
push bp
mov bp, sp
push eax
push ebx
push ecx
push edx

mov edx, [bp + 8]
mov ebx, [edx]

cmp ebx, null
jz IN_FIN

; recursivo a izquierda
mov eax, ebx
add eax, izq
push eax
call IN_ORDER
add sp,4

; printeo el valor actual
mov eax, 0x1
mov edx, ebx
ldh ecx, 2
ldl ecx, 1
sys 0x2

; recursivo a derecha
mov ecx, ebx
add ecx, der
push ecx
call IN_ORDER
add sp, 4

IN_FIN:
pop edx
pop ecx
pop ebx
pop eax
mov sp, bp
pop bp
ret