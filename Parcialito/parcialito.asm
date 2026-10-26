null equ -1
valorLista equ 0
datoLista equ 2
sigLista equ 6

clave equ 0
izq equ 2
der equ 6

; buscar
; push << puntero doble a lista >>
; push << valor >>
; call buscar
; add sp, 8
; devuelve en eax la lista con tal valor

BUSCAR:
push bp
mov bp, sp

push ebx            ; puntero a lista
push ecx            ; valor
push edx            ; puntero doble a lista

mov eax, null
mov ecx, [bp + 8]
mov ebx, [bp + 12]

cmp ebx, null       ; si no lo encuentro salgo
jz BUSCAR_FIN

cmp w[ebx], ecx
jz BUSCAR_ENCONTRADO
jmp BUSCAR_NO_ENCONTRADO

BUSCAR_ENCONTRADO:      ; ret = &(lista->dato)
mov eax, ebx            
add eax, datoLista
jmp BUSCAR_FIN

BUSCAR_NO_ENCONTRADO    ; sigo recorriendo
mov ebx,[ebx + sigLista]
push ebx
push ecx
call BUSCAR
add sp, 8
jmp BUSCAR_FIN          ; solo por dejar explicito que quiero ir ahi luego

BUSCAR_FIN:
pop ecx
pop ebx
mov sp, bp
pop bp
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; btn_list
; push << puntero doble arbol >>
; push << puntero simple a lista >>
; call btn_list
; add sp, 8
; desvincula arboles en tal lugar

BTN_LIST:
push bp
mov bp, sp
push eax        ; puntero a lista encontrada
push ebx        ; puntero simple a arbol
push ecx        ; valor a buscar
push edx        ; puntero doble a arbol
push efx        ; puntero a lista

mov edx, [bp + 12]
mov efx, [bp + 8]

mov ebx, [edx]
cmp ebx, null
jz BTN_FIN

;BTN_IZQ:               ; llamo recursivamente a izquierda
mov edx, ebx
add edx, izq
push edx
push efx
call BTN_LIST
add sp, 8

;BTN_DER:               ; llamo recursivamente a derecha
mov edx, ebx
add edx, der
push edx
push efx
call BTN_LIST
add sp, 8

;BTN_RESUELVO:          ; resuelvo a la vuelta
mov ecx, w[ebx + clave]
push efx
push ecx
call BUSCAR             ; eax = puntero a lista con tal valor o null si no lo encuentra
add sp, 8

cmp eax, null
jz BTN_NO_ENCUENTRA
jmp BTN_ENCUENTRA

BTN_NO_ENCUENTRA:       ; sigue de largo, no hace nada

BTN_ENCUENTRA:                  ; descenlace del arbol
mov [eax + datoLista], ebx      ; en el dato se pone un puntero simple al arbol
mov [edx], null                 ; se desvincula con el padre del que vino

BTN_FIN:
pop efx
pop edx
pop ecx
pop ebx
pop eax
mov sp, bp
pop bp
ret
