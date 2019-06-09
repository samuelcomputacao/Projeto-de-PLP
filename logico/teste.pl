:- [filesServices].
:- initialization principal.


principal:- 
    lerAlternativas(T, 1), percorrer(T).

percorrer([X|L]) :- write(X.alternativas).