#include <string>

#include "../nlohmann/json.hpp"
#include <cstdlib>

using json = nlohmann::json;
using namespace std;

string carregarPergunta(int rodada, int id){
    json perguntas;
    string saida = "";
    string path = "";
    path = "../dados/rodada" + to_string(rodada) + "/perguntas.json";

    ifstream i(path);
    i >> perguntas;
    saida = perguntas[to_string(id)].dump(4);
    return saida;
}

string carregarResposta(int rodada, int id) {
    string resposta = "";
    json alternativas;
    string path = "";

    path = "../dados/rodada" + to_string(rodada) + "/alternativas.json";

    ifstream i(path);
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

bool verificarResposta(int rodada, int id, string respostaJogador) {
    bool acertou = false;
    json resposta;
    string path = "";
    path = "../dados/rodada" + to_string(rodada) + "/respostas.json";

    ifstream i(path);
    i >> resposta;
    if (respostaJogador == resposta[to_string(id)]) {
        acertou = true;
    }

    return acertou;
}

int buscaValorPremio(int rodada,int id){   
    json valor;
    string path = "";
    path = "../dados/rodada" + to_string(rodada) + "/valores.json";
    
    ifstream i(path);
    i >> valor;    
    return valor[to_string(id)];
}
