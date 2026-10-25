; BORRAR_NODO
NODO_SIZE EQU 8
NULL EQU -1
VAL EQU 0
SIG EQU 4

; PUSH <<VALOR_A_REMOVER>>      ; EAX
; PUSH <<PUNTERO_DOBLE>>        ; EDX Y EBX AUXILIAR
; CALL BORRAR
; ADD SP,4                      
; Remueve el valor del primero que tiene ese valor

BORRAR:
PUSH BP
MOV BP, SP
PUSH EAX        ; EAX: VALOR
PUSH EBX        ; EBX: nodo encontrado
PUSH ECX        ; ECX: nodo siguiente
PUSH EDX        ; EDX: apunta a enlace que contiene la direccion del nodo actual

MOV EAX, [BP + 12]  ; EAX = VALOR_A_REMOVER
MOV EDX, [BP + 8]   ; EDX = DOBLE PUNTERO_DOBLE

CICLO_BORRAR:
MOV EBX, [EDX]          ; EBX = PUNTERO A NODO

CMP EBX, NULL
JZ FIN_BORRAR           ; llegamos al final 

CMP [EBX + VAL], EAX    ; nodo.valor - valor 
JZ ENCONTRADO          ; encontramos el valor

MOV EDX, EBX        ; EDX apunta al nodo actual
ADD EDX, SIG        ; EDX apunta apunta a su sig

JMP CICLO_BORRAR

ENCONTRADO:
MOV ECX, [EBX + SIG]    ; ECX = siguiente                       ; nodoSiguiente = nodoActual->sig
MOV [EDX], ECX          ; el enlace saltea el nodo actual       ; nodoAnterior->sig = nodoSiguiente

; EDX apunta al enlace que apunta al nodo actual (EBX).
; ECX obtiene el puntero al nodo siguiente.
; Al guardar ECX en [EDX], el enlace saltea el nodo actual.
;
; Antes:
; nodoAnterior: (VAL | SIG) ---> nodoActual (EBX) ---> nodoSig (ECX)
;
; Después:
; nodoAnterior: (VAL | SIG) -----------------------> nodoSig (ECX)

FIN_BORRAR:
POP EDX
POP EBX
POP ECX
POP EAX
MOV SP, BP
POP BP
RET
