NULL EQU -1
SIZE EQU 6
VALOR EQU 0
SIG EQU 2

; ASCENDENTE
; PUSH << HEAD >>
; CALL ASCENDENTE
; ADD SP, 4
; devuelve en EAX si es ascendente o no (1 O 0)

ASCENDENTE:
PUSH BP
MOV BP, SP
PUSH EBX
PUSH ECX            ; ECX: ANTERIOR
PUSH EDX

MOV EBX, [BP + 8]   ; EDX: apunta al nodo de la cabeza

MOV EAX, 1          ; por defecto eax en 1 asi si la lista es nula, sale devolviendo true
CMP EBX, NULL
JZ FIN_ASCENDENTE

SUB SP, 4
MOV EDX, SP       ; creo variable local ant, esto es un puntero a la direccion en la pila

CICLO_ASCENDENTE:
MOV [EDX], EBX          ; lo que se guarda en la direccion de la variable local es la direccion del nodo anterior
MOV ECX, [EDX]          ; el nodo anterior va a ser lo que contiene la direccion en la variable local
MOV EBX, [EBX + SIG]

MOV EAX, 1              ; si L da null ya llego al final entonces devuelvo 1
CMP EBX, NULL           ; L == null
JZ FIN_ASCENDENTE

MOV EAX, 0              ; si sale pq es no esta ordenado devuelvo 0
CMP w[EBX + VAL], w[ECX + VAL]    ; actual - anterior; ant<= actual
JN FIN_ASCENDENTE

JMP CICLO_ASCENDENTE    ; parte while del do while

FIN_ASCENDENTE:
ADD SP, 4       ; ESTO POR LA VARIABLE LOCAL
POP EDX
POP ECX
POP EBX
MOV SP, BP
POP BP
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO B
; MAXIMO
; PUSH << HEAD PUNTERO DOBLE >>
; CALL MAXIMO
; ADD SP, 4
; devuelve en EAX el puntero doble al nodo  maximo

MAXIMO:
PUSH BP
MOV BP, SP
PUSH EBX
PUSH ECX            ; ECX: auxiliar para desarmar el doble puntero EAX
PUSH EDX
PUSH EEX            ; aux para obtener *max
PUSH EFX            ; puntero doble **max

MOV EDX, [BP + 8]   ; EDX: puntero doble al head
MOV EBX, [EDX]      ; EBX: puntero al nodo
MOV EAX, EDX        ; asi si la lista esta vacia ya devuelve el elemento este en el caso base

CMP EBX, NULL       ; caso base: *L == NULL
JZ FIN_MAXIMO

SUB SP, 4               ; Se reserva para la variable local maximo
MOV EFX, SP

MOV ECX, EBX            ; como el arg pide &(*L)->sig tengo que mandar la direccion del siguiente de EBX
ADD ECX, SIG            ; no el valor que hay en el campo siguiente del propio EBX
PUSH ECX
CALL MAXIMO             ; sino seria (*L)->sig en vez de &(*L)->sig
ADD SP, 4               ;            [EBX + SIG]          MOV ECX, EBX / ADD ECX, SIG

; ECX: MAX //  EBX: L
MOV [EFX], EAX      ; en la var local max, se guarda el puntero doble que obtuvo de la recursividad    

CMP [EAX], NULL         ; *max == NULL
JZ DEVUELVO_L_MAXIMO

MOV EEX, [EFX]      ; EEX: me desarma el doble nodo de la variable local y me da el nodo al que apunta EAX
MOV ECX, [EEX]      ; ECX: puntero al nodo que apunta EAX

CMP w[ECX + VAL], w[EBX + VAL]    ; si el max es mayor al actual ya esta en EAX max asi que se pasa al final
JP FIN_MAXIMO

DEVUELVO_L_MAXIMO:
MOV EAX, EDX                    ; si no es mayor, se pone en EAX el puntero doble que se ingresa en la funcion

FIN_MAXIMO:
POP EFX
POP EEX
POP EDX
POP ECX
POP EBX
MOV SP, BP
POP BP
RET



