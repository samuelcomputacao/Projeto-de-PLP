:- [filesServices].
:- [stringServices].

principal:- 
    lerAlternativas(A, 1),
    imprimeAlternativas(A, 8).

teste :- 
    lerResposta(R, 1),
    verificarResposta(R, 1, Res, "a"),
    write("Acertou").

percorrer([X|L]) :- write(X).

