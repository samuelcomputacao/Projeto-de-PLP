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

    verificarResposta:: Int -> String -> Bool
    verificarResposta id respostaJogador = True

    buscaValorPremio:: Int -> Int -> Int
    buscaValorPremio rodada id = 0


    
