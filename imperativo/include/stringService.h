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
    string tutorial;
    
    tutorial += "Uma versão adaptada do conhecido 'The wall'. O jogo é dividido em 3 rodadas, cada uma com 3 perguntas, mas cada rodada possuem suas pecularidades.\n";
    tutorial += "Funcionamento das rodadas: \n";
    tutorial += "\n- Rodada 1: \n\n";
    tutorial += "Será mostrado uma pergunta com duas alternativas, e caso o usuário acerte será sorteado um valor aleatório entre os valores: 1, 10, 1000, 3000, 5000, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado só que irá subtrair do valor obtido.\n";
    tutorial += "\n- Rodada 2: \n\n";
    tutorial += "Será mostrado as 4 alternativas, para o jogador verificar se conhece o assunto ou não e então, o sistema irá perguntar qual multiplicador ele deseja(dependendo de sua confiança em acertar): 1x ou 2x. E logo após, mostrará a pergunta. E Caso o usuário acerte será sorteado um valor aleatório entre os valores: 10, 100, 5000, 10000, 15000 e esse valor será multiplicado pelo multiplicador escolhido, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado e multiplicar pelo multiplicador, só que irá subtrair do valor obtido.\n";
    tutorial += "\n- Rodada 3: \n\n";
    tutorial += "Será mostrado as 4 alternativas, para o jogador verificar se conhece o assunto ou não e então, o sistema irá perguntar qual multiplicador ele deseja(dependendo de sua confiança em acertar): 1x, 2x ou 3x. E logo após, mostrará a pergunta. E Caso o usuário acerte será sorteado um valor aleatório entre os valores: 100, 1000, 75000, 15000, 25000 e esse valor será multiplicado pelo multiplicador escolhido, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado e multiplicar pelo multiplicador, só que irá subtrair do valor obtido.\n";
    tutorial += "\n\nPressione (c) para começar o jogo ou (v) para voltar ao menu: ";
    
    return tutorial;
}

void errouToString(long valorDaPergunta, int premioRodada, int saldoJogador, int rodada){

    cout << "\n                 VOCÊ ERROU!" << endl;
    cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
    if(rodada != 1){
        cout << "Por causa do seu multiplicador, você perdeu: " << premioRodada << endl;
    }
    cout << "Seu saldo atual é de: " << saldoJogador << endl;

}

void acertouToString(long valorDaPergunta, int premioRodada, int saldoJogador, int rodada){

    cout << "\n                 RESPOSTA CORRETA!" << endl;
    cout << "O sistema sorteou para essa pergunta, a premiação de: " << valorDaPergunta << endl;
    if(rodada != 1){
        cout << "Por causa do seu multiplicador, você ganhou: " << premioRodada << endl;
    }
    cout << "Seu saldo atual é de: " << saldoJogador << endl;

}
