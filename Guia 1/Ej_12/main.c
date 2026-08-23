#include <stdio.h>
#include <stdlib.h>
#include <math.h>

const int MAX = 16;
const int MAX1 = 17;

void escribirBinario(char *s){
    int n = 0, i;
    for(i=0; i < MAX; i++){
        if (s[i] == '1'){
            n += pow(2, MAX - 1 - i);
        }
    }
    printf("Numero escrito es: -%d", n);
}

void suma1enbinario(char *s){
    int i;
    int carry = 0;
    if (s[15] == '0') {
        s[15] = '1';
    } else {
        i = 15;
        carry = s[i];
        while(s[i] == '1' && i > 0){
            s[i] = '0';
            i--;
        }
        s[i] = '1';
    }
    printf("Sumado 1: %s\n", s);
}

void invertir(char * s){
    char car = s[0];
    char ns[MAX1];
    ns[0] = s[0];
    int i = 0;
    while (s[i] != '\0') {
        car = s[i];
        if (car == '1'){
            car = '0';
        } else {
            car = '1';
        }
        ns[i] = car;
        i++;
    }
    ns[i] = '\0';

    printf("numero invertido: %s\n", ns);
    suma1enbinario(ns);
    escribirBinario(ns);
    return 0;
}

void binario(int n){
    char s[MAX1];
    int i;
    for(i = 0; i < MAX; i++){
        s[MAX - 1 - i] = ((n >> i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    printf("numero binario: %s\n", s);
    if (n < 0){
        invertir(s);
    }
    return 0;
}

int main()
{
    int n =-7;
    printf("Ingrese numero:\n");
    scanf("%d", &n);
    binario(n);
    return 0;
}

/*
Realizar un programa en C para verificar que la PC utiliza complemento a 2 para la
representación de números negativos.
*/
