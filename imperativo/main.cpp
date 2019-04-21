#include <iostream>
#include <string>
#include <set>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include "include/numberService.h"
#include "include/stringService.h"
#include "include/fileService.h"

using namespace std;

void escolheOpcao(int op);
void comecaJogo();
void comoJogar();
int gerador();
int escolherMultiplicador(int rodada);
void imprime(string s);
void telaInicialJogo(void);
int getOpcao();
void rodada1();
void rodada2();
void rodada3();
void errouToString(long valorDaPergunta,int premioRodada, int saldoJogador,int rodada);
void acertouToString(long valorDaPergunta,int premioRodada, int saldoJogador,int rodada);
void saiOuJogaNovamente();

int saldoJogador = 0;
set<int> perguntas_da_rodada;

int main(){
    int op = 0;
    
    // Loading, Logo e Menu do jogo.
    telaInicialJogo();

    op = getOpcao();

    escolheOpcao(op);

    return 0;
}

int getOpcao(){
    int retorno;
    cin >> retorno;
    while(retorno != 1 && retorno != 2 && retorno!=3) {
        cout << "Opção incorreta, digite 1, 2 ou 3" << endl;
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
    string opcao;
    imprime(tutorial());
    cin >> opcao;
    while((opcao != "v") && (opcao != "c")){
        imprime("Incorreto!\nPor favor tecle (c) para começar o jogo ou (v) para voltar: ");
        cin >> opcao;
    }

    if(opcao == "c"){
        comecaJogo();
    }else{
        imprime(gerarMenuInicial());
        int op = getOpcao();
        escolheOpcao(op);

    }
}

void comecaJogo() {

    imprime("O jogo vai iniciar, serão um total de 3 rodadas, boa sorte!\n");

    rodada1();
    rodada2();
    rodada3();
}

int escolherMultiplicador(int rodada) {
    string multiplicador = "";
    int result;
    if(rodada == 2){
        imprime("Escolha um multiplicador para a sua premiação (entre 1x ou 2x): ");
        while(multiplicador != "1x" && multiplicador != "2x") {
            cin >> multiplicador;
        
            if(multiplicador == "1x"){
                result = 1;
            } else if(multiplicador == "2x"){
                result = 2;
            } else{
                imprime("Digite um valor de acordo com as opções dadas.(1x e 2x)\n");
            }
        }
    } else if(rodada == 3){
        imprime("Escolha um multiplicador para a sua premiação (entre 1x, 2x ou 3x): ");
        while(multiplicador != "1x" && multiplicador != "2x" && multiplicador != "3x") {
            cin >> multiplicador;
        
            if(multiplicador == "1x"){
                result = 1;
            } else if(multiplicador == "2x"){
                result = 2;
            } else if(multiplicador == "3x") {
                result = 3;
            } else{
                imprime("Digite um valor de acordo com as opções dadas.(1x, 2x ou 3x)\n");
            }
        }
    }
    return result;
}

void rodada1(){
    imprime("\nA primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n\n");

    for(int i = 1; i <= 3; i++){
        int id = gerarRandon(12);

        while (perguntas_da_rodada.count(id) >= 1) {
            id = gerarRandon(12);
        }

        perguntas_da_rodada.insert(id);

        imprime("\n" + carregarPergunta(1,id));
        imprime("\n" + carregarResposta(1,id));
    
        long valorDaPergunta = buscaValorPremio(1,gerarRandon(4));
        int premioRodada = gerarValorPremio(1, valorDaPergunta);
        
        string resposta;
        cout << endl << "Digite sua resposta: ";
        cin >> resposta;
        
        if (verificarResposta(1,id, resposta)) {
            saldoJogador += premioRodada;
            acertouToString(valorDaPergunta,premioRodada,saldoJogador,1);
        } else {
            saldoJogador -= premioRodada;
            if(saldoJogador < 0) saldoJogador = 0;
            errouToString(valorDaPergunta,premioRodada,saldoJogador,1);
        }
    }

    perguntas_da_rodada.clear();
}

void rodada2(){
    imprime("\nA segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n\n");

    for(int i = 1; i <= 3; i++){
        int id = gerarRandon(16);

        while (perguntas_da_rodada.count(id) >= 1) {
            id = gerarRandon(16);
        }

        perguntas_da_rodada.insert(id);

        imprime("\n" + carregarResposta(2,id));
        int multiplicador = escolherMultiplicador(2);
        long valorDaPergunta = buscaValorPremio(2,gerarRandon(4));
        int premioRodada = gerarValorPremio(multiplicador, valorDaPergunta);
        
        string resposta;
        imprime(carregarPergunta(2,id));
        cout << endl << "Digite sua resposta: ";
        cin >> resposta;
        
        
        if (verificarResposta(2,id, resposta)) {
            saldoJogador += premioRodada;
            acertouToString(valorDaPergunta,premioRodada,saldoJogador,2);
        } else {
            saldoJogador -= premioRodada;
            if(saldoJogador < 0) saldoJogador = 0;
            errouToString(valorDaPergunta,premioRodada,saldoJogador,2);
        }   
    }

    perguntas_da_rodada.clear();
}

void rodada3(){
    imprime("\nA terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n\n");

    for(int i = 1; i <= 3; i++){
        int id = gerarRandon(20);

        while (perguntas_da_rodada.count(id) >= 1) {
            id = gerarRandon(20);
        }

        perguntas_da_rodada.insert(id);

        imprime("\n" + carregarResposta(3,id));
        int multiplicador = escolherMultiplicador(3);
        long valorDaPergunta = buscaValorPremio(3,gerarRandon(4));
        int premioRodada = gerarValorPremio(multiplicador, valorDaPergunta);
        
        string resposta;
        imprime(carregarPergunta(3,id));
        cout << endl << "Digite sua resposta: ";
        cin >> resposta;
        
        
        if (verificarResposta(3,id, resposta)) {
            saldoJogador += premioRodada;
            acertouToString(valorDaPergunta,premioRodada,saldoJogador,3);
        } else {
            saldoJogador -= premioRodada;
            if(saldoJogador < 0) saldoJogador = 0;
            errouToString(valorDaPergunta,premioRodada,saldoJogador,3);
        }
    }
    perguntas_da_rodada.clear();
    saiOuJogaNovamente();
    
}
void saiOuJogaNovamente(){
    cout << endl;
    cout << "Fim de Jogo!" << endl;
    cout << "Seu saldo final é de: " << saldoJogador << endl;
    cout << "Tecle (c) jogar novamente ou (s) para sair:" << endl;
    string opcao;
    cin >> opcao;
    while((opcao != "c") && (opcao != "s")){
        imprime("Incorreto!\nPor favor tecle (c) jogar novamente ou (s) para sair: ");
        cin >> opcao;
    }
    
    if(opcao == "c"){
        imprime(logoJogo());
        comecaJogo();
    }
}

void telaInicialJogo(){
    imprime("Aguardando carregamento do jogo...\n\n");
    sleep(2);
    imprime("Espere um momento por favor...\n\n");
    sleep(4);
    imprime("Tudo pronto! Hora de jogar!\n\n");
    imprime(logoJogo());
    imprime(gerarMenuInicial());
}
