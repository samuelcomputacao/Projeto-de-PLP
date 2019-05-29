:- initialization main.

main:-
    menu(W),
    write(W),
    halt(0).

menu(Opcao) :- 
write("   ________  ________   _______  _____________________  ___"),nl,
write("  /_  __/ / / / ____/  / ___/\\ \\/ / ___/_  __/ ____/  |/  /"),nl,
write("   / / / /_/ / __/     \\__ \\  \\  /\\__ \\ / / / __/ / /|_/ /"),nl,
write("  / / / __  / /___    ___/ /  / /___/ // / / /___/ /  / /"),nl,
write(" /_/ /_/ /_/_____/   /____/  /_//____//_/ /_____/_/  /_/"),nl,nl,nl,nl,
getOpcao(Opcao).


getOpcao(X) :- 
repeat,
write("Escolha uma Opção:"),nl,
write("1) Iniciar novo jogo"),nl,
write("2) Tutorial"),nl,
write("3) Sair"),nl,
read_line_to_codes(user_input, X3),
string_to_atom(X3,X2),
atom_number(X2,X).
