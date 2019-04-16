#include <string>

#include "../nlohmann/json.hpp"
#include <cstdlib>

using json = nlohmann::json;
using namespace std;

string carregarPergunta(int rodada, int id){
    json perguntas;
    string saida = "";

    string path = "";
      switch (rodada){
        case 1:
            path = "../dados/rodada1/perguntas.json";
            break;
        case 2:
            path = "../dados/rodada2/perguntas.json";
            break;
        case 3:
            path = "../dados/rodada3/perguntas.json"; 
            break;
    }

    ifstream i(path);
    i >> perguntas;
    saida = perguntas[to_string(id)].dump(4);
    return saida;
}

string carregarResposta(int rodada, int id) {
    string resposta = "";
    json alternativas;

    string path = "";
      switch (rodada){
        case 1:
            path = "../dados/rodada1/alternativas.json";
            break;
        case 2:
            path = "../dados/rodada2/alternativas.json";
            break;
        case 3:
            path = "../dados/rodada3/alternativas.json"; 
            break;
    }

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
      switch (rodada){
        case 1:
            path = "../dados/rodada1/respostas.json";
            break;
        case 2:
            path = "../dados/rodada2/respostas.json";
            break;
        case 3:
            path = "../dados/rodada3/respostas.json"; 
            break;
    }

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
   
    switch (rodada){
        case 1:
            path = "../dados/rodada1/valores.json";
            break;
        case 2:
            path = "../dados/rodada2/valores.json";
            break;
        case 3:
            path = "../dados/rodada3/valores.json"; 
            break;
    }
    ifstream i(path);
    i >> valor;    
    return valor[to_string(id)];
}
