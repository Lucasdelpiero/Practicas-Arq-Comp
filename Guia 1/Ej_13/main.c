#include <stdio.h>
#include <stdlib.h>

const int MAX = 8;
char semana[8][16] ={
    "Nada",
    "Sabado",
    "Viernes",
    "Jueves",
    "Miercoles",
    "Martes",
    "Lunes",
    "Domingo"
};

void binario(int n, char *s){
    int i;
    for(i = 0; i < MAX; i++){
        s[MAX - 1 - i] = ((n >> i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    printf("numero binario: %s\n", s);

    return 0;
}

void escribirDias(char *s){
    int i;

    for(i = 1; i < MAX; i++){
        if (s[i] == '1'){
            printf("%s\n", semana[i]);
        }
    }
}

int main()
{
    int num = 10;
    char dias[9];
    printf("Ingrese numero: ej 10\n");
    scanf("%d", &num);
    dias[8] = '\0';
    binario(num, dias);
    escribirDias(dias);

    return 0;
}

/*
Realizar una función en C que recibe un byte (char), donde cada bit representa un día de
la semana (ver imágen), e imprima la descripción los días activos.
Si el bit tiene un 1 quiere decir que el día está activo, en caso contrario tiene un 0.
Por ejemplo: si ingresa 10 = 0x0A = 0b00001010 entonces escribe “Lunes” y “Miércoles
*/
