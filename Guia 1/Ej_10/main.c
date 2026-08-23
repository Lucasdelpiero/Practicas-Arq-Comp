#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n = 0x02a3;
    printf("Numero: %04x\n", n);
    printf("a: %04x\n", n >> 8);
    printf("b: %04x\n", n & 0x00FF);
    printf("c: %04x\n", n & 0x0001);
    printf("d: %04x\n", (n >> 15) & 0x0001);
    printf("e: %04x\n", n >> 4);
    printf("e: %04x\n", n & 0x000F );

    return 0;
}

/*
Dado un número n de 16 bits, combine máscaras y desplazamientos necesarios para obtener:
a. El byte de la izquierda.
b. El byte de la derecha.
c. Devolver 1 si el número es impar, y 0 si es par.
d. Devolver -1 si el número es negativo, y 0 si es positivo.
e. Devolver el número que representan los primeros 12 bits
f. Devolver el número que representan los últimos 4 bits
Por ejemplo si n = 02A3; entonces a) 0002, b) 00A3, c) 0001, d) 0000, e) 002A, f) 0003
*/
