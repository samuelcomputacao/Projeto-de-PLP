:- initialization main.

main:- init().

init() :-
    menu(Opcao),
    getMultiplicador(2,Y),
    write("Multiplicador "),write(Y),nl,
    opcaoMenu(Opcao),
    halt(0).

menu(Opcao) :- 
write("   ________  ________   _______  _____________________  ___"),nl,
write("  /_  __/ / / / ____/  / ___/\\ \\/ / ___/_  __/ ____/  |/  /"),nl,
write("   / / / /_/ / __/     \\__ \\  \\  /\\__ \\ / / / __/ / /|_/ /"),nl,
write("  / / / __  / /___    ___/ /  / /___/ // / / /___/ /  / /"),nl,
write(" /_/ /_/ /_/_____/   /____/  /_//____//_/ /_____/_/  /_/"),nl,nl,nl,nl,
getOpcaoMenu(Opcao).


getOpcaoMenu(Opcao) :- 
repeat,nl,
write("Escolha uma Opção:"),nl,
write("1) Iniciar novo jogo"),nl,
write("2) Tutorial"),nl,
write("3) Sair"),nl,
read_line_to_codes(user_input, X3),
string_to_atom(X3,X2),
atom_number(X2,Opcao).

opcaoMenu(Opcao) :- Opcao =:= 1 , rodada(1,0);
Opcao =:= 2, 
write("O 'The System' é uma versão adaptada do conhecido 'The Wall'. O jogo é dividido em 3 rodadas, com 3 perguntas cada, mas cada rodada possui suas peculiaridades."),nl,nl,
write("Funcionamento das rodadas: "),nl,nl,
write("- Rodada 1: "),nl,nl,
write("Será mostrado ao jogador uma pergunta com duas alternativas, em seguida será sorteado um valor aleatório entre os valores: 1, 10, 1000, 3000, 5000. Caso o jogador acerte a pergunta esse valor sorteado será adicionado a seu saldo obtido até o momento, caso contrário será subtraído."),nl,nl,
write("- Rodada 2: "),nl,nl,
write("Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x ou 2x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 10, 100, 5000, 10000, 15000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído."),nl,nl,
write("- Rodada 3: "),nl,nl,
write("Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x, 2x ou 3x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 100, 1000, 15000, 25000, 75000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído."),nl,nl,
getOpcaoTutorial();
Opcao =:= 3 , halt(0).

getOpcaoTutorial():-repeat,
write("Pressione (c) para começar o jogo ou (v) para voltar ao menu: "),nl,
read_line_to_codes(user_input, X3),
string_to_atom(X3,Opcao),
opcaoTutorial(Opcao).

opcaoTutorial(v) :- init().
opcaoTutorial(c) :- rodada(1,0).

rodada(X,Saldo) :- X =:= 1,write("Inicioou rodada 1 "),write("Saldo: "),write(Saldo),nl,halt(0).

gerarId(Maximo,Retorno) :- random(0, Maximo, Retorno).

getMultiplicador(Rodada,Retorno) :-
Rodada =:= 3, lerMultiplicador("Escolha um multiplicador 1, 2 ou 3: ",Retorno,Rodada);
Rodada =:= 2, lerMultiplicador("Escolha um multiplicador 1 ou 2: ",Retorno,Rodada).

lerMultiplicador(Mensagem,Retorno,Rodada) :- 
repeat,
write(Mensagem),nl,
read_line_to_codes(user_input, X3),
string_to_atom(X3,X2),
atom_number(X2,X4),
avaliaMultiplicador(Rodada,X4, Retorno).


avaliaMultiplicador(Rodada,Valor,Retorno) :- 
Valor =:= 1, Rodada =:= 2,Retorno is Valor;
Valor =:= 2, Rodada =:= 2,Retorno is Valor;
Valor =:= 1, Rodada =:= 3,Retorno is Valor;
Valor =:= 2, Rodada =:= 3,Retorno is Valor;
Valor =:= 3, Rodada =:= 3,Retorno is Valor.


