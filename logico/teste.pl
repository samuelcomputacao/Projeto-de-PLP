:- [filesServices].
:- initialization principal.


principal:- 
    lervalor(T, 1),
    percorrer(T),
    lervalor(A, 2),
    percorrer(A),
    lervalor(B, 3),
    percorrer(B).

percorrer([X|L]) :- writeln(X.valor).