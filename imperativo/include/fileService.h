#include <string>

#include "../nlohmann/json.hpp"
#include <cstdlib>

using json = nlohmann::json;
using namespace std;

string carregarPergunta(int id){
    json perguntas;
    string saida = "";
    ifstream i("../dados/perguntas.json");
    i >> perguntas;
    saida = perguntas[to_string(id)].dump(4);
    //cout << perguntas[to_string(id)].dump(4) << endl;
    return saida;
}

string carregarResposta(int id) {
    string resposta = "";
    json alternativas;
    ifstream i("../dados/alternativas.json");
    i >> alternativas;
    for(json::iterator it = alternativas[to_string(id)].begin(); it != alternativas[to_string(id)].end(); ++it) {
        resposta += "(";
        resposta += it.key();
        resposta += ") - ";
        resposta += it.value();
        resposta += "\n";   
    }

    return resposta;
}

bool verificarResposta(int id, string respostaJogador) {
    bool acertou = false;
    json resposta;
    ifstream i("../dados/respostas.json");
    i >> resposta[to_string(id)];
    if (respostaJogador == resposta) {
        acertou = true;
    }

    return acertou;
}

int buscaValorPremio(){
    json valor;
    ifstream i("../dados/valores.json");
    
    int id = rand() % 18; 
    i >> valor;

    return valor[to_string(id)];
}
