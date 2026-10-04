
int potencia_iterativa(int base, int exponente){
    int total = 1;
    for(exponente; exponente > 0; exponente--) // Asi me ahorro el declarar i
        total *=base;
    return total;
}

int potencia_recursiva(int base, int exponente){
    if (exponente == 0)
        return 1;
    else
        return base * potencia_iterativa(base, exponente - 1);
}
