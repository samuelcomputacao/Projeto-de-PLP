:- use_module(library(http/json)), initialization(main).

main:-
    open("./files/rodada1/alternativas.json", read, Teste),
    json_read_dict(Teste, JsonLido),
    percorrer(JsonLido).
