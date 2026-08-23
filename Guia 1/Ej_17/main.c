#include <stdio.h>
#include <stdlib.h>
// restarle 10 en hexa a cada caracter

const int MAX = 8;
void binario(int n, char *s){
    int i;
    for(i = 0; i < MAX; i++){
        s[i] = ((n >> MAX - 1 - i) & 0x01) + '0';
    }
    s[MAX] = '\0';
    printf("numero binario: %s\n", s);

    return 0;
}

void mayus(char *s) {
    int i = 0;
    while (s[i] != '\0'){
        s[i] -= 0x20;
        i++;
    }
}

int main()
{
    char s[16] = "alfonso";
    printf("Ingrese palabra en minuscula\n");
    scanf("%s", s);
    mayus(s);
    printf("Mayuscula: %s\n", s);
    return 0;
}

/*
Realizar una función en C para pasar un string ASCII a mayúsculas, utilizando máscaras y
aprovechando la codificación ASCII (no utilizar la función de librerías como toupper() o
strupr()).
*/
