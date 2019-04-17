#include <string>
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

string tutorial(){
    string introducao, explicacao1, explicacao2, explicacao3, texto;

    introducao  = "    The System é um jogo de perguntas e respostas baseado no famoso 'The Wall'.\n";
    explicacao1 = "    O jogo consiste de três rodadas, cada uma contém três perguntas, sendo a primeira a mais simples, a segunda um pouco mais elaborada e por ultimo, a terceira rodada com questões mais interessantes :).\n\n";
    explicacao2 = "    Na primeira rodada o usurário poderá escolher entre 1x ou 2x para o multiplicador do prêmio\n";
    explicacao3 = "    A partir da segunda rodada o usuário receberá do The System as alternativas, e a partir do seu nível de confiança, decidirá\nentre um multiplicador alto ou baixo para a pergunta.\n    O jogo conta com um sistema aleatório para o valor do prêmio, ou seja, ninguem sabe qual o premio que você irá receber/perder após responder a pergunta.\n";
    texto = introducao + explicacao1 + explicacao2 + explicacao3 + "\n\n\n presione (c) para começar o jogo ou (v) para voltar ao menu: ";

    return texto;

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
