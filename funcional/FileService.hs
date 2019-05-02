module FileService(
    carregarPergunta,
    carregarResposta,
    verificarResposta,
    buscaValorPremio
)where

    carregarPergunta:: Int -> Int -> String
    carregarPergunta rodada id = ""

    carregarResposta:: Int -> Int -> String
    carregarResposta rodada id = ""

    verificarResposta:: Int -> Int -> Char -> Bool
    verificarResposta rodada id respostaJogador = False

    buscaValorPremio:: Int -> Int -> Int
    buscaValorPremio rodada id = 0


    
