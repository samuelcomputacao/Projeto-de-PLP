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

    tutorial += "O 'The System' é uma versão adaptada do conhecido 'The Wall'. O jogo é dividido em 3 rodadas, com 3 perguntas cada, mas cada rodada possui suas peculiaridades.\n";
    tutorial += "Funcionamento das rodadas: \n";
    tutorial += "\n- Rodada 1: \n\n";
    tutorial += "Será mostrado ao jogador uma pergunta com duas alternativas, em seguida será sorteado um valor aleatório entre os valores: 1, 10, 1000, 3000, 5000. Caso o jogador acerte a pergunta esse valor sorteado será adicionado a seu saldo obtido até o momento, caso contrário será subtraído.\n";
    tutorial += "\n- Rodada 2: \n\n";
    tutorial += "Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x ou 2x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 10, 100, 5000, 10000, 15000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído.\n";
    tutorial += "\n- Rodada 3: \n\n";
    tutorial += "Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x, 2x ou 3x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 100, 1000, 15000, 25000, 75000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído.\n";
    tutorial += "\n\nPressione (c) para começar o jogo ou (v) para voltar ao menu: ";

    
    return tutorial;
}

string errouToString(long valorDaPergunta, int premioRodada, int saldoJogador, int rodada){
    string saida;
    saida += "\n                 VOCÊ ERROU!\n";
    saida += "O sistema sorteou para essa pergunta, a premiação de: ";
    saida += to_string(valorDaPergunta);
    if(rodada != 1){
        saida += "\nPor causa do seu multiplicador, você perdeu: ";
        saida += to_string(premioRodada);
        saida += "\n";
    }
    saida += "\nSeu saldo atual é de: ";
    saida += to_string(saldoJogador);
    saida += "\n";

    return saida;
}

string acertouToString(long valorDaPergunta, int premioRodada, int saldoJogador, int rodada){
    string saida;
    saida += "\n                 RESPOSTA CORRETA!\n";
    saida += "O sistema sorteou para essa pergunta a premiação de: ";
    saida += to_string(valorDaPergunta);
    if(rodada != 1){
        saida += "\nPor causa do seu multiplicador, você ganhou: ";
        saida += to_string(premioRodada);
        saida += "\n";
    }
    saida += "\nSeu saldo atual é de: ";
    saida += to_string(saldoJogador);
    saida += "\n";

    return saida;
}

string contaPerguntaToString(int rodada) {
    string saida;
    saida = "\nPergunta ";
    saida += to_string(rodada);
    saida += "\n";

    return saida;
}
