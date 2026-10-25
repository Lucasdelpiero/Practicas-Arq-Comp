\\ include "BORRAR_NODO.ASM"
null equ -1
valor equ 0
izq equ 2
der equ 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;                                                   BUSQUEDA DEL NODO
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; buscar_nodo
; push << puntero doble >>
; push << valor >>
; call buscar_nodo
; add sp, 8
; devuelve en eax 1 si lo encontro y 2 si nodo

BUSCAR_NODO:
push bp
mov bp, sp
push ebx    ; puntero nodo
push ecx    ; valor
push edx    ; puntero doble
push efx    ; hijo al que voy

mov edx, [bp + 12]
mov ebx, [edx]
mov ecx, [bp + 8]

cmp ebx, null
jz NO_ESTA:

cmp ecx, [ebx + valor]:
jz ESTA
jp BUSCAR_DER
jn BUSCAR_IZQ           ; innecesario pero agrega claridad 

BUSCAR_IZQ:
mov efx, ebx
add efx, izq
push efx
push ecx
call BUSCAR_NODO
add sp, 8
jmp BUSCAR_NODO_FIN

BUSCAR_DER:
mov efx, ebx
add efx, der
push efx
push ecx
call BUSCAR_NODO
add sp, 8
jmp BUSCAR_NODO_FIN

ESTA:
mov eax, 1
jmp BUSCAR_NODO_FIN

NO_ESTA:
mov eax, 0
jmp BUSCAR_NODO_FIN

BUSCAR_NODO_FIN:
pop efx
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;                                               RECORRIDO DE LA LISTA
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

valLista equ 0
sigLista equ 4
encontrado equ 1
noEncontrado equ 0

; elimina_presentes_en_arbol
; push << puntero doble lista >>
; push << puntero doble arbol >>
; call elimina_presentes_en_arbol
; add sp, 8
; se borran de la lista los valores que esten en el arbol

ELIMINA_PRESENTES_EN_ARBOL:
push bp
mov bp, sp
push eax        ; si esta o no presente el valor en la lista
push ebx        ; puntero a nodo de lista   y que si encuentro es al que borro
push ecx        ; nodo siguiente del que quiero borrar
push edx        ; doble puntero a lista
push eex        ; puntero doble al arbol
push efx        ; valor al que quiero buscar en la lista

mov edx, [bp + 12]
mov eex, [bp + 8]

cmp [eex], null     ; si el arbol esta vacio salgo
jz ELI_FIN

ELI_CICLO:
mov ebx, [edx]
cmp ebx, null
jz ELI_FIN

mov ecx, [ebx + valLista]  ; guardo valor a buscar en arbol
push eex
push ecx
call BUSCAR_NODO        ; tengo en eax 1 o 0 dependiendo si lo encontro o no
add sp, 8

cmp eax, encontrado
jz ELI_ENCONTRADO              
jmp ELI_NO_ENCONTRADO       

ELI_ENCONTRADO:
mov ecx, [ebx + sigLista]   ; nodoSig = nodoActual->sig
mov [edx], ecx              ; nodoAnterior = nodoSig        
JMP ELI_CICLO               ; al siguiente ciclo mov ebx, [edx] agarra al ecx = nodoSig ///  POR ESO NO MUEVO EDX 

ELI_NO_ENCONTRADO:          ; me muevo al nodo siguiente 
mov edx, ebx
add edx, sigLista       
JMP ELI_CICLO

ELI_FIN:
pop efx
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp 
ret


