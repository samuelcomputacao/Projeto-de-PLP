{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}
module FileService(
   carregarPergunta,
   carregarResposta,
   verificarResposta,
   buscaValorPremio,
   retornaEitherAlternativas,
   retornaEitherPerguntas,
   retornaEitherRespostas,
   Pergunta
   )where
      
      import Data.Aeson
      import Data.Text
      import qualified Data.ByteString.Lazy as B
      import GHC.Generics
      import GHC.Read
      
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
      
      instance FromJSON Alternativa
      instance FromJSON Pergunta
      instance FromJSON Resposta
      instance FromJSON Pontos
      
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
      
      -- Retorna um Either (Semelhante a promise de JavaScript) à partir da leitura do JSON
      retornaEitherAlternativas :: IO (Either String [Alternativa])
      retornaEitherAlternativas = (eitherDecode <$> getAlternativas) :: IO (Either String [Alternativa])
      
      retornaEitherPerguntas :: IO (Either String [Pergunta])
      retornaEitherPerguntas = (eitherDecode <$> getPerguntas) :: IO (Either String [Pergunta])
      
      retornaEitherRespostas :: IO (Either String [Resposta])
      retornaEitherRespostas = (eitherDecode <$> getRespostas) :: IO (Either String [Resposta])


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
      
      getQuestionRodada2 :: [t] -> String -> t
      getQuestionRodada2 [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q] id
         | id == "0" = a
         | id == "1" = b
         | id == "2" = c
         | id == "3" = d
         | id == "4" = e
         | id == "5" = f
         | id == "6" = g
         | id == "7" = h
         | id == "8" = i
         | id == "9" = j
         | id == "10" = k
         | id == "11" = l
         | id == "12" = m
         | id == "13" = n
         | id == "14" = o
         | id == "15" = p
         | id == "16" = q
      
      getQuestionRodada3 :: [t] -> String -> t
      getQuestionRodada3 [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u] id
         | id == "0" = a
         | id == "1" = b
         | id == "2" = c
         | id == "3" = d
         | id == "4" = e
         | id == "5" = f
         | id == "6" = g
         | id == "7" = h
         | id == "8" = i
         | id == "9" = j
         | id == "10" = k
         | id == "11" = l
         | id == "12" = m
         | id == "13" = n
         | id == "14" = o
         | id == "15" = p
         | id == "16" = q
         | id == "17" = r
         | id == "18" = s
         | id == "19" = t
         | id == "20" = u
      
      
      getAlternatives :: Alternativa -> [String]
      getAlternatives alt = alternativas alt
      
      alternativesFormattedRodada1 :: [String] -> String
      alternativesFormattedRodada1 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\n\n"
      
      alternativesFormattedRodada2e3 :: [String] -> String
      alternativesFormattedRodada2e3 alt = "a) " ++ alt !! 0 ++ "\nb) " ++ alt !! 1 ++ "\nc) " ++ alt !! 2 ++ "\nd) " ++ alt !! 3 ++ "\n\n"
      
      questionFormatted :: Pergunta -> String
      questionFormatted perg = pergunta perg
      
      answerFormatted :: Resposta -> String
      answerFormatted ans = resposta ans

      carregarPergunta :: Int -> Either String [Pergunta] -> String
      carregarPergunta id e = do
         questionFormatted (getQuestionRodada1 (lerJSON e) id)

      carregarResposta:: Int -> Int -> Either String [Alternativa] -> String
      carregarResposta rodada id d = do
         alternativesFormattedRodada1  (getAlternatives (getQuestionRodada1 (lerJSON d) id))

      verificarResposta:: Int -> String -> Either String [Resposta] -> Bool
      verificarResposta id respostaJogador f = do
         let resposta = answerFormatted (getQuestionRodada1 (lerJSON f) id)
         if (resposta == respostaJogador) then True
         else False

      buscaValorPremio:: Int -> Int -> Int
      buscaValorPremio rodada id = 0



    
