:- [filesServices].
:- [stringServices].
:- style_check(-singleton).
:- discontiguous rodada/4.

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
    validaOpcaoMenu(Op, OpCorreta),
    Saldo is 0 -> (
        OpCorreta =:= 1 -> rodada(1, Saldo, 0,[]);
        OpCorreta =:= 2 -> getOpcaoTutorial();
        OpCorreta =:= 3 -> halt()).


opcaoTutorial(v) :- init().
opcaoTutorial(c) :- rodada(1, 0, 0,[]).

rodada(1, Saldo, Quantidade, Lista) :-
    (
        Quantidade =:= 0 -> (
            nl,
            writeln("O jogo vai iniciar, serão um total de 3 rodadas, boa sorte!"),nl,
            writeln("========================================================"),nl,
            writeln("A primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> rodada(2, Saldo, 0,[]);
        nl
    ),
    lervalor(V, 1),
    gerarId(5, IDVALOR,[],[]),
    procurarValor(V, IDVALOR, Valor),

    gerarId(12, ID,Lista,NovaLista),contaPerguntaToString(Quantidade),nl,
    lerPerguntas(P, 1),
    procurarPergunta(P, ID, ""),
    nl,

    lerAlternativas(A, 1),nl,
    imprimeAlternativas(A, ID, ["a)", "b)"]),

    read_line_to_string(user_input, OpUsuario),
    ((OpUsuario == "a" ; OpUsuario == "b") -> Op = OpUsuario; verificaAlternativa(OpUsuario, Op)),

    lerResposta(R, 1),
    (verificarResposta(R, ID, "", Op) -> (
        
        S is Saldo + Valor,acertouToString(Valor,Valor,S,1)
    );
    verificaSaldo(Saldo,Valor,S),errouToString(Valor,Valor,S,1)),

    Q is Quantidade + 1,
    rodada(1, S, Q,NovaLista).

verificaSaldo(Saldo,Gap,Saida):- (Saldo - Gap) > 0, Saida is (Saldo - Gap); Saida is 0.
    

rodada(2, Saldo, Quantidade,Lista) :- 
    (
        Quantidade =:= 0 -> (
            nl,writeln("========================================================"),
            nl, writeln("A segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> rodada(3, Saldo, 0,[]);
        nl
    ),
    lervalor(V, 2),
    gerarId(5, IDVALOR,[],[]),
    procurarValor(V, IDVALOR, Valor),

    gerarId(16, ID,Lista,NovaLista), 
    lerAlternativas(A, 2),contaPerguntaToString(Quantidade),nl,
    imprimeAlternativas(A, ID, ["a)", "b)", "c)", "d)"]),
    lerPerguntas(P, 2),

    nl,

    getMultiplicador(2,Multiplicador),
    procurarPergunta(P, ID, ""),nl,

    read_line_to_string(user_input, OpUsuario),
    ((OpUsuario == "a" ; OpUsuario == "b" ; OpUsuario == "c" ; OpUsuario == "d") -> Op = OpUsuario; verificaAlternativa2(OpUsuario, Op)),

    lerResposta(R, 2),
    ValorRodada is Valor * Multiplicador,
    (verificarResposta(R, ID, "", Op) -> (
    S is Saldo + ValorRodada,acertouToString(Valor,ValorRodada,S,2));
    verificaSaldo(Saldo,ValorRodada,S),errouToString(Valor,ValorRodada,S,2)),

    Q is Quantidade + 1,
    rodada(2, S, Q,NovaLista).

rodada(3, Saldo, Quantidade,Lista) :- 
    (
        Quantidade =:= 0 -> (
            nl,writeln("========================================================"),
            nl,  writeln("A terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!"),nl);
        Quantidade =:= 3 -> nl,write("Fim de Jogo!"),nl,write("Seu Saldo final é de: "),write(Saldo),nl,
        write("Tecle (c) para jogar novamente ou (s) para sair: "),nl,
        read_line_to_string(user_input, OpUsuario),
        verificaJogarNovamente(OpUsuario),
        halt(0);
        nl
    ),
    lervalor(V, 3),
    gerarId(5, IDVALOR,[],[]),
    procurarValor(V, IDVALOR, Valor),

    gerarId(20, ID,Lista,NovaLista),
    lerAlternativas(A, 3),contaPerguntaToString(Quantidade),nl,
    imprimeAlternativas(A, ID, ["a)", "b)", "c)", "d)"]),
    lerPerguntas(P, 3),
   
    nl,
    getMultiplicador(3,Multiplicador),
    procurarPergunta(P, ID, ""),nl,
    read_line_to_string(user_input, OpUsuario),
    ((OpUsuario == "a" ; OpUsuario == "b" ; OpUsuario == "c" ; OpUsuario == "d") -> Op = OpUsuario; verificaAlternativa2(OpUsuario, Op)),

    lerResposta(R, 3), 
    ValorRodada is Valor * Multiplicador,
    (verificarResposta(R, ID, "", Op) -> (
   
    S is Saldo + ValorRodada,acertouToString(Valor,ValorRodada,S,3)
    );
    verificaSaldo(Saldo,ValorRodada,S),errouToString(Valor,ValorRodada,S,3)),

    Q is Quantidade + 1,
    rodada(3, S, Q,NovaLista).

gerarId(Maximo, Retorno,[],[]) :- random(0, Maximo, Retorno).
gerarId(Maximo, Retorno,Lista,NovaLista) :-random(0, Maximo, Retorno),notContains(Retorno,Lista),append(Retorno,Lista,NovaLista);
gerarId(Maximo, Retorno,Lista,NovaLista).

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

verificaAlternativa(A, Saida):-
    repeat,
    writeln("Digite uma alternativa correta por favor (a ou b): "),
    read_line_to_string(user_input, Saida),
    (Saida == "a" ; Saida == "b" -> !, !
        ; fail
    ).

verificaAlternativa2(A, Saida):-
    repeat,
    writeln("Digite uma alternativa correta por favor (a ou b ou c ou d): "),
    read_line_to_string(user_input, Saida),
    (Saida == "a" ; Saida == "b" ; Saida == "c" ; Saida == "d" -> !, !
        ; fail
    ).

readPlayAgain(Msg):-
    write(Msg), nl,
    read_line_to_string(user_input, Opcao),
    verificaJogarNovamente(Opcao).

verificaJogarNovamente(Opcao):-
    Opcao == "c", rodada(1,0,0,[]);
    Opcao == "s";
    readPlayAgain("Incorreto!\nPor favor tecle (c) jogar novamente ou (s) para sair: ").

readOpcaoMenu(Msg, OpcaoCorreta):-
    write(Msg),nl,
    lerNumero(Opcao),
    validaOpcaoMenu(Opcao,OpcaoCorreta).

validaOpcaoMenu(Opcao, OpcaoCorreta):-
    Opcao =:= 1, OpcaoCorreta is Opcao;
    Opcao =:= 2, OpcaoCorreta is Opcao;
    Opcao =:= 3, OpcaoCorreta is Opcao;
    readOpcaoMenu("Opção incorreta, digite 1, 2 ou 3.", OpcaoCorreta). 

notContains(_,[]).
notContains(X,[H|T]) :- X =\= H , notContains(X,T).

add(X,[],[X]).
add(X,[H1|T1],[H1|T2]):- add(X,T1,T2).