{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}

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

getQuestionRodada1 :: [t] -> String -> t
getQuestionRodada1 [a,b,c,d,e,f,g,h,i,j,k,l,m] id
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

main :: IO ()
main = do
   -- Promises de processamento nos arquivos
   d <- retornaEitherAlternativas
   e <- retornaEitherPerguntas
   f <- retornaEitherRespostas
   num <- getLine
   -- mostra as alternativas de uma questão
   putStrLn (alternativesFormattedRodada1  (getAlternatives (getQuestionRodada1 (lerJSON d) num)))
   -- mostra a questão em si
   putStrLn (questionFormatted (getQuestionRodada1 (lerJSON e) num))
   -- pega a resposta da questão
   let respostaSistema = answerFormatted (getQuestionRodada1 (lerJSON f) num)

   -- pede a resposta do usuário
   putStr "Por favor, informe a sua resposta: "
   respostaUsuario <- getLine
   if (respostaSistema == respostaUsuario) then putStrLn "Resposta Correta!" else putStrLn "Resposta Incorreta!"
   return()


