
int gerarRandon(int max){
    srand((unsigned) time(NULL));
    int x = rand() % max;
    return x;
}

int gerarValorPremio(int multiplicador, int premiacao){
    return multiplicador * premiacao;
}
