#include <iostream>
#include <string>
#include <fstream>
#include <stdlib.h>
#include <time.h>

#include "include/numberService.h"
#include "include/stringService.h"
#include "include/fileService.h"

#include "nlohmann/json.hpp"

using namespace std;
using json = nlohmann::json;

int main(){
    json file1, file2, file3;
    ifstream i("../dados/perguntas.json");
    ifstream j("../dados/alternativas.json");
    ifstream k("../dados/respostas.json");

    i >> file1;
    j >> file2;
    k >> file3;

    while (true) {        
        srand((unsigned) time(NULL));
        int x = rand() % 50;
        cout << "Question:" << endl;
        cout << "- " << file1[to_string(x)].get<string>() << endl;
    
        cout << "Alternatives:" << endl;
        for(json::iterator it = file2[to_string(x)].begin(); it != file2[to_string(x)].end(); ++it) {
            cout << "(" << it.key() << ") - " << it.value().get<string>() << endl;  
        }
        
        char response[1];
        cout << endl << "choice your response: 'a' or 'b' or 'c' or 'd'? ";
        cin >> response;

        if(response == file3[to_string(x)])
            cout << "\nCORRECT!\n" << endl;
        else 
            cout << "\nINCORRECT!\n" << endl;
    }

    return 0;
}
