null equ -1
valor equ 0
izq equ 2
der equ 6

; altura arbol   
; eax debe valer 0 antes de llamar a la funcion 
; push << puntero doble >>
; push << nivel actual >>
; add sp, 8
; devuelve en eax el nivel del arbol

NIVEL_ARBOL:
push bp
mov bp, sp
push ebx        ; puntero nodo actual
push ecx        ; puntero nodo izq
push edx        ; puntero doble
push eex        ; puntero nodo der
push efx        ; sig nivel valor

mov edx, [bp + 12]
mov ebx, [edx]

cmp ebx, null   ; caso base
jz NIVEL_FIN

cmp eax, [bp + 8]       ; si nivel_max <= nivel_actual no lo actualizo
jnn NIVEL_NO_ACTUALIZA

mov eax, [bp + 8] ; se actualiza el valor del nivel mas alto

NIVEL_NO_ACTUALIZA:
mov ecx, ebx
add ecx, izq        ; nodo a izq
mov eex, ebx
add eex, der        ; nodo a der
mov efx, [bp + 8]
add efx, 1          ; sig_nivel = nivel_actual + 1

; Recursivo izquierda
push ecx
push efx
call NIVEL_ARBOL
add sp, 8

; Recursivo derecha
push eex
push efx
call NIVEL_ARBOL
add sp, 8

NIVEL_FIN:
pop efx
pop eex
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
ret