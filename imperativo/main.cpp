#include <iostream>
#include <string>
#include <fstream>
#include <stdlib.h>
#include <time.h>

#include "include/numberService.h"
#include "include/stringService.h"
#include "include/fileService.h"

#include "nlohmann/json.hpp"

using namespace std;
using json = nlohmann::json;

void escolheOpcao(int op);
void comecaJogo();
void comoJogar();
int gerador();
int escolherMultiplicador();

int main(){
    int op = 0;
    op = gerarMenuInicial();
    while(op != 1 && op != 2) {
        cout << "Opção incorreta!" << endl;
        cin >> op;
    }
    escolheOpcao(op);

    return 0;
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
    cout << "O jogo vai iniciar";
    while(true) {
        int id = gerador();
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

int gerador() {
    srand((unsigned) time(NULL));
    int x = rand() % 50;
    return x;
}

int escolherMultiplicador() {
    // TODO: Fazer o jogador escolher entre 1x, 2x ou 3x.
    return 0;
}