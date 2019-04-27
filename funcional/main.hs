module Main where

    import FileService
    import StringService
    import NumberService
    import System.IO
    import System.Environment
    
    main::IO Int
    main = do
        putStrLn logoJogo
        putStrLn gerarMenuInicial
        op <- getOpcao
        return (escolheOpcao op)
        
                
    getOpcao:: IO Int
    getOpcao = do
        putStr "Digite uma opcao: "
        readLn
        
    escolheOpcao::Int -> Int
    escolheOpcao opcao
        |opcao == 1 = iniciaJogo 1
        |opcao == 2 = comoJogar
        |otherwise = -1

    comoJogar::Int
    comoJogar = 0

    iniciaJogo::Int -> Int
    iniciaJogo inicio = inicio
    

    validaResposta:: Int -> Char -> Bool
    validaResposta rodada resposta = True
    
    rodada1::Int
    rodada1 = 1

    rodada2::Int
    rodada2 = 2

    rodada3::Int
    rodada3 = 3


