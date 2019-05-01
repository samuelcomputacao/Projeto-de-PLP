module StringService where

    gerarMenuInicial:: String
    gerarMenuInicial = "1- Iniciar\n2- Como Jogar?\n3- Sair\n"

    logoJogo:: String
    logoJogo = "The Systen"

    tutorial:: String
    tutorial = "Tutorial"

    errouToString:: Int -> Int -> Int -> Int -> String
    errouToString valorDaPergunta premioRodada saldoJogador rodada = ""

    acertouToString:: Int -> Int -> Int -> Int -> String
    acertouToString valorDaPergunta premioRodada saldoJogador rodada = ""

    contaPerguntaToString:: Int -> String
    contaPerguntaToString numero = ""
