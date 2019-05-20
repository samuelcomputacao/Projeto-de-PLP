module Main where

    import Data.Char 
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
        if (elem op ["1","2","3"]) then
            return op
            else do
                putStrLn "Opcao incorreta!\nPor favor tecle 1,2 ou 3: "
                op <- getOpcao    
                return op

    comoJogar::IO String
    comoJogar = do
        op <- getLine
        if (elem op ["c","v"]) then
            return op
        else do
            putStrLn "Opcao incorreta!\nPor favor tecle (c) para começar o jogo ou (v) para voltar: "
            op <- comoJogar
            return op

    iniciaJogo::Int -> IO()
    iniciaJogo salario = do
        rodada1 salario 3 []

    rodada1::Int -> Int -> [Int] -> IO()
    rodada1 salario quant perguntas = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA primeira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then rodada2 salario 3 []
        else do
            id <- gerarId perguntas 12
            e <- retornaEitherPerguntasRodada1
            d <- retornaEitherAlternativasRodada1
            f <- retornaEitherRespostasRodada1
            g <- retornaEitherPontosRodada1
            geraPerguntaRodada1 id e
            putStrLn (carregarAlternativasRodada1 id d)
            resposta <- getResposta 1

            valor <- gerarValorRodada1 g

            if (verificarRespostaRodada1 id resposta f) then do
                putStrLn (acertouToString valor 1 (atualizaSalario salario valor True) 1)
                rodada1 (atualizaSalario salario valor True) (quant - 1) (perguntas ++ [id])
            else do
                putStrLn (errouToString valor 1 (atualizaSalario salario valor False) 1)
                rodada1 (atualizaSalario salario valor False) (quant - 1) (perguntas ++ [id])

    rodada2::Int -> Int -> [Int] -> IO()
    rodada2 salario quant perguntas = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA segunda rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""

        if (quant == 0) then rodada3 salario 3 []
        else do
            id <- gerarId perguntas 16
            e <- retornaEitherPerguntasRodada2
            d <- retornaEitherAlternativasRodada2
            f <- retornaEitherRespostasRodada2
            g <- retornaEitherPontosRodada2

            putStrLn (carregarAlternativasRodada2 id d)

            -- Lógica de escolher o multiplicador.
            
            putStrLn "\nEscolha um multiplicador para a sua premiação (entre 1x ou 2x): "
            multiplicador <- getMultiplicador 2

            valor <- gerarValorRodada2 g

            geraPerguntaRodada2 id e
            resposta <- getResposta 2
            let premioPergunta =  gerarValorPremio (parseMultiplicador multiplicador) valor
            
            if (verificarRespostaRodada2 id resposta f) then do
                 putStrLn (acertouToString valor premioPergunta (atualizaSalario salario premioPergunta True) 2)
                 rodada2 (atualizaSalario salario premioPergunta True) (quant - 1) (perguntas ++ [id])
            else do
                 putStrLn (errouToString valor premioPergunta (atualizaSalario salario premioPergunta False) 2)
                 rodada2 (atualizaSalario salario premioPergunta False) (quant - 1) (perguntas ++ [id])

    rodada3::Int -> Int -> [Int] -> IO()
    rodada3 salario quant perguntas = do
        if (quant == 3) then do
            putStrLn "\n========================================================"
            putStrLn "\nA terceira rodada vai iniciar, serão um total de 3 perguntas, boa sorte!\n"
        else do putStr ""
        
        if (quant == 0) then fimJogo salario
        else do
            id <- gerarId perguntas 20
            e <- retornaEitherPerguntasRodada3
            d <- retornaEitherAlternativasRodada3
            f <- retornaEitherRespostasRodada3
            g <- retornaEitherPontosRodada3

            putStrLn (carregarAlternativasRodada3 id d)

            -- Lógica de escolher o multiplicador.
            putStrLn "\nEscolha um multiplicador para a sua premiação (entre 1x, 2x ou 3x): "
            multiplicador <- getMultiplicador 3

            valor <- gerarValorRodada3 g

            geraPerguntaRodada3 id e
            resposta <- getResposta 3
            let premioPergunta =  gerarValorPremio (parseMultiplicador multiplicador) valor
            
            if (verificarRespostaRodada3 id resposta f) then do
                 
                 putStrLn (acertouToString valor premioPergunta (atualizaSalario salario premioPergunta True)3)
                 rodada3 (atualizaSalario salario premioPergunta True) (quant - 1) (perguntas ++ [id])
            else do
                 putStrLn (errouToString valor premioPergunta (atualizaSalario salario premioPergunta False) 3)
                 rodada3 (atualizaSalario salario premioPergunta False) (quant - 1) (perguntas ++ [id])

    
    geraPerguntaRodada1 :: Int -> Either String [Pergunta] -> IO()
    geraPerguntaRodada1 id e = putStrLn (carregarPerguntaRodada1 id e)

    geraPerguntaRodada2 :: Int -> Either String [PerguntaRodada2] -> IO()
    geraPerguntaRodada2 id e = putStrLn (carregarPerguntaRodada2 id e)

    geraPerguntaRodada3 :: Int -> Either String [PerguntaRodada3] -> IO()
    geraPerguntaRodada3 id e = putStrLn (carregarPerguntaRodada3 id e)

    gerarId:: [Int] -> Int -> IO Int
    gerarId perguntas maximo = do
        id <- gerarRandon maximo
        if elem id perguntas then do
            id <- gerarId perguntas maximo
            return id
        else return id
    
    -- Carrega um valor do arquivo para ser usado com o multiplicador
    gerarValorRodada1 :: Either String [Pontos] -> IO Int
    gerarValorRodada1 g = do
        id <- gerarRandon 4
        return (buscaValorPremioRodada1 id g)

    gerarValorRodada2 :: Either String [PontosRodada2] -> IO Int
    gerarValorRodada2 g = do
        id <- gerarRandon 4
        return (buscaValorPremioRodada2 id g)

    gerarValorRodada3 :: Either String [PontosRodada3] -> IO Int
    gerarValorRodada3 g = do
        id <- gerarRandon 4
        return (buscaValorPremioRodada3 id g)

    getResposta::Int -> IO String
    getResposta rodada = do
        op <- getLine
        if contem op (if rodada == 1 then "ab" else "abcd") then return op
        else do
            putStrLn ("Alternativa incorreta!\nPor favor tecle: " ++ (if rodada == 1 then "(a ou b)." else "(a, b, c ou d)."))
            op <- getResposta rodada
            return op

    getMultiplicador::Int -> IO String
    getMultiplicador rodada = do
        mult <- getLine
        if ((rodada == 2 && (elem mult ["1x","2x"])) || (rodada == 3 && (elem mult ["1x","2x","3x"]))) then return mult
        else do
            putStrLn ((if rodada == 2 then "Digite um valor de acordo com as opções dadas(1x e 2x): " else "Digite um valor de acordo com as opções dadas(1x, 2x ou 3x): "))
            mult <- getMultiplicador rodada
            return mult 

    parseMultiplicador :: String -> Int
    parseMultiplicador multi = digitToInt (head multi) :: Int 

    atualizaSalario :: Int -> Int -> Bool -> Int
    atualizaSalario salario gap status
        | status == True = salario + gap
        | otherwise = (if(salario - gap) < 0 then 0 else salario - gap)
                
    contem:: [Char] -> [Char] -> Bool
    contem elemento []  = False
    contem (x:xs) (h:t) = do
        if x == h then True
        else contem (x:xs) t
    
    fimJogo:: Int -> IO()
    fimJogo salario = do
        putStrLn ("Fim de Jogo!\nSeu Saldo final é de: " ++ (show salario) ++"\n\n")
        sairOuJogarNovamente

    sairOuJogarNovamente :: IO()
    sairOuJogarNovamente = do
        op <- verificaSaida
        if(op == "c") then do
            putStrLn(logoJogo)
            iniciaJogo 0
        else do
            putStrLn "\nAté a próxima!\n"
            putStrLn "The System finalized...\n"
    
    verificaSaida :: IO String 
    verificaSaida = do
        putStrLn "Tecle (c) jogar novamente ou (s) para sair: "
        op <- getLine
        if(elem op ["c","s"]) then 
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