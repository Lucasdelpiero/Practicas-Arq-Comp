null equ -1
valorArbol equ 0
hijosArbol equ 4
nodoArbol equ 0
sigArbol equ 4

arbolLista equ 0
sigLista equ 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;                                   BORAR DEL ARBOL Y SUMA EN EAX CANTIDAD DE BORRADOS
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; borrar_de_arbol
; push << puntero doble a tipo arbol x >>
; push << valor >>
; call borrar_de_arbol
; add sp, 8
; borra del arbol los nodos que tengan tal valor y suma en eax la cantidad de nodos borrados

BORRAR_DE_ARBOL:
push bp
mov bp, sp

push ebx    ; puntero a arbol x
push ecx    ; valor a borar de arboles
push edx    ; puntero doble a tipo arbol x
push eex    ; puntero al nodoX
push efx    ; puntero al nodoH

mov edx, [bp + 12]
mov ecx, [bp + 8]

BORR_CICLO:
mov ebx, [edx]
cmp ebx, null
jz BORR_FIN

cmp [ebx + valorArbol], ecx          
jz BORR_NODO_ACTUAL
jmp BORR_NO_BORRA

BORR_NODO_ACTUAL:                   ; edx no se mueve porque el primer hijo va a ocupar la posicion del actual
add eax, 1                          ; se suma 1 a la cantidad de borrados
mov eex, [ebx + hijosArbol]         ; eex : puntero nodoArbol al primer hijo
cmp eex, null
jz BORR_REEMPLAZO_NO_HIJOS          

BORR_REEMPLAZO_TIENE_HIJOS:         ; solo usado para describir mejor que hace
mov efx, [eex + nodoArbol]          ; efx : puntero al arbol del primer hijo
mov [ebx + valorArbol], [efx + valorArbol]    ; reemplazo el valor del nodo a borrar por el del primer hijo, no se necesita mas el efx

mov eex, [eex + sigArbol]           ; eex : puntero nodoArbol al segundo hijo
mov [ebx + hijosArbol], eex         ; el nodo "borrado" ahora tiene como primer hijo al segundo hijo antes de ser borrado
jmp BORR_CICLO ; 

BORR_REEMPLAZO_NO_HIJOS:            ; no tiene hijos entonces lo que apuntaba al arbol se le pone null
mov [edx], null
jmp BORR_FIN

BORR_NO_BORRA:      ; me meto a la lista de hijos y recorro llamando recursivamente
mov eex, [ebx + hijosArbol]         ; eex: puntero al primer hijo
cmp eex, null
jz BORR_FIN

BORR_RECORRIDO_LISTA_ARBOLES:
cmp eex, null                       ; si ya no tengo hijos por recorrer salgo
jz BORR_FIN

mov efx, eex                        ; efx: puntero doble al arbol del primer hijo
add efx, nodoArbol                  ; efx = &(nodoActual->nodoArbol)

push efx
push ecx
call BORRAR_DE_ARBOL:               ; suma en eax las veces que lo borra
add sp, 8

mov eex, [eex + sigArbol]           ; nodoActual = nodoActual->sig
jmp BORR_RECORRIDO_LISTA_ARBOLES

BORR_FIN:
pop efx
pop eex
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;                                   Recorre lista
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; recorre_lista
; push << puntero doble lista >>
; push << valor >>
; call recorre_lista
; add sp, 8
; devuelve en eax la cantidad de veces que se borro el valor en los arboles de la lista

RECORRE_LISTA:
push bp
mov bp, sp

push ebx         ; puntero al nodo de la lista
push ecx         ; puntero al siguiente de la lista (para cuando alla que borrar el nodo)
push edx         ; puntero doble al nodo de la lista
push eex         ; puntero doble al T_arbol ( x )
push efx         ; valor a borrar de los arboles

mov eax, 0          ; eax: cantidad de veces borrado
mov edx, [bp + 12] 
mov efx, [bp + 8]

REC_CICLO:
mov ebx, [edx]
cmp ebx, null
jz REC_FIN

mov eex, ebx           ; eex: puntero doble al arbol direccionado en ebx
add eex, arbolLista     ; eex = ebx pero se usa por claridad otro nodo

push eex                ; puntero doble al arbol guardado en la lista
push efx                ; valor a borrar en el arbol
call BORRAR_DE_ARBOL    ; me suma en eax la cantidad de veces que se borro el valor del nodo
add sp, 8

cmp [ebx + arbolLista], null    ; si el que se paso ahora tiene un arbol nulo entonces se borra el nodo de la lista
jz REC_BORRA_NODO_LISTA
jmp REC_NO_BORRA_NODO_LISTA

REC_BORRA_NODO_LISTA:           ; como se el valor al que apunta [edx] cambia en el sig ciclo se lee el nodo siguiente al actual
mov ecx, [ebx + sigLista]       ; por lo que no hay que desplazar edx
mov [edx], ecx
jmp REC_CICLO

REC_NO_BORRA_NODO_LISTA:
mov edx, ebx                    ; edx puntero doble al siguiente del nodo actual 
add edx, sigLista
jmp REC_CICLO

REC_FIN:
pop efx
pop eex
pop edx
pop ecx
pop ebx
mov sp, bp
pop bp
ret

