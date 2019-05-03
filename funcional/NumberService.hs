module NumberService
(
    gerarRandon,
    gerarValorPremio
) where

    import System.Random (randomRIO)

    gerarRandon:: Int -> IO Int
    gerarRandon maximo = randomRIO (0,maximo::Int)

    gerarValorPremio::Int -> Int -> Int
    gerarValorPremio multiplicador premiacao = multiplicador * premiacao