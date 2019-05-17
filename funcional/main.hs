module Main where

    import FileService
    import StringService
    import NumberService
    import Control.Concurrent    -- Concorrencia, uso de threads
    
    main::IO()
    main = do
        telaInicial     --  Loading + Logo
        putStrLn gerarMenuInicial -- Menu de Opções 
        verificaOpcao 

    verificaOpcao :: IO()
    verificaOpcao  = do
        op <- getOpcao
        let num = read op :: Int
        if num == 1 then do
            putStrLn "\nO jogo vai iniciar, serão um total de 3 rodadas, boa sorte!\n"
            iniciaJogo 0
            
        else if num == 2 then do
            putStrLn tutorial
            op <- comoJogar
            if op == "c" then 
                iniciaJogo 0 
            else do
                putStrLn gerarMenuInicial
                verificaOpcao 
        else
            putStrLn "Sair"

    getOpcao::IO String
    getOpcao = do
        op <- getLine
        if op == "1" || op == "2" || op == "3" then
            return op
            else do
                putStrLn "Opcao incorreta!\nPor favor tecle 1,2 ou 3: "
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
    
    -- TO DO
    escolheMultiplicador :: Int -> IO Int
    escolheMultiplicador rodada = readLn :: IO Int
    
    -- TO DO
    validaResposta :: Int -> String -> Bool
    validaResposta rodada resposta = True

    geraPerguntaRodada1 :: Int -> Either String [Pergunta] -> IO()
    geraPerguntaRodada1 id e = putStrLn (carregarPerguntaRodada1 id e)

    geraPerguntaRodada2 :: Int -> Either String [PerguntaRodada2] -> IO()
    geraPerguntaRodada2 id e = putStrLn (carregarPerguntaRodada2 id e)

    geraPerguntaRodada3 :: Int -> Either String [PerguntaRodada3] -> IO()
    geraPerguntaRodada3 id e = putStrLn (carregarPerguntaRodada3 id e)

    rodada1::Int -> Int -> IO()
    rodada1 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then rodada2 salario 3
        else do
            id <- gerarRandon 12
            e <- retornaEitherPerguntasRodada1
            d <- retornaEitherAlternativasRodada1
            f <- retornaEitherRespostasRodada1
            geraPerguntaRodada1 id e
            putStrLn (carregarAlternativasRodada1 id d)
            resposta <- getResposta 1
            if (verificarRespostaRodada1 id resposta f) then print "To do: Acertou"
            else print "To do: Errou"
            rodada1 salario (quant - 1)

    getResposta::Int -> IO String
    getResposta rodada = do
        op <- getLine
        if contem op (if rodada == 1 then "ab" else "abcd") then return op
        else do
            putStrLn ("Alternativa incorreta!\nPor favor tecle: " ++ (if rodada == 1 then "a ou b." else "a, b, c ou d."))
            op <- getResposta rodada
            return op
                
    contem:: [Char] -> [Char] -> Bool
    contem elemento []  = False
    contem (x:xs) (h:t) = do
        if x == h then True
        else contem (x:xs) t

    rodada2::Int -> Int -> IO()
    rodada2 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""

        if (quant == 0) then rodada3 salario 3
        else do
            id <- gerarRandon 16
            e <- retornaEitherPerguntasRodada2
            d <- retornaEitherAlternativasRodada2
            f <- retornaEitherRespostasRodada2

            putStrLn (carregarAlternativasRodada2 id d)

            -- Lógica de escolher o multiplicador.
            geraPerguntaRodada2 id e
            resposta <- getResposta 2
            if (verificarRespostaRodada2 id resposta f) then print "To do: Acertou"
            else print "To do: Errou"
            rodada2 salario (quant - 1)

    rodada3::Int -> Int -> IO()
    rodada3 salario quant = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then fimJogo salario
        else do
            id <- gerarRandon 20
            e <- retornaEitherPerguntasRodada3
            d <- retornaEitherAlternativasRodada3
            f <- retornaEitherRespostasRodada3

            putStrLn (carregarAlternativasRodada3 id d)

            -- Lógica de escolher o multiplicador.
            geraPerguntaRodada3 id e
            resposta <- getResposta 3
            if (verificarRespostaRodada3 id resposta f) then print "To do: Acertou"
            else print "To do: Errou\n\n"
            rodada3 salario (quant - 1)
    
    fimJogo:: Int -> IO()
    fimJogo salario = do
        putStrLn ("Fim de Jogo!\nSeu Saldo final é de: " ++ (show salario) ++"\n\n")
        sairOuJogarNovamente
    

    sairOuJogarNovamente :: IO()
    sairOuJogarNovamente = do
        op <- verificaSaida
        if(op == "c") then 
            iniciaJogo 0
        else do
            putStrLn "\nAté a próxima!\n"
            putStrLn "The System finalized...\n"

    
    verificaSaida :: IO String 
    verificaSaida = do
        putStrLn "Tecle (c) jogar novamente ou (s) para sair: "
        op <- getLine
        if(op == "c" || op == "s") then 
            return op
        else do
            putStrLn "\nIncorreto!"
            op <- verificaSaida
            return op

    telaInicial::IO()
    telaInicial = do
        putStr("Aguardando carregamento do jogo...\n\n")
        threadDelay 2000000                             -- delay de 2 milhoes de microsegundos, ou 2 segundos
        putStr("Espere um momento por favor... \n\n")
        threadDelay 4000000
        putStr("Tudo pronto! Hora de jogar!\n\n")
        putStrLn logoJogo
        

