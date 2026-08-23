#include <stdio.h>
#include <stdlib.h>

void devuelve(int dia, int mes, int anio, char *s){
    int i;
    for(i = 0; i < 5; i++){
        s[i] = ((dia >> (5 - 1 - i) ) & 0x01) + '0';
    }

    for(i = 5 ; i < 9; i++){
        s[i] = ((mes >> (9 - 1 - i) ) & 0x01) + '0';
    }

    for(i = 9 ; i < 16; i++){
        s[i] = ((anio >> (16 - 1 - i) ) & 0x01) + '0';
    }


    s[17] = '\0';

    if (anio <= 50) {
        anio += 2000;
    } else {
        anio += 1900;
    }
    printf("Fecha: %d-%d-%02d\n", anio, mes, dia);
}

int main()
{
    int dia = 9, mes = 12, anio = 18;
    char s[18] = "";

    printf("Ingrese dia o 0 para fecha default\n");
    scanf("%d", &dia);
    if (dia == 0) {
        dia = 9;
    } else {
        printf("Ingrese mes\n");
        scanf("%d", &mes);
        printf("Ingrese anio (0-99)\n");
        scanf("%d", &anio);
    }
    devuelve(dia, mes, anio, s);
    printf("Fecha cod: %s", s);
    return 0;
}

/*
Realizar una función en C que reciba día, mes y año como parámetros enteros y devuelva
un short int con la fecha codificada al igual que en el ejercicio anterior
*/
