#include <string>

#include "../nlohmann/json.hpp"

using json = nlohmann::json;
using namespace std;

void carregarPergunta(int id){
    json perguntas;
    ifstream i("../dados/perguntas.json");
    i >> perguntas;
    cout << perguntas[to_string(id)].dump(4) << endl;

}

string carregarResposta(int id) {
    string resposta;
    json alternativas;
    ifstream i("../dados/alternativas.json");
    i >> alternativas;
    for(json::iterator it = alternativas[to_string(id)].begin(); it != alternativas[to_string(id)].end(); ++it) {
        cout << "(" << it.key() << ") - " << it.value() << endl;  
    }
    cout << "Digite sua resposta: " << endl;
    cin >> resposta;
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

long buscaValorPremio(){
    json valor;
    ifstream i("../dados/valores.json");
    srand((unsigned) time(NULL));
    int id = rand() % 50;
    i >> valor;

    return valor[to_string(id)];
}
