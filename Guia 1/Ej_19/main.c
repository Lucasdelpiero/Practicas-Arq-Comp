#include <stdio.h>
#include <stdlib.h>



int operacion0(int op, int a, int b){
    printf("%d %d %d\n", op, a, b);
}



int operacion(int op, int a, int b){
}

int main()
{
    int num;
    int funciones[5];
    int (*fp)(int);         // Declara funcion a puntero

    int fp = &operacion0;  // Puntero apunta a operacion 0
    num = fp(*fp)(0,5,3);

    printf("Hello world!\n");
    return 0;
}

/*
Realizar un programa (op.exe) en C que reciba 3 argumentos: número de operación
(obligatorio), valor A (obligatorio) y valor B (opcional) e imprima el resultado de la
operación: 0 => A + B; 1 => A & B; 2 => A; 3=> ~A. El programa no debe tener
sentencia if ni switch para elegir la función, sino que debe utilizar punteros a funciones.
*/
