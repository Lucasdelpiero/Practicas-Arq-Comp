null equ -1
valor equ 0
sig equ 2

; push << doble puntero a head >>
; call invertir
; add sp, 4
; la cabeza queda apuntando al ultimo elemento de la lista original

invertir:
push bp
mov bp, sp
push ebx                ;nodo izq
push ecx                ;nodo der
push edx
push efx                ;nodo temp


; Caso del primer nodo
mov edx, [bp + 8]       ; edx: doble puntero
mov ebx, [edx]          ; ebx: puntero a nodo izq
cmp ebx, null           ; compruebo que la lista no este vacia
jz INV_LISTA_VACIA
mov ecx, [ebx + sig]    ; ecx: puntero a nodo der
mov [ebx + sig], null   ; nodo izq apunta a null


; Otros casos
INV_OTRO:
cmp ecx, null
jz INV_ULTIMO_NODO
mov efx, [ecx + sig]        ; efx: temp guardo el sig del nodo der
mov [ecx + sig], ebx        ; nodo der apunta a izq

mov ebx, ecx            ; acomodamos el nodo izquierdo y derecho
mov ecx, efx
JMP INV_OTRO

; Ultimo nodo
INV_ULTIMO_NODO
mov [edx], ebx              ; la cabeza pasa a ser el ultimo
INV_LISTA_VACIA:
pop efx
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
RET
