:- use_module(library(http/json)).

/* Lendo alternativas.
   Primeiro parâmetro é a variavel que saira com o dicionário que representa as alternativas.
   Segundo parâmetro é o número da rodada.
*/
lerAlternativas(Alternativas, 1) :- 
    open("./files/rodada1/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).

lerAlternativas(Alternativas, 2) :- 
    open("./files/rodada2/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).

lerAlternativas(Alternativas, 3) :- 
    open("./files/rodada3/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).

/* Lendo perguntas.
   Primeiro parâmetro é a variavel que saira com o dicionário que representa as perguntas.
   Segundo parâmetro é o número da rodada.
*/
lerPerguntas(Perguntas, 1) :- 
    open("./files/rodada1/perguntas.json", read, Teste),
    json_read_dict(Teste, Perguntas).

lerPerguntas(Perguntas, 2) :- 
    open("./files/rodada2/perguntas.json", read, Teste),
    json_read_dict(Teste, Perguntas).

lerPerguntas(Perguntas, 3) :- 
    open("./files/rodada3/perguntas.json", read, Teste),
    json_read_dict(Teste, Perguntas).


/* Lendo respostas.
   Primeiro parâmetro é a variavel que saira com o dicionário que representa as respostas.
   Segundo parâmetro é o número da rodada.
*/
lerResposta(Respostas, 1) :- 
    open("./files/rodada1/respostas.json", read, Teste),
    json_read_dict(Teste, Respostas).

lerResposta(Respostas, 2) :- 
    open("./files/rodada2/respostas.json", read, Teste),
    json_read_dict(Teste, Respostas).

lerResposta(Respostas, 3) :- 
    open("./files/rodada3/respostas.json", read, Teste),
    json_read_dict(Teste, Respostas).

/* Lendo valores.
   Primeiro parâmetro é a variavel que saira com o dicionário que representa o valor.
   Segundo parâmetro é o número da rodada.
*/
lervalor(Valor, 1) :- 
    open("./files/rodada1/valores.json", read, Teste),
    json_read_dict(Teste, Valor).

lervalor(Valor, 2) :- 
    open("./files/rodada2/valores.json", read, Teste),
    json_read_dict(Teste, Valor).

lervalor(Valor, 3) :- 
    open("./files/rodada3/valores.json", read, Teste),
    json_read_dict(Teste, Valor).