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
    cout << "O jogo vai iniciar, serão um total de 6 rodadas, boa sorte!" << endl;;
    int saldoJogador = 0;

    for(int i = 1; i <= 6; i++){
        int id = gerarRandon(50);
        imprime(carregarResposta(id));
        cout << "Escolha um multiplicador para a sua premiação (entre 1x, 2x ou 3x APENAS): ";
        int multiplicador = escolherMultiplicador();
        long valorDaPergunta = buscaValorPremio(i);
        int premioRodada = gerarValorPremio(multiplicador, valorDaPergunta);
        
        string resposta;
        imprime(carregarPergunta(id));
        cout << endl << "Digite sua resposta: ";
        cin >> resposta;
        
        
        if (verificarResposta(id, resposta)) {
            saldoJogador += premioRodada;
            cout << "RESPOSTA CORRETA!" << endl;
            cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
            cout << "Por causa do seu multiplicador, você ganhou: " << premioRodada << endl;
            cout << "Seu saldo atual é de: " << saldoJogador << endl;
        } else {
            saldoJogador -= premioRodada;
            if(saldoJogador < 0) saldoJogador = 0;
            cout << "VOCÊ ERROU!" << endl;
            cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
            cout << "Por causa do seu multiplicador, você perdeu: " << premioRodada << endl;
            cout << "Seu saldo atual é de: " << saldoJogador << endl;
        }
    }
    
}

int escolherMultiplicador() {
    string multiplicador = "";
    int result;

    while(multiplicador != "1x" && multiplicador != "2x" && multiplicador != "3x") {
        cin >> multiplicador;
       
        if(multiplicador == "1x"){
            result = 1;
        } else if(multiplicador == "2x"){
            result = 2;
        } else if(multiplicador == "3x") {
            result = 3;
        } else{
            cout << "Digite um valor de acordo com as opções dadas." << endl;
        }
    }

    return result;
}

