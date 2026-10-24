null equ -1
dato equ 0
izq equ 2
der equ 6

; suma hijos
; push << puntero doble >> 
; add sp, 4
; devuelve en eax si todos los nodos que tienen hijos tienen de valor la suma de estos

SUMA_HIJOS:
push bp
mov bp, sp
push ebx        ; nodo actual
push ecx        ; hijo izq
push edx        ; doble puntero
push eex        ; hijo der
push efx        ; auxiliar

mov eax, 1          ; res = 1
mov edx, [bp + 8]
mod ebx, [edx]

sub sp, 2           ; short int suma
mov [bp - 22], 0     ; suma = 0

cmp ebx, null
jz SH_FIN

mov ecx, ebx    ; nodo izq y nodo der
mov eex, ebx
add ecx, izq
add eex, der

mov efx, [ecx]      ; efx: guarda resultado del and
or efx, [eex]       ; si ambos son null lo salteo
cmp efx, null
jz SH_FIN

; Aca el nodo no es nulo y al menos uno de sus hijos no es nulo

mov efx, [ecx]      ; no uso mas efx puedo hacer que apunte al nodo izq
cmp efx, null
jz NO_SUMA_IZQ
add w[bp - 22], w[efx + dato]

NO_SUMA_IZQ:

mov efx, [eex]      ; no uso mas efx puedo hacer que apunte al nodo der
cmp efx, null
jz NO_SUMA_DER
add w[bp - 22], w[efx + dato]

NO_SUMA_DER:

; Ultima linea
; suma a derecha
push eex            ; luego no uso mas eex
call SUMA_HIJOS
add sp, 4           ; tiene en eax si son todos iguales
mov eex, eax        ; eex: contiene si sus hijos son su suma

push ecx            ; luego no uso mas ecx
call SUMA_HIJOS
add sp, 4           ; tiene en eax si son todos iguales
mov ecx, eax        ; ecx: contiene si sus hijos son su suma

and ecx, eex        ; ecx: si izq y der son la suma de sus hijos

mov eax, 1          ; por defecto son iguales y sino se le sobreescribe el 0
cmp w[ebx + dato], w[bp - 22]     ; a->dato == suma
jz SH_SON_IGUALES
mov eax, 0          ; si no son iguales se pone un cero

SH_SON_IGUALES:
and eax, ecx        ; si a->dato == suma && suma por izq && suma por der    

SH_FIN:
add sp, 2           ; libero la variable local
pop efx
pop eex
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
ret