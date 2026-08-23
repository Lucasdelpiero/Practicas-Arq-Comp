#include <stdio.h>
#include <stdlib.h>
const int MAX = 8;

void weekday_set(char * c, int num){
    c[num] = '1';
    return 0;
}

void weekday_reset(char * c, int num){
    c[num] = '0';
    return 0;
}

void binario(int n, char *s){
    int i;
    for(i = 0; i < MAX; i++){
        s[MAX - 1 - i] = ((n >> i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    printf("numero binario: %s\n", s);

    return 0;
}

int main()
{
    char s[8] = "0000000\0";
    int n;
    int opt = 1;
    while(opt == 1 || opt ==2){
        printf("Que desea hacer: 1=setear; 2=resetear; otro=salir\n");
        scanf("%d" , &opt);

        if (opt == 1){
            printf("Ingrese dia a setear: (1-6)\n");
            scanf("%d" , &n);
            weekday_set(s, n);
        } else if (opt == 2){
            printf("Ingrese dia a resetear: (1-6)\n");
            scanf("%d" , &n);
            weekday_reset(s, n);
        }
        printf("%s \n", s);
    }
    printf("Dias en bin: %s\n", s);
    return 0;
}

/*
Realizar una función “weekday_set” en C que reciba como parámetros: un puntero a char
y un número entero (de 0 a 6), y que configure en 1 el bit correspondiente al día de la
semana (siendo 0 domingo y 6 sábado) como en el ejercicio anterior. Del mismo modo,
escribir una función “weekday_reset”, con los mismos parámetros, para configurar el bit en
0
*/
