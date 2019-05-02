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
        if (op == "c") then print (iniciaJogo 0)
        else do
            if (op == "v") then main
            else do
                putStrLn "Incorreto!\nPor favor tecle (c) para começar o jogo ou (v) para voltar: "
            

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


