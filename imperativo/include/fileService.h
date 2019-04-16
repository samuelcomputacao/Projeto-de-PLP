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
    i >> resposta;
    if (respostaJogador == resposta[to_string(id)]) {
        acertou = true;
    }

    return acertou;
}

int buscaValorPremio(int rodada){
    srand((unsigned)time(0));
    json valor;
    ifstream i("../dados/valores.json");
    i >> valor;
    int id;
    
    if(rodada <= 2){
        id = rand() % 4;
    } else if(rodada <= 4){
        id = rand()%(9-5+1) + 5; 
    } else{
        id = rand()%(14-10+1) + 10; 
    }
    
    return valor[to_string(id)];
}
