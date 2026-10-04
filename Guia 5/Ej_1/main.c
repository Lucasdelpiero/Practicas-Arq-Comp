#include <stdio.h>
#include <stdlib.h>
#include "potencia.h"

int main()
{

    printf("Res: %d\n", potencia_iterativa(5,3));
    printf("Res: %d\n", potencia_recursiva(5,3));
    return 0;
}
