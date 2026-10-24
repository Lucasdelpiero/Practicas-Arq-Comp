VAL EQU 0
SIG EQU 4
NULL EQU -1
; BUSCAR
; PUSH << VALOR >>
; PUSH << PUNTERO DOBLE >>
; CALL BUSCAR_NODO
; ADD SP, 8
; DEVUELVE EN EAX EL PUNTERO

BUSCAR_NODO:
PUSH BP
MOV BP, SP
PUSH EBX    ; EBX : VALOR
PUSH ECX    ; ECX : Nodo actual
PUSH EDX    ; EDX : puntero doble

MOV EAX, NULL
MOV EBX, [BP + 12]
MOV EDX, [BP + 8]

CICLO_BUSCAR:
MOV ECX, [EDX]

CMP ECX, NULL           ; llega al final de la lista
JZ FIN_BUSCAR_NODO

CMP [ECX + VAL], EBX    ; valor no existe en lista ordenada
JP FIN_BUSCAR_NODO

CMP [ECX + VAL], EBX    ; si lo encuentra sale del ciclo
JZ BUSCAR_ENCONTRO

MOV EDX, ECX             
ADD EDX, SIG            ; se le asigna el sig del nodo en este ciclo
JMP CICLO_BUSCAR        ; sino pasa al siguiente

BUSCAR_ENCONTRO:
MOV EAX, ECX

FIN_BUSCAR_NODO:
POP EDX
POP ECX
POP EBX
MOV SP, BP
POP BP
RET



