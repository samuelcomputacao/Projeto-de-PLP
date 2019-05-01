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
            let retorno = iniciaJogo 0
            putStrLn $ ("Prêmio Final: " ++ show retorno)
        else if num == 2 then
            putStrLn tutorial
        else
            putStrLn "Sair"
        
    
    getOpcao::IO String
    getOpcao = do
        putStrLn "Digite uma opcao(1, 2 ou 3) APENAS!:"
        op <- getLine
        if op == "1" || op == "2" || op == "3" then
            return op
            else do
                op <- getOpcao    
                return op

    iniciaJogo::Int -> Int
    iniciaJogo salario =
        let
            salarioR1  = rodada1 salario
            salarioR2 = rodada2 salarioR1
            salarioR3 = rodada3 salarioR2
        in salarioR3
        
    

    validaResposta:: Int -> Char -> Bool
    validaResposta rodada resposta = True
    
    rodada1::Int -> Int
    rodada1 salario = salario

    rodada2::Int -> Int
    rodada2 salario = salario

    rodada3::Int -> Int
    rodada3 salario = salario


