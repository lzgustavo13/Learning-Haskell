{-1 ) (2.5) Defina uma função que insira uma lista (primeiro parâmetro) em uma outra lista (segundo parâmetro) 
em uma posição informada (terceiro parâmetro). 
Se a posição por menor ou igual a zero insira a primeira lista no início da segunda lista;
se for igual ou maior que o tamanho da segundo lista, insira ela no final.

insert :: [t] -> [t] -> Int -> [t]

exemplo: insert "abc" "xyz 123 def" 4 --> "xyz abc123 def"
exemplo: insert "abc" "xyz 123 def" 0 --> "abcxyz 123 def"
exemplo: inesrt [1,2] [3,4,5,6] 10 --> [3,4,5,6,1,2]
-}



inserir :: [t] -> [t] -> Int -> [t]
inserir [] [] _ = []
inserir lista1 lista2 pos| pos <= 0 =  lista1 ++ lista2
                         | length(lista2) < pos =  lista2 ++ lista1
                         | otherwise = take pos lista2  ++ lista1 ++ drop pos lista2

{-2) (2.5) Defina uma função que informa em que posição um elemento (primeiro parametro) 
ocorre um uma lista (segundo parâmetro). 
Caso ele não ocorra você deve retornar o resultado (-1).
Considere que primeira posição de uma lista é a posição zero.

search :: Eq t => t -> [t] - > Int

exemplo: search 'a' "xy wxy ab def abc xyz" ---> 7
exemplo: search 'z' "xy wxy ab def abc xyz" ---> 20
exemplo: search 1 [1,2,3,4,5,6,7,8,22] ---> 0
exemplo: search 'k' "xy wxy ab dxefy abc xyz" ---> -1
-}


search :: Eq t => t -> [t] -> Int
search _ [] = -1
search letra lista | pos < length(lista) = pos 
                   | otherwise = -1
                   where pos = length(takeWhile(/= letra) lista)
                   
 {-3) (2.5) Dado o tipo de dados abaixo, que representa as horas do dia em formato de 
12h pela manhã (AM) e 12h a partir de meio dia (PM), defina uma função em que sejam
adicionados minutos a uma hora do dia, considerando a possível mudanca de turno. 
assuma que o formato da hora é vaálido e que serão somados no máximo 719 minutos.

data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

somaMinutos :: TimeOfDay -> Int -> TimeOfDay

exemplo: somar 30 minutos ás 11:59 da manhã:
exemplo: somaMinutos (AM 11 59) 30 --> PM 12 29
exemplo: somaMinutos (PM 10 28) 22 --> PM 10 50
-}

data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

somaHoras :: Int -> Int -> Int
somaHoras  minu n | (minu + n) > 60 = n `div` 60 + 1
                  | otherwise = n `div` 60 

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos (PM h m) num | h + somaHoras m (num) < 12 = (PM (mod(h + somaHoras m (num))(12)) (mod(m+num - 60)(60)))
somaMinutos (AM h m) num | h + somaHoras m (num) < 12 = (AM (mod(h + somaHoras m (num))12) (mod(m+num - 60)(60)))
somaMinutos (PM h m) num | h + somaHoras m (num) == 12 = (AM (h + somaHoras m (num)) (mod(m+num - 60)(60)))
somaMinutos (AM h m) num | h + somaHoras m (num) == 12 = (PM (h + somaHoras m (num)) (mod(m+num - 60)(60)))
somaMinutos (PM h m) num | h + somaHoras m (num) > 12 = (AM (mod(h + somaHoras m (num))12) (mod(m+num - 60)(60)))
somaMinutos (AM h m) num | h + somaHoras m (num) > 12 = (PM (mod(h + somaHoras m (num))12) (mod(m+num - 60)(60)))

{-4) (2.5) Dado o tipo de dados abaixo, que indica se um valor é vaálido ou inválido (incorreto) 
defina uma função em que seja passado um valor de hora e minutos em formato de 24h 
e a função converta pra o formato TimeOfDay, se for possível, 
retornando o resultado com o construtor Success e a hora no novo formato, 
ou retornando Fail (falha/erro) se o formato for inválido 
(não for menor que 24 ou os mintutos não fqorem menores que 60).

data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay

exemplo: converter a hora 22:10
convertTime 22 10 ---> Success (PM 10 10)
convertTime 24 62 ---> Fail
-}

data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m | h > 24 || m > 60 = Fail
                | h > 12 = Success (PM (mod(h)(12)) (mod(m)(60)))
                | h == 12 = Success (PM 12 (mod(m)(60)))
                | otherwise = Success (AM (mod(h)(12)) (mod(m)(60)))
