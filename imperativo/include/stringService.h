#include<string>
using namespace std;

string gerarMenuInicial(){
    string retorno = "";
    retorno += "Escolha uma opção: \n";
    retorno += "1) Iniciar novo jogo\n";
    retorno += "2) Tutorial\n";
    retorno += "3) Sair\n\n";
    return retorno;
}

string logoJogo(){
    string resultado, primeiraLinha, segundaLinha, terceiraLinha, quartaLinha, quintaLinha;
    primeiraLinha = "  ________  ________   _______  _____________________  ___\n";
    segundaLinha  = " /_  __/ / / / ____/  / ___/\\ \\/ / ___/_  __/ ____/  |/  /\n";
    terceiraLinha = "  / / / /_/ / __/     \\__ \\  \\  /\\__ \\ / / / __/ / /|_/ /\n";
    quartaLinha   = " / / / __  / /___    ___/ /  / /___/ // / / /___/ /  / /\n";
    quintaLinha   = "/_/ /_/ /_/_____/   /____/  /_//____//_/ /_____/_/  /_/\n\n\n\n";

    resultado = primeiraLinha + segundaLinha + terceiraLinha + quartaLinha + quintaLinha;

    return resultado;
}

void errouToString(long valorDaPergunta,int premioRodada, int saldoJogador,int rodada){

    cout << "\n                 VOCÊ ERROU!" << endl;
    cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
    if(rodada != 1){
        cout << "Por causa do seu multiplicador, você perdeu: " << premioRodada << endl;
    }
    cout << "Seu saldo atual é de: " << saldoJogador << endl;

}

void acertouToString(long valorDaPergunta,int premioRodada, int saldoJogador,int rodada){

    cout << "\n                 RESPOSTA CORRETA!" << endl;
    cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
    if(rodada != 1){
        cout << "Por causa do seu multiplicador, você ganhou: " << premioRodada << endl;
    }
    cout << "Seu saldo atual é de: " << saldoJogador << endl;

}
