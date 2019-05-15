{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}
module FileService(
   carregarPergunta,
   carregarPerguntaRodada2,
   carregarAlternativas,
   carregarAlternativasRodada2,
   verificarResposta,
   verificarRespostaRodada2,
   buscaValorPremio,
   retornaEitherAlternativas,
   retornaEitherPerguntas,
   retornaEitherRespostas,
   retornaEitherAlternativasRodada2,
   retornaEitherPerguntasRodada2,
   retornaEitherRespostasRodada2,
   Pergunta,
   Alternativa,
   Resposta,
   PerguntaRodada2,
   AlternativaRodada2,
   RespostaRodada2
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


      -- INSTÂNCIAS DE JSON PARA CADA TIPO DE DADO
      instance FromJSON Alternativa
      instance FromJSON Pergunta
      instance FromJSON Resposta
      instance FromJSON Pontos
      instance FromJSON AlternativaRodada2
      instance FromJSON PerguntaRodada2
      instance FromJSON RespostaRodada2
      instance FromJSON PontosRodada2
      
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
      respostasFile2 = "files/rodada1/respostas.json"
      
      getRespostas2 :: IO B.ByteString
      getRespostas2 = B.readFile respostasFile2

      
      -- PROMISES PARA OS ARQUIVOS DA RODADA 1

      -- Retorna um Either (Semelhante a promise de JavaScript) à partir da leitura do JSON
      retornaEitherAlternativas :: IO (Either String [Alternativa])
      retornaEitherAlternativas = (eitherDecode <$> getAlternativas) :: IO (Either String [Alternativa])
      
      retornaEitherPerguntas :: IO (Either String [Pergunta])
      retornaEitherPerguntas = (eitherDecode <$> getPerguntas) :: IO (Either String [Pergunta])
      
      retornaEitherRespostas :: IO (Either String [Resposta])
      retornaEitherRespostas = (eitherDecode <$> getRespostas) :: IO (Either String [Resposta])

      -- PROMISES PARA OS ARQUIVOS DA RODADA 2

      retornaEitherAlternativasRodada2 :: IO (Either String [AlternativaRodada2])
      retornaEitherAlternativasRodada2 = (eitherDecode <$> getAlternativas2) :: IO (Either String [AlternativaRodada2])

      retornaEitherPerguntasRodada2 :: IO (Either String [PerguntaRodada2])
      retornaEitherPerguntasRodada2 = (eitherDecode <$> getPerguntas2) :: IO (Either String [PerguntaRodada2])

      retornaEitherRespostasRodada2 :: IO (Either String [RespostaRodada2])
      retornaEitherRespostasRodada2 = (eitherDecode <$> getRespostas2) :: IO (Either String [RespostaRodada2])


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
      
      getAlternatives :: Alternativa -> [String]
      getAlternatives alt = alternativas alt

      getAlternativesRodada2 :: AlternativaRodada2 -> [String]
      getAlternativesRodada2 alt = alternativas_r2 alt
      
      alternativesFormattedRodada1 :: [String] -> String
      alternativesFormattedRodada1 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\n\n"
      
      alternativesFormattedRodada2e3 :: [String] -> String
      alternativesFormattedRodada2e3 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\nc) " ++ alt !! 2 ++ "\nd) " ++ alt !! 3 ++ "\n\n"
      
      questionFormatted :: Pergunta -> String
      questionFormatted perg = pergunta perg

      questionFormattedRodada2 :: PerguntaRodada2 -> String
      questionFormattedRodada2 perg = pergunta_r2 perg
      
      answerFormatted :: Resposta -> String
      answerFormatted ans = resposta ans

      answerFormattedRodada2 :: RespostaRodada2 -> String
      answerFormattedRodada2 ans = resposta_r2 ans

      carregarPergunta :: Int -> Int -> Either String [Pergunta] -> String
      carregarPergunta rodada id e
         | rodada == 1 = questionFormatted (getQuestionRodada1 (lerJSON e) id)

      carregarPerguntaRodada2 :: Int -> Either String [PerguntaRodada2] -> String
      carregarPerguntaRodada2 id e = questionFormattedRodada2 (getQuestionRodada2 (lerJSON e) id)

      carregarAlternativas :: Int -> Either String [Alternativa] -> String
      carregarAlternativas id d = alternativesFormattedRodada1  (getAlternatives (getQuestionRodada1 (lerJSON d) id))

      carregarAlternativasRodada2 :: Int -> Either String [AlternativaRodada2] -> String
      carregarAlternativasRodada2 id d = alternativesFormattedRodada2e3  (getAlternativesRodada2 (getQuestionRodada2 (lerJSON d) id))
         
      verificarResposta :: Int -> String -> Either String [Resposta] -> Bool
      verificarResposta id respostaJogador f = do
         let resposta = answerFormatted (getQuestionRodada1 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      verificarRespostaRodada2 :: Int -> String -> Either String [RespostaRodada2] -> Bool
      verificarRespostaRodada2 id respostaJogador f = do
         let resposta = answerFormattedRodada2 (getQuestionRodada2 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      buscaValorPremio:: Int -> Int -> Int
      buscaValorPremio rodada id = 0



    
