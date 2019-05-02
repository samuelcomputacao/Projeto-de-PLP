module Main where

    import FileService
    import StringService
    import NumberService    
    
    main::IO()
    main = do
        putStrLn logoJogo
        putStrLn gerarMenuInicial
        op <- getOpcao
        let num = read op :: Int
        if num == 1 then do
            putStrLn "\nO jogo vai iniciar, serão um total de 3 rodadas, boa sorte!\n"
            iniciaJogo 0
            
        else if num == 2 then do
            putStrLn tutorial
            comoJogar
        else
            putStrLn "Sair"
        
    
    getOpcao::IO String
    getOpcao = do
        op <- getLine
        if op == "1" || op == "2" || op == "3" then
            return op
            else do
                op <- getOpcao    
                return op

    comoJogar::IO()
    comoJogar = do
        op <- getLine
        if (op == "c") then iniciaJogo 0
        else do
            if (op == "v") then main
            else do
                putStrLn "Incorreto!\nPor favor tecle (c) para começar o jogo ou (v) para voltar: "

    iniciaJogo::Int -> IO()
    iniciaJogo salario = do
        rodada1 salario 3        
    

    validaResposta:: Int -> Char -> Bool
    validaResposta rodada resposta = True

    geraPergunta:: Int -> IO()
    geraPergunta id = do
        print(id)
        print("Qual seu nome ? ");
        resposta <- getLine
        print (verifica_resposta id resposta)


    verifica_resposta:: Int -> String -> String
    verifica_resposta id resposta = do
        if (verificarResposta id resposta) then do
            "Acertou"
        else do 
            "Errou"

    rodada1::Int -> Int -> IO()
    rodada1 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then rodada2 salario 3
        else do
            geraPergunta (gerarRandon 1)
            rodada1 salario (quant-1)

    rodada2::Int -> Int -> IO()
    rodada2 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""

        if (quant == 0) then rodada3 salario 3
        else do
            geraPergunta (gerarRandon 2)
            rodada2 salario (quant - 1)

    rodada3::Int -> Int -> IO()
    rodada3 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then fimJogo salario
        else do
            geraPergunta (gerarRandon 3)
            rodada3 salario (quant - 1)
    
    fimJogo:: Int -> IO()
    fimJogo salario = do

        print ("Premio: " ++ (show salario))