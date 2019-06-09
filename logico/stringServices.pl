
procurarPergunta(-1, Retorno) :- write(Retorno).
procurarPergunta([X|L], ID, Retorno) :- 
    ID =:= 0 -> procurarPergunta(-1, X.pergunta);
    Id is ID - 1,
    procurarPergunta(L, Id, Retorno).