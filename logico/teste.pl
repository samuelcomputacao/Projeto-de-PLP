:- [filesServices].
:- [stringServices].
:- initialization teste.

principal:- 
    lervalor(T, 1),
    percorrer(T),
    lervalor(A, 2),
    percorrer(A),
    lervalor(B, 3),
    percorrer(B).

teste :- 
    lerPerguntas(T, 1),
    procurarPergunta(T, 0, "").

percorrer([X|L]) :- writeln(X.valor).