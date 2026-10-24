null equ -1
valor equ 0
izq equ 2
der equ 6
; agregar nodo arbol
; push << head puntero doble >>
; push << nodo >>
; add sp, 8

ADD_NODO_ARBOL:
push bp
mov bp, sp
push ebx        ; puntero al nodo que comparo
push eax        ; nodo que quiero agregar
push edx        ; puntero doble

mov edx, [bp + 12]
mov eax, [bp + 8]

ADD_OTRO:
mov ebx, [edx]
cmp ebx, null   ; si el arbol esta vacio se agrega al principio
jz ADD_NODO

cmp w[eax + valor], w[ebx + valor]   si es menor va a la izq, si es mayor o igual va a der
jnn ADD_MUEVE_DER

ADD_MUEVE_IZQ:
mov edx, ebx
add edx, izq
jmp ADD_OTRO

ADD_MUEVE_DER:
mov edx, ebx
add edx, izq
jmp ADD_OTRO

ADD_NODO:
mov [edx], eax
pop edx
pop ebx
pop eax
mov sp, bp
pop bp
ret

