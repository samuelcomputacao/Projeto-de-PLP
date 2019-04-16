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

string imprimirPergunta(string pergunta[3][4]){
   
}

string capturarResposta(){

}