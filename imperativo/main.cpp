#include <iostream>
#include <string>
#include <fstream>
#include <stdlib.h>
#include <time.h>

#include "include/numberService.h"
#include "include/stringService.h"
#include "include/fileService.h"

using namespace std;

void escolheOpcao(int op);
void comecaJogo();
void comoJogar();
int gerador();
int escolherMultiplicador();
void imprime(string s);
int getOpcao();

int main(){
    int op = 0;
    
    imprime(gerarMenuInicial());

    op = getOpcao();

    escolheOpcao(op);

    return 0;
}

int getOpcao(){
    int retorno;
    cin >> retorno;
    while(retorno != 1 && retorno != 2 && retorno!=3) {
        cout << "Opção incorreta, digite 1,2 ou 3" << endl;
        cin >> retorno;
    }
    return retorno;
}

void imprime(string msg){
    cout << msg;
}

void escolheOpcao(int op){
    if (op == 1) {
        comecaJogo();
    } else if (op == 2) {
        comoJogar();
    }
}

void comoJogar() {
    // TODO: Imprimir como o jogo funciona para o jogador.
    cout << "" << endl;
}

void comecaJogo() {
    cout << "O jogo vai iniciar\n";
    while(true) {
        int id = gerarRandon(50);
        carregarResposta(id);

        int multiplicador = escolherMultiplicador();
        long valorDaPergunta = buscaValorPremio();

        string resposta = carregarResposta(id);
        if (verificarResposta(id, resposta)) {
            // TODO: Caso 1: Jogador acertou a pergunta. Fazer a soma do valor arrecadado
            // mais o valor gerado vezes o multiplicador que ele escolheu.
        } else {
            // TODO: Caso 2: Jogador errou a pergunta. Fazer a subtração do valor arrecadado
            // menos o valor gerado vezes o multiplicador que ele escolheu.
        }
    }
}

int escolherMultiplicador() {
    // TODO: Fazer o jogador escolher entre 1x, 2x ou 3x.
    return 0;
}