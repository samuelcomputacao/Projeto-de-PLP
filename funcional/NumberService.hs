module NumberService
(
    gerarRandon,
    gerarValorPremio
) where

    import System.Random (randomRIO)

    gerarRandon:: Int -> IO Int
    gerarRandon maximo = do
        randomRIO (0,maximo::Int)

    gerarValorPremio::Int -> Int -> Int
    gerarValorPremio multiplicador premiacao = 0