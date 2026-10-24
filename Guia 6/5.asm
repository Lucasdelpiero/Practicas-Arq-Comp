\\include "list.asm"
NULL EQU -1
SIZE EQU 6
VALOR EQU 0
SIG EQU 2

; COMBINA_LISTA_NUEVA
; PUSH << LISTA_1 >>
; PUSH << LISTA_2 >>
; CALL COMBINA_LISTA_NUEVA
; ADD SP, 8
; devuelve en EAX el puntero a la cabeza de la lista nueva  (esto sirve porque asi se puede comprobar si esto es null)

COMBINA_LISTA_NUEVA:
PUSH BP
MOV BP, SP
PUSH EBX        ; EBX: LISTA_1
PUSH ECX        ; ECX: LISTA_2
PUSH EDX        ; EDX: puntero al doble principio de la nueva lista

MOV EBX, [BP + 12]
MOV ECX, [BP + 8]

SUB SP, 4   
MOV EDX, SP     ; se crea variable local para guardar el doble puntero     Lista nueva_lista
MOV [EDX], NULL ; se inicializa la variable                                Lista nueva_lista = null ; asi sabe que es null y agrega al primero

COM_CICLO:
CMP EBX, NULL
JZ COM_VERIFICA_SOLO_LISTA_2

; SI EBX no es nulo se hace comparacion doble
CMP ECX, NULL
JZ COM_INSERTA_1

CMP w[EBX + VALOR], w[ECX + VALOR]
JP COM_INSERTA_2

COM_INSERTA_1:
PUSH w[EBX + VALOR]     ; CREO UN NUEVO NODO
CALL nodo_nuevo
ADD SP, 4

PUSH EAX                ; AGREGO A LA LISTA AL NUEVO NODO
PUSH EDX
CALL insert_nodo
add  sp, 8
MOV EBX, [EBX + SIG]

JMP COM_SIG_CICLO

COM_VERIFICA_SOLO_LISTA_2:
CMP ECX, NULL               ; si ambos son nulos se termina
JZ COM_FIN          

COM_INSERTA_2:              ; si solo queda la lista 2 o si 2 es menor entonces se inserta el del 2
PUSH w[ECX + VALOR]     ; CREO UN NUEVO NODO
CALL nodo_nuevo
ADD SP, 4

PUSH EAX                ; AGREGO A LA LISTA AL NUEVO NODO
PUSH EDX
CALL insert_nodo
add  sp, 8
MOV ECX, [ECX + SIG]

JMP COM_SIG_CICLO

COM_SIG_CICLO:
    JMP COM_CICLO

COM_FIN:
MOV EAX, [EDX]
POP EDX
POP ECX
POP EBX
MOV SP, BP
POP BP
RET