#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const int MAX = 18;


void binario(int n){
    char s[18] = "";
    int i;
    for(i = 0; i < MAX; i++){
        s[i] = ((n >> MAX - 1 - i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    //printf("numero binario: %s\n", s);
}

int carToInt(char * s){
    int n=0, i, tamanio = 0;
    int digitos[16];

    //printf("str: %s\n", s);

    while (s[tamanio] != '\0' && tamanio < 14)
        tamanio++;

    //printf("tamanio: %d\n", tamanio);

    for(i = 0; i < tamanio; i++){
        s[i] -= 0x30;
    }
    for(i = 0; i < tamanio; i++){
        //printf("c: %x\n", s[i]);
    }

    for(i = 0; i < tamanio; i++){
        binario(s[i]);
    }

    int res ;

    int total = 0;

    for(i = 0 ; i < tamanio; i++){
        //printf("num: %d\n", s[i]);
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
        //printf("mult: %d\n", mult);
        //printf("res: %d\n", res);
        digitos[i] = res;
        //printf("Digito %d: %d\n", i, digitos[i]);
        total += digitos[i];


    }
    //printf("numeros: %s\n", s);
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
