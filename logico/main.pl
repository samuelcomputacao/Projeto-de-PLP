:- [filesServices].
:- [stringServices].

:- initialization main.

main:- init().

init() :-
    menu(Opcao),
    halt(0).

lerNumero(N) :- 
    read_line_to_codes(user_input, X3),
    string_to_atom(X3,X2),
    atom_number(X2, N).

getOpcaoMenu(Opcao) :- 
    write("Escolha uma Opção:"),nl,
    write("1) Iniciar novo jogo"),nl,
    write("2) Tutorial"),nl,
    write("3) Sair"),nl,
    lerNumero(Op),
    Saldo is 0 -> (
        Op =:= 1 -> rodada(1, Saldo, 0);
        Op =:= 2 -> getOpcaoTutorial();
        Op =:= 3 -> halt()).


opcaoTutorial(v) :- init().
opcaoTutorial(c) :- rodada(1, 0, 0).

rodada(1, Saldo, Quantidade) :-
    (
        Quantidade =:= 0 -> (
            nl,
            writeln("O jogo vai iniciar, serão um total de 3 rodadas, boa sorte!"),nl,
            writeln("========================================================"),nl,
            writeln("A primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> rodada(2, Saldo, 0);
        nl
    ),
    lervalor(V, 1),
    gerarId(5, IDVALOR),
    procurarValor(V, IDVALOR, Valor),

    gerarId(12, ID),
    lerPerguntas(P, 1),
    procurarPergunta(P, ID, ""),
    nl,

    lerAlternativas(A, 1),
    imprimeAlternativas(A, ID, ["A", "B"]),

    read_line_to_string(user_input, OpUsuario),
    lerResposta(R, 1),
    (verificarResposta(R, ID, "", OpUsuario) -> (
        
        S is Saldo + Valor,acertouToString(Valor,Valor,S,1)
    );
    verificaSaldo(Saldo,Valor,S),errouToString(Valor,Valor,S,1)),

    Q is Quantidade + 1,
    rodada(1, S, Q).

verificaSaldo(Saldo,Gap,Saida):- (Saldo - Gap) > 0, Saida is (Saldo - Gap); Saida is 0.
    

rodada(2, Saldo, Quantidade) :- 
    (
        Quantidade =:= 0 -> (
            nl,writeln("========================================================"),
            nl, writeln("A segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> rodada(3, Saldo, 0);
        nl
    ),
    lervalor(V, 2),
    gerarId(5, IDVALOR),
    procurarValor(V, IDVALOR, Valor),

    gerarId(16, ID), 
    lerAlternativas(A, 2),
    imprimeAlternativas(A, ID, ["A", "B", "C", "D"]),
    lerPerguntas(P, 2),

    nl,

    getMultiplicador(2,Multiplicador),
    procurarPergunta(P, ID, ""),nl,

    read_line_to_string(user_input, OpUsuario),

    lerResposta(R, 2),
    ValorRodada is Valor * Multiplicador,
    (verificarResposta(R, ID, "", OpUsuario) -> (
    S is Saldo + ValorRodada,acertouToString(Valor,ValorRodada,S,2));
    verificaSaldo(Saldo,Valor,S),errouToString(Valor,ValorRodada,S,2)),

    Q is Quantidade + 1,
    rodada(2, S, Q).

rodada(3, Saldo, Quantidade) :- 
    (
        Quantidade =:= 0 -> (
            nl,writeln("========================================================"),
            nl,  writeln("A terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> nl,write("Fim de Jogo!"),nl,write("Seu Saldo final é de: "),write(Saldo),nl, halt(0);
        nl
    ),
    lervalor(V, 3),
    gerarId(5, IDVALOR),
    procurarValor(V, IDVALOR, Valor),

    gerarId(20, ID),
    lerAlternativas(A, 3),
    imprimeAlternativas(A, ID, ["A", "B", "C", "D"]),
    lerPerguntas(P, 3),
   
    nl,
    getMultiplicador(3,Multiplicador),
    procurarPergunta(P, ID, ""),nl,
    read_line_to_string(user_input, OpUsuario),
    
    lerResposta(R, 3), 
    ValorRodada is Valor * Multiplicador,
    (verificarResposta(R, ID, "", OpUsuario) -> (
   
    S is Saldo + ValorRodada,acertouToString(Valor,ValorRodada,S,3)
    );
    verificaSaldo(Saldo,ValorRodada,S),errouToString(Valor,ValorRodada,S,3)),

    Q is Quantidade + 1,
    rodada(3, S, Q).

gerarId(Maximo, Retorno) :- random(0, Maximo, Retorno).

getMultiplicador(Rodada,Out) :-
    Rodada =:= 3, lerMultiplicador("Escolha um multiplicador 1x, 2x ou 3x: ",Rodada,Out);
    Rodada =:= 2, lerMultiplicador("Escolha um multiplicador 1x ou 2x: ",Rodada,Out).

lerMultiplicador(Mensagem,Rodada,Out) :-     
    write(Mensagem),nl,read_line_to_string(user_input,Multi),avaliaMultiplicador(Rodada,Multi,Out).
 

avaliaMultiplicador(Rodada,Multi,Out):- 
    Multi == "1x", Rodada =:= 2,Out is 1;
    Multi == "1x", Rodada =:= 3,Out is 1;
    Multi == "2x", Rodada =:= 2,Out is 2;
    Multi == "2x", Rodada =:= 3,Out is 2;
    Multi == "3x", Rodada =:= 3,Out is 3;
    Rodada =:= 2 ,lerMultiplicador("Digite um valor de acordo com as opções dadas(1x e 2x): ",Rodada,Out);
    Rodada =:= 3 ,lerMultiplicador("Digite um valor de acordo com as opções dadas(1x, 2x ou 3x): ",Rodada,Out).