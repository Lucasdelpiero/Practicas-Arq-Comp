#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const int MAX = 18;

int carToInt(char * s){
    int n=0, i, tamanio = 0;
    int digitos[16];

    while (s[tamanio] != '\0' && tamanio < 14)
        tamanio++;

    for(i = 0; i < tamanio; i++){
        s[i] -= 0x30;
    }

    int res ;

    int total = 0;

    for(i = 0 ; i < tamanio; i++){
        int mult = 10;
        if (i == tamanio - 1) {
            mult = 1;
        } else {
            mult = 10;
            int o=1;
            while (o < tamanio - i - 1 ){
                mult *= 10;
                o++;
            }
        }
        res = s[i] * mult ;
        digitos[i] = res;
        total += digitos[i];
    }
    return total;


}

int main()
{
    int n = 9;
    int total;
    char s[18] = "78565";
    char c = 55;
    total = carToInt(s);
    printf("total: %d\n", total);
    return 0;
}

/*
Realizar una función en C para pasar un string ASCII a un integer, utilizando máscaras (no
utilizar funciones de librerías como atoi())
*/
