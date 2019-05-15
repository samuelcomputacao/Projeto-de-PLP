module Main where

    import FileService
    import StringService
    import NumberService
    import Control.Concurrent    -- Concorrencia, uso de threads
    
    main::IO()
    main = do
        telaInicial     -- funcao para mostrar a tela inicial do jogo com o logo e o menu  inicial + loading
        op <- getOpcao
        let num = read op :: Int
        if num == 1 then do
            putStrLn "\nO jogo vai iniciar, serão um total de 3 rodadas, boa sorte!\n"
            iniciaJogo 0
            
        else if num == 2 then do
            putStrLn tutorial
            op <- comoJogar
            if op == "c" then iniciaJogo 0 else main  -- tem que ajeitar isso. criar uma funcao para que chame ela mesmo, em vez do main.
        else
            putStrLn "Sair"
        

    getOpcao::IO String
    getOpcao = do
        op <- getLine
        if op == "1" || op == "2" || op == "3" then
            return op
            else do
                putStrLn "Opcao incorreta!\n Por favor tecle 1,2 ou 3: "
                op <- getOpcao    
                return op

    comoJogar::IO String
    comoJogar = do
        op <- getLine
        if (op == "c" || op == "v") then
            return op
        else do
            putStrLn "Opcao incorreta!\nPor favor tecle (c) para começar o jogo ou (v) para voltar: "
            op <- comoJogar
            return op

    iniciaJogo::Int -> IO()
    iniciaJogo salario = do
        rodada1 salario 3        
    

    validaResposta:: Int -> String -> Bool
    validaResposta rodada resposta = True

    geraPergunta:: Int -> Either String [Pergunta] -> IO()
    geraPergunta id e = do
        print(id)
        putStrLn (carregarPergunta id e)
        
    verifica_resposta:: Int -> String -> String
    verifica_resposta id resposta = do
        if (id == 1) then do
            "Acertou"
        else do 
            "Errou"

    rodada1::Int -> Int -> IO()
    rodada1 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then print "Acabou"
        else do
            id <- gerarRandon 12
            e <- retornaEitherPerguntas
            d <- retornaEitherAlternativas
            f <- retornaEitherRespostas
            geraPergunta id e
            putStrLn (carregarResposta 1 id d)
            resposta <- getLine
            if (verificarResposta id resposta f) then print "Acertou"
            else print "Errou"
            rodada1 salario (quant - 1)
            
{-
    rodada2::Int -> Int -> IO()
    rodada2 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""

        if (quant == 0) then rodada3 salario 3
        else do
            id <- gerarRandon 12
            e <- retornaEitherPerguntas
            d <- retornaEitherAlternativas
            f <- retornaEitherRespostas
            geraPergunta id e
            rodada2 salario (quant - 1)

    rodada3::Int -> Int -> IO()
    rodada3 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then fimJogo salario
        else do
            id <- gerarRandon 12
            e <- retornaEitherPerguntas
            d <- retornaEitherAlternativas
            f <- retornaEitherRespostas
            geraPergunta id e
            rodada3 salario (quant - 1)
    
    fimJogo:: Int -> IO()
    fimJogo salario = do

        print ("Premio: " ++ (show salario))
-}
    telaInicial::IO()
    telaInicial = do
        putStr("Aguardando carregamento do jogo...\n\n")
        threadDelay 2000000                             -- delay de 2 milhoes de microsegundos, ou 2 segundos
        putStr("Espere um momento por favor... \n\n")
        threadDelay 4000000
        putStr("Tudo pronto! Hora de jogar!\n\n")
        putStrLn logoJogo
        putStrLn gerarMenuInicial