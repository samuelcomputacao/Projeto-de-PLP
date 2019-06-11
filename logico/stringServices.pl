

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


getOpcaoTutorial():-
    write("O 'The System' é uma versão adaptada do conhecido 'The Wall'. O jogo é dividido em 3 rodadas, com 3 perguntas cada, mas cada rodada possui suas peculiaridades."),nl,nl,
    write("Funcionamento das rodadas: "),nl,nl,
    write("- Rodada 1: "),nl,nl,
    write("Será mostrado ao jogador uma pergunta com duas alternativas, em seguida será sorteado um valor aleatório entre os valores: 1, 10, 1000, 3000, 5000. Caso o jogador acerte a pergunta esse valor sorteado será adicionado a seu saldo obtido até o momento, caso contrário será subtraído."),nl,nl,
    write("- Rodada 2: "),nl,nl,
    write("Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x ou 2x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 10, 100, 5000, 10000, 15000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído."),nl,nl,
    write("- Rodada 3: "),nl,nl,
    write("Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x, 2x ou 3x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 100, 1000, 15000, 25000, 75000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído."),nl,nl,
    write("Pressione (c) para começar o jogo ou (v) para voltar ao menu: "),nl,
    read_line_to_codes(user_input, X3),
    string_to_atom(X3,Opcao),
    opcaoTutorial(Opcao).

menu(Opcao) :- 
    write("   ________  ________   _______  _____________________  ___"),nl,
    write("  /_  __/ / / / ____/  / ___/\\ \\/ / ___/_  __/ ____/  |/  /"),nl,
    write("   / / / /_/ / __/     \\__ \\  \\  /\\__ \\ / / / __/ / /|_/ /"),nl,
    write("  / / / __  / /___    ___/ /  / /___/ // / / /___/ /  / /"),nl,
    write(" /_/ /_/ /_/_____/   /____/  /_//____//_/ /_____/_/  /_/"),nl,nl,nl,nl,
    getOpcaoMenu(Opcao).

acertouToString(ValorPergunta,PremioRodada,Saldo,Rodada) :- nl, write("                 VOCÊ ACERTOU!"),nl,
write("O sistema sorteou para essa pergunta, a premiação de: "),write(ValorPergunta),multiplicadorToString(PremioRodada,Rodada,"ganhou"),
nl,write("Seu saldo é de: "),write(Saldo),nl.

errouToString(ValorPergunta,PremioRodada,Saldo,Rodada) :- nl, write("                 VOCÊ PERDEU!"),nl,
write("O sistema sorteou para essa pergunta, a premiação de: "),write(ValorPergunta),multiplicadorToString(PremioRodada,Rodada,"perdeu"),
nl,write("Seu saldo é de: "),write(Saldo),nl.

multiplicadorToString(PremioRodada,Rodada,Status):- Rodada =\= 1,nl,write("Por causa do seu multiplicador, você "),write(Status),write(": "),write(PremioRodada),nl; write("").