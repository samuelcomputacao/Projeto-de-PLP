
procurarPergunta(-1, Retorno) :- write(Retorno).
procurarPergunta([X|L], ID, Retorno) :- 
    ID =:= 0 -> procurarPergunta(-1, X.pergunta);
    Id is ID - 1,
    procurarPergunta(L, Id, Retorno).


imprimeAlternativas([A|B], ID) :-
    ID =:= 0 -> imprime(A.alternativas);
    Id is ID - 1,
    imprimeAlternativas(B, Id).

imprime([A|B]):-
    length(B, 0) -> writeln(A);
    writeln(A), imprime(B).


verificarResposta(-1, Resposta, ResUsuario) :- 
    Resposta =:= ResUsuario.

verificarResposta([X|L], ID, Resposta, ResUsuario) :-
    ID =:= 0 -> verificarResposta(-1, X.resposta, ResUsuario);
    Id is ID - 1,
    verificarResposta(L, Id, Resposta, ResUsuario).


procurarValor(-1, Retorno) :- true.
procurarValor([X|L], ID, Retorno) :- 
    ID =:= 0 -> Retorno is X.valor, procurarValor(-1, Retorno);
    Id is ID - 1,
    procurarValor(L, Id, Retorno).