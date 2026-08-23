#include <stdio.h>
#include <stdlib.h>
const int MAX = 8;

void weekday_set(char *c, int num){
    *c |= (1 << num );
}

void weekday_reset(char *c, int num){
     *c &=  ~(1 << num);
}

int main()
{
    char c = '\0';
    int n;
    int opt = 1;

    while(opt == 1 || opt ==2){
        printf("Que desea hacer: 1=setear; 2=resetear; otro=salir\n");
        scanf("%d" , &opt);

        if (opt == 1){
            printf("Ingrese dia a setear: (0-6)\n");
            scanf("%d" , &n);
            weekday_set(&c, n);
        } else if (opt == 2){
            printf("Ingrese dia a resetear: (0-6)\n");
            scanf("%d" , &n);
            weekday_reset(&c, n);
        }
        printf("Dias en bin: %d\n", c);
    }
    return 0;
}

/*
Realizar una función “weekday_set” en C que reciba como parámetros: un puntero a char
y un número entero (de 0 a 6), y que configure en 1 el bit correspondiente al día de la
semana (siendo 0 domingo y 6 sábado) como en el ejercicio anterior. Del mismo modo,
escribir una función “weekday_reset”, con los mismos parámetros, para configurar el bit en
0
*/
