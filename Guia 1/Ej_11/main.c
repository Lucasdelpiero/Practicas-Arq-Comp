#include <stdio.h>
#include <stdlib.h>

//Como int usa 16 bits
void rellenar(int n, char * s) {

    int i;
    for(i = 0; i < 16; i++){
        s[15 - i] = ((n >> i) & 0x01) + '0';
    }
    s[16] = '\0';

    return 0;
}

int main()
{
    unsigned short int n;
    char s[17] = "\0"; // Necesita valor para tener todos los caracteres y el \null
    printf("Ingrese numero: \n");
    scanf("%d", &n);
    rellenar(n, &s);
    printf("%X = %s", n, s);
    return 0;
}

/*
Realizar una función en C, que reciba como parámetro un número entero (int nro) y un
string (char* s), y rellene el string con los caracteres ‘1’ o ‘0’ con la representación binaria
del número entero. Debe realizar la función utilizando máscaras y desplazamientos.
a. Verifique el resultado comparado con su representación hexadecimal
printf(“%X = %s”, nro, s);
*/
