:- use_module(library(http/json)).

lerAlternativasRodada1(Alternativas) :-
    open("./files/rodada1/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).


lerAlternativas(Alternativas, 1) :- 
    open("./files/rodada1/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).

lerAlternativas(Alternativas, 2) :- 
    open("./files/rodada2/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).

lerAlternativas(Alternativas, 3) :- 
    open("./files/rodada3/alternativas.json", read, Teste),
    json_read_dict(Teste, Alternativas).