{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}
module FileService(
   carregarPerguntaRodada1,
   carregarPerguntaRodada2,
   carregarPerguntaRodada3,
   carregarAlternativasRodada1,
   carregarAlternativasRodada2,
   carregarAlternativasRodada3,
   verificarRespostaRodada1,
   verificarRespostaRodada2,
   verificarRespostaRodada3,
   carregarValorMultiplicadorRodada1,
   buscaValorPremio,
   retornaEitherAlternativasRodada1,
   retornaEitherPerguntasRodada1,
   retornaEitherRespostasRodada1,
   retornaEitherPontosRodada1,
   retornaEitherAlternativasRodada2,
   retornaEitherPerguntasRodada2,
   retornaEitherRespostasRodada2,
   retornaEitherPontosRodada2,
   retornaEitherAlternativasRodada3,
   retornaEitherPerguntasRodada3,
   retornaEitherRespostasRodada3,
   retornaEitherPontosRodada3,
   Pergunta,
   Alternativa,
   Resposta,
   Pontos,
   PerguntaRodada2,
   AlternativaRodada2,
   RespostaRodada2,
   PontosRodada2,
   PerguntaRodada3,
   AlternativaRodada3,
   RespostaRodada3,
   PontosRodada3
   )where
      
      import Data.Aeson
      import Data.Text
      import qualified Data.ByteString.Lazy as B
      import GHC.Generics
      import GHC.Read
      

      -- DEFINIÇÃO DOS TIPOS DE DADOS PARA A RODADA 1

      data Alternativa = Alternativa {
         id :: !Int,
         alternativas :: ![String]
      } deriving (Generic, Show, Read)
      
      data Pergunta = Pergunta {
         id1 :: !Int,
         pergunta :: !String
      } deriving (Generic, Show, Read)
      
      data Resposta = Resposta {
         id2 :: !Int,
         resposta :: !String
      } deriving (Generic, Show, Read)
      
      data Pontos = Pontos {
         id3 :: !Int,
         multiplicador :: !Int
      } deriving (Generic, Show, Read)
      
      -- DEFINIÇÃO DOS TIPOS DE DADOS PARA A RODADA 2

      data AlternativaRodada2 = AlternativaRodada2 {
         id_r2 :: !Int,
         alternativas_r2 :: ![String]
      } deriving (Generic, Show, Read)

      data PerguntaRodada2 = PerguntaRodada2 {
         id1_r2 :: !Int,
         pergunta_r2 :: !String
      } deriving (Generic, Show, Read)

      data RespostaRodada2 = RespostaRodada2 {
         id2_r2 :: !Int,
         resposta_r2 :: !String
      } deriving (Generic, Show, Read)

      data PontosRodada2 = PontosRodada2 {
         id3_r2 :: !Int,
         multiplicador_r2 :: !Int
      } deriving (Generic, Show, Read)

      -- DEFINIÇÃO DOS TIPOS DE DADOS PARA A RODADA 3

      data AlternativaRodada3 = AlternativaRodada3 {
         id_r3 :: !Int,
         alternativas_r3 :: ![String]
      } deriving (Generic, Show, Read)

      data PerguntaRodada3 = PerguntaRodada3 {
         id1_r3 :: !Int,
         pergunta_r3 :: !String
      } deriving (Generic, Show, Read)

      data RespostaRodada3 = RespostaRodada3 {
         id2_r3 :: !Int,
         resposta_r3 :: !String
      } deriving (Generic, Show, Read)

      data PontosRodada3 = PontosRodada3 {
         id3_r3 :: !Int,
         multiplicador_r3 :: !Int
      } deriving (Generic, Show, Read)


      -- INSTÂNCIAS DE JSON PARA CADA TIPO DE DADO
      instance FromJSON Alternativa
      instance FromJSON Pergunta
      instance FromJSON Resposta
      instance FromJSON Pontos
      instance FromJSON AlternativaRodada2
      instance FromJSON PerguntaRodada2
      instance FromJSON RespostaRodada2
      instance FromJSON PontosRodada2
      instance FromJSON AlternativaRodada3
      instance FromJSON PerguntaRodada3
      instance FromJSON RespostaRodada3
      instance FromJSON PontosRodada3
      
      -- ARQUIVOS PARA A RODADA 1

      -- Arquivo de alternativas
      alternativasFile :: FilePath
      alternativasFile = "files/rodada1/alternativas.json"
      
      getAlternativas :: IO B.ByteString
      getAlternativas = B.readFile alternativasFile
      
      -- Arquivo de perguntas
      perguntasFile :: FilePath
      perguntasFile = "files/rodada1/perguntas.json"
      
      getPerguntas :: IO B.ByteString
      getPerguntas = B.readFile perguntasFile
      
      -- Arquivo de respostas
      respostasFile :: FilePath
      respostasFile = "files/rodada1/respostas.json"
      
      getRespostas :: IO B.ByteString
      getRespostas = B.readFile respostasFile

      -- Arquivo de pontos
      pontosFile :: FilePath
      pontosFile = "files/rodada1/valores.json"

      getPontos :: IO B.ByteString
      getPontos = B.readFile pontosFile


      -- ARQUIVOS PARA A RODADA 2

      -- Arquivos de alternativas
      alternativasFile2 :: FilePath
      alternativasFile2 = "files/rodada2/alternativas.json"

      getAlternativas2 :: IO B.ByteString
      getAlternativas2 = B.readFile alternativasFile2

      -- Arquivo de perguntas
      perguntasFile2 :: FilePath
      perguntasFile2 = "files/rodada2/perguntas.json"
      
      getPerguntas2 :: IO B.ByteString
      getPerguntas2 = B.readFile perguntasFile2
      
      -- Arquivo de respostas
      respostasFile2 :: FilePath
      respostasFile2 = "files/rodada2/respostas.json"
      
      getRespostas2 :: IO B.ByteString
      getRespostas2 = B.readFile respostasFile2

      -- Arquivo de pontos
      pontosFile2 :: FilePath
      pontosFile2 = "files/rodada2/valores.json"

      getPontos2 :: IO B.ByteString
      getPontos2 = B.readFile pontosFile2


      -- ARQUIVOS PARA A RODADA 3

      -- Arquivos de alternativas
      alternativasFile3 :: FilePath
      alternativasFile3 = "files/rodada3/alternativas.json"

      getAlternativas3 :: IO B.ByteString
      getAlternativas3 = B.readFile alternativasFile3

      -- Arquivo de perguntas
      perguntasFile3 :: FilePath
      perguntasFile3 = "files/rodada3/perguntas.json"
      
      getPerguntas3 :: IO B.ByteString
      getPerguntas3 = B.readFile perguntasFile3
      
      -- Arquivo de respostas
      respostasFile3 :: FilePath
      respostasFile3 = "files/rodada3/respostas.json"
      
      getRespostas3 :: IO B.ByteString
      getRespostas3 = B.readFile respostasFile3

      -- Arquivo de pontos
      pontosFile3 :: FilePath
      pontosFile3 = "files/rodada3/valores.json"

      getPontos3 :: IO B.ByteString
      getPontos3 = B.readFile pontosFile3
      

      -- PROMISES PARA OS ARQUIVOS DA RODADA 1

      -- Retorna um Either (Semelhante a promise de JavaScript) à partir da leitura do JSON
      retornaEitherAlternativasRodada1 :: IO (Either String [Alternativa])
      retornaEitherAlternativasRodada1 = (eitherDecode <$> getAlternativas) :: IO (Either String [Alternativa])
      
      retornaEitherPerguntasRodada1 :: IO (Either String [Pergunta])
      retornaEitherPerguntasRodada1 = (eitherDecode <$> getPerguntas) :: IO (Either String [Pergunta])
      
      retornaEitherRespostasRodada1 :: IO (Either String [Resposta])
      retornaEitherRespostasRodada1 = (eitherDecode <$> getRespostas) :: IO (Either String [Resposta])

      retornaEitherPontosRodada1 :: IO (Either String [Pontos])
      retornaEitherPontosRodada1 = (eitherDecode <$> getPontos) :: IO (Either String [Pontos])


      -- PROMISES PARA OS ARQUIVOS DA RODADA 2

      retornaEitherAlternativasRodada2 :: IO (Either String [AlternativaRodada2])
      retornaEitherAlternativasRodada2 = (eitherDecode <$> getAlternativas2) :: IO (Either String [AlternativaRodada2])

      retornaEitherPerguntasRodada2 :: IO (Either String [PerguntaRodada2])
      retornaEitherPerguntasRodada2 = (eitherDecode <$> getPerguntas2) :: IO (Either String [PerguntaRodada2])

      retornaEitherRespostasRodada2 :: IO (Either String [RespostaRodada2])
      retornaEitherRespostasRodada2 = (eitherDecode <$> getRespostas2) :: IO (Either String [RespostaRodada2])

      retornaEitherPontosRodada2 :: IO (Either String [PontosRodada2])
      retornaEitherPontosRodada2 = (eitherDecode <$> getPontos2) :: IO (Either String [PontosRodada2])


      -- PROMISES PARA OS ARQUIVOS DA RODADA 3

      retornaEitherAlternativasRodada3 :: IO (Either String [AlternativaRodada3])
      retornaEitherAlternativasRodada3 = (eitherDecode <$> getAlternativas3) :: IO (Either String [AlternativaRodada3])

      retornaEitherPerguntasRodada3 :: IO (Either String [PerguntaRodada3])
      retornaEitherPerguntasRodada3 = (eitherDecode <$> getPerguntas3) :: IO (Either String [PerguntaRodada3])

      retornaEitherRespostasRodada3 :: IO (Either String [RespostaRodada3])
      retornaEitherRespostasRodada3 = (eitherDecode <$> getRespostas3) :: IO (Either String [RespostaRodada3])

      retornaEitherPontosRodada3 :: IO (Either String [PontosRodada3])
      retornaEitherPontosRodada3 = (eitherDecode <$> getPontos3) :: IO (Either String [PontosRodada3])


      -- Retorna um array de Objetos, recebe como parâmetro a promise e verifica se ela foi executada com êxito, se sim retorna Right, caso contrário
      -- retorna Left = erro.
      lerJSON :: Either String [t] -> [t]
      lerJSON entrada =
         case entrada of
            Right ps -> ps
            Left err -> []
      
      getQuestionRodada1 :: [t] -> Int -> t
      getQuestionRodada1 [a,b,c,d,e,f,g,h,i,j,k,l,m] id
         | id == 0 = a
         | id == 1 = b
         | id == 2 = c
         | id == 3 = d
         | id == 4 = e
         | id == 5 = f
         | id == 6 = g
         | id == 7 = h
         | id == 8 = i
         | id == 9 = j
         | id == 10 = k
         | id == 11 = l
         | id == 12 = m
      
      getQuestionRodada2 :: [t] -> Int -> t
      getQuestionRodada2 [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q] id
         | id == 0 = a
         | id == 1 = b
         | id == 2 = c
         | id == 3 = d
         | id == 4 = e
         | id == 5 = f
         | id == 6 = g
         | id == 7 = h
         | id == 8 = i
         | id == 9 = j
         | id == 10 = k
         | id == 11 = l
         | id == 12 = m
         | id == 13 = n
         | id == 14 = o
         | id == 15 = p
         | id == 16 = q

      getQuestionRodada3 :: [t] -> Int -> t
      getQuestionRodada3 [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u] id
         | id == 0 = a
         | id == 1 = b
         | id == 2 = c
         | id == 3 = d
         | id == 4 = e
         | id == 5 = f
         | id == 6 = g
         | id == 7 = h
         | id == 8 = i
         | id == 9 = j
         | id == 10 = k
         | id == 11 = l
         | id == 12 = m
         | id == 13 = n
         | id == 14 = o
         | id == 15 = p
         | id == 16 = q
         | id == 17 = r
         | id == 18 = s
         | id == 19 = t
         | id == 20 = u
      
      getAlternativesRodada1 :: Alternativa -> [String]
      getAlternativesRodada1 alt = alternativas alt

      getAlternativesRodada2 :: AlternativaRodada2 -> [String]
      getAlternativesRodada2 alt = alternativas_r2 alt

      getAlternativesRodada3 :: AlternativaRodada3 -> [String]
      getAlternativesRodada3 alt = alternativas_r3 alt
      
      alternativesFormattedRodada1 :: [String] -> String
      alternativesFormattedRodada1 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\n\n"
      
      alternativesFormattedRodada2e3 :: [String] -> String
      alternativesFormattedRodada2e3 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\nc) " ++ alt !! 2 ++ "\nd) " ++ alt !! 3 ++ "\n\n"
      
      questionFormattedRodada1 :: Pergunta -> String
      questionFormattedRodada1 perg = pergunta perg

      questionFormattedRodada2 :: PerguntaRodada2 -> String
      questionFormattedRodada2 perg = pergunta_r2 perg

      questionFormattedRodada3 :: PerguntaRodada3 -> String
      questionFormattedRodada3 perg = pergunta_r3 perg
      
      answerFormattedRodada1 :: Resposta -> String
      answerFormattedRodada1 ans = resposta ans

      answerFormattedRodada2 :: RespostaRodada2 -> String
      answerFormattedRodada2 ans = resposta_r2 ans

      answerFormattedRodada3 :: RespostaRodada3 -> String
      answerFormattedRodada3 ans = resposta_r3 ans

      carregarPerguntaRodada1 :: Int -> Either String [Pergunta] -> String
      carregarPerguntaRodada1 id e = questionFormattedRodada1 (getQuestionRodada1 (lerJSON e) id)

      carregarPerguntaRodada2 :: Int -> Either String [PerguntaRodada2] -> String
      carregarPerguntaRodada2 id e = questionFormattedRodada2 (getQuestionRodada2 (lerJSON e) id)

      carregarPerguntaRodada3 :: Int -> Either String [PerguntaRodada3] -> String
      carregarPerguntaRodada3 id e = questionFormattedRodada3 (getQuestionRodada3 (lerJSON e) id)

      carregarAlternativasRodada1 :: Int -> Either String [Alternativa] -> String
      carregarAlternativasRodada1 id d = alternativesFormattedRodada1  (getAlternativesRodada1 (getQuestionRodada1 (lerJSON d) id))

      carregarAlternativasRodada2 :: Int -> Either String [AlternativaRodada2] -> String
      carregarAlternativasRodada2 id d = alternativesFormattedRodada2e3  (getAlternativesRodada2 (getQuestionRodada2 (lerJSON d) id))

      carregarAlternativasRodada3 :: Int -> Either String [AlternativaRodada3] -> String
      carregarAlternativasRodada3 id d = alternativesFormattedRodada2e3 (getAlternativesRodada3 (getQuestionRodada3 (lerJSON d) id))
         
      verificarRespostaRodada1 :: Int -> String -> Either String [Resposta] -> Bool
      verificarRespostaRodada1 id respostaJogador f = do
         let resposta = answerFormattedRodada1 (getQuestionRodada1 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      verificarRespostaRodada2 :: Int -> String -> Either String [RespostaRodada2] -> Bool
      verificarRespostaRodada2 id respostaJogador f = do
         let resposta = answerFormattedRodada2 (getQuestionRodada2 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      verificarRespostaRodada3 :: Int -> String -> Either String [RespostaRodada3] -> Bool
      verificarRespostaRodada3 id respostaJogador f = do
         let resposta = answerFormattedRodada3 (getQuestionRodada3 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      getPontuacaoPorId :: [t] -> Int -> t
      getPontuacaoPorId [a,b,c,d,e] id
         | id == 0 = a
         | id == 1 = b
         | id == 2 = c
         | id == 3 = d
         | id == 4 = e 
         
      getMultiplicadorRodada1 :: Pontos -> Int
      getMultiplicadorRodada1 alt = multiplicador alt

      getMultiplicadorRodada2 :: PontosRodada2 -> Int
      getMultiplicadorRodada2 alt = multiplicador_r2 alt

      getMultiplicadorRodada3 :: PontosRodada3 -> Int
      getMultiplicadorRodada3 alt = multiplicador_r3 alt

      carregarValorMultiplicadorRodada1 :: Int -> Either String [Pontos] -> Int
      carregarValorMultiplicadorRodada1 id g = getMultiplicadorRodada1 (getPontuacaoPorId (lerJSON g) id)

      buscaValorPremio:: Int -> Int -> Int
      buscaValorPremio rodada id = 0



    
