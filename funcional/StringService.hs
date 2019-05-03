module StringService(
    gerarMenuInicial,
    logoJogo,
    tutorial,
    errouToString,
    acertouToString,
    contaPerguntaToString
) where

    gerarMenuInicial:: String
    gerarMenuInicial = do
        "Escolha uma opção: \n"
      ++"1) Iniciar novo jogo\n"
      ++"2) Tutorial\n"
      ++"3) Sair\n"

    logoJogo:: String
    logoJogo = do
        "  ________  ________   _______  _____________________  ___\n"
      ++" /_  __/ / / / ____/  / ___/\\ \\/ / ___/_  __/ ____/  |/  /\n"
      ++"  / / / /_/ / __/     \\__ \\  \\  /\\__ \\ / / / __/ / /|_/ /\n"
      ++" / / / __  / /___    ___/ /  / /___/ // / / /___/ /  / /\n"
      ++"/_/ /_/ /_/_____/   /____/  /_//____//_/ /_____/_/  /_/\n\n\n"

    tutorial:: String
    tutorial = do
       "O 'The System' é uma versão adaptada do conhecido 'The Wall'. O jogo é dividido em 3 rodadas, com 3 perguntas cada, mas cada rodada possui suas peculiaridades.\n"
     ++"Funcionamento das rodadas: \n"
     ++"\n- Rodada 1: \n\n"
     ++"Será mostrado ao jogador uma pergunta com duas alternativas, em seguida será sorteado um valor aleatório entre os valores: 1, 10, 1000, 3000, 5000. Caso o jogador acerte a pergunta esse valor sorteado será adicionado a seu saldo obtido até o momento, caso contrário será subtraído.\n"
     ++"\n- Rodada 2: \n\n"
     ++"Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x ou 2x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 10, 100, 5000, 10000, 15000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído.\n"
     ++"\n- Rodada 3: \n\n"
     ++"Será mostrado as 4 alternativas para o jogador verificar se conhece ou não o assunto a qual se refere a pergunta, em seguida o sistema irá perguntar qual multiplicador ele deseja (dependendo de sua confiança em acertar): 1x, 2x ou 3x. Logo após, mostrará a pergunta. Será sorteado um valor aleatório entre os valores: 100, 1000, 15000, 25000, 75000. Posteriormente o valor sorteado será multiplicado pelo multiplicador, se a resposta estiver correta esse valor é adicionado ao saldo do jogador, caso contrário subtraído.\n"
     ++"\n\nPressione (c) para começar o jogo ou (v) para voltar ao menu: "

    errouToString:: Int -> Int -> Int -> Int -> String
    errouToString valorDaPergunta premioRodada saldoJogador rodada = do

      "\n                 VOCÊ ERROU!\n"
      ++ "O sistema sorteou para essa pergunta, a premiação de: " ++ (show valorDaPergunta)
      ++ multiplicadorToString premioRodada rodada "ganhou"
      ++ "\nSeu saldo atual é de: " 
      ++ show saldoJogador
      ++ "\n";    

    acertouToString:: Int -> Int -> Int -> Int -> String
    acertouToString valorDaPergunta premioRodada saldoJogador rodada = do
      "\n                 VOCÊ ACERTOU!\n"
      ++ "O sistema sorteou para essa pergunta, a premiação de: " 
      ++ show valorDaPergunta
      ++ multiplicadorToString premioRodada rodada "perdeu"
      ++ "\nSeu saldo atual é de: " 
      ++ show saldoJogador
      ++ "\n"; 

    multiplicadorToString :: Int -> Int -> String -> String
    multiplicadorToString premioRodada rodada status
      | rodada /= 1 = "\nPor causa do seu multiplicador, você "
      ++ status 
      ++ ": " 
      ++ show premioRodada 
      ++ "\n"
      | otherwise = ""


    contaPerguntaToString:: Int -> String
    contaPerguntaToString numero = ""
