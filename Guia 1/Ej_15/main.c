#include <stdio.h>
#include <stdlib.h>
const int MAX = 16;

void binario(int n, char *s){
    int i;
    for(i = 0; i < MAX; i++){
        s[MAX - 1 - i] = ((n >> i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    printf("numero binario: %s\n", s);

    return 0;
}

void escribeFecha(int n){
    int anio = n / 10000;
    //printf("anio: %d\n", anio);
    int mes = n / 100;
    mes = mes % (anio * 100);
    //printf("mes: %d\n", mes);

    int dia = n % ((n / 100) * 100);
    //printf("dia: %d\n", dia);
    char s[18] = "";

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
    printf("Binario: %s\n", s);

    if (anio <= 50) {
        anio += 2000;
    } else {
        anio += 1900;
    }
    printf("Fecha: %d-%d-%02d", anio, mes, dia);
}

int main()
{
    unsigned int fecha = 181209;
    printf("%d\n", fecha);
    escribeFecha(fecha);
    return 0;
}

/*
Realizar una función en C en la cual ingresa un valor entero de 2 bytes (short int),
donde se codifica una fecha, e imprima la misma en formato ISO 8601 (YYYY-MM-DD).
Los 2 bytes (16 bits) se utilizan del siguiente modo para codificar la fecha: los 5 bits más
significativos para el día (de 1 a 31), seguidos de 4 bits para el mes (de 1 a 12) y los 7 bits
menos significativos para el año (de 0 a 99). Si el año es mayor a 50, se asume que está
entre 1950 y 1999, si es menor a o igual a 50, se considera como del 2000 al 2050.
*/
