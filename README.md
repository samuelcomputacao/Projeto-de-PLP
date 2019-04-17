# The System

> Projeto da disciplina de Paradigmas de linguagens de programação

Uma versão adaptada do conhecido `The wall`. O jogo é dividido em 3 rodadas, cada uma com 3 perguntas, mas possuem pecularidades. 

## Funcionamento das rodadas:

* Rodada 1:

Será mostrado uma `pergunta com duas alternativas`, e caso o usuário acerte será sorteado um valor aleatório entre os valores: `1, 10, 1000, 3000, 5000`, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado só que irá subtrair do valor obtido.

* Rodada 2:

Será mostrado as `4 alternativas`, para o jogador verificar se conhece o assunto ou não e então, o sistema irá `perguntar qual multiplicador ele deseja(dependendo de sua confiança em acertar): 1x ou 2x`. E logo após, mostrará a pergunta. E Caso o usuário acerte será sorteado um valor aleatório entre os valores: `10, 100, 5000, 10000, 15000` e esse valor será `multiplicado pelo multiplicador` escolhido, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado e multiplicar pelo multiplicador, só que irá subtrair do valor obtido.

* Rodada 3:

Será mostrado as `4 alternativas`, para o jogador verificar se conhece o assunto ou não e então, o sistema irá `perguntar qual multiplicador ele deseja(dependendo de sua confiança em acertar): 1x, 2x ou 3x`. E logo após, mostrará a pergunta. E Caso o usuário acerte será sorteado um valor aleatório entre os valores: `100, 1000, 75000, 15000, 25000` e esse valor será `multiplicado pelo multiplicador` escolhido, e então vai ser somado ao seu valor obtido até o momento, caso ele erre será também sorteado e multiplicar pelo multiplicador, só que irá subtrair do valor obtido.
