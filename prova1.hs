
fibonacci :: Int -> [Int]
fibonacci 0 = [1]
fibonacci 1 = fibonacci 0 ++ [1]
fibonacci n = fibonacci (n-1) ++ [last(fibonacci(n-1)) + last(fibonacci(n-2))]

merge :: Ord t => [t] -> [t] -> [t]
merge [] [] = []
merge as [] = as
merge [] bs = bs
merge (a:as) (b:bs) | a <= b = a : merge as (b:bs)
                    | otherwise = b : merge (a:as) bs

type Pilha t = [t]

exemploPilhaElem :: Pilha Elemento
exemploPilhaElem = [Valor 10, Valor 20, Soma, Valor 30, Multiplica]

data Elemento = Valor Int | Soma | Multiplica deriving (Show)

gera_string :: Pilha Elemento -> String
gera_string [] = []
gera_string pil = "(" ++ gera_string2 pil ++ ")"

gera_string2 :: Pilha Elemento -> String
gera_string2 [] = []
gera_string2 [Valor x] = show x
gera_string2 (Valor x: Valor y: Soma:as)       = "(" ++ show x ++ "+" ++ show y ++ ")" ++ gera_string2 as
gera_string2 (Valor x: Multiplica:as)          = "*" ++ show x ++ gera_string2 as
gera_string2 (Valor x: Valor y: Multiplica:as) = "(" ++ show x ++ "*" ++ show y ++ ")" ++ gera_string2 as
gera_string2 (Valor x: Soma:as)                = "+" ++ show x ++ gera_string2 as

calcula :: Pilha Elemento -> Int
calcula [] = 0
calcula [Valor x] = x
calcula (Valor x: Valor y: Soma: as)                = calcula (Valor (x+y) : as)
calcula (Valor x:Valor y: Multiplica: as)           = calcula (Valor(x*y) : as)
calcula (Valor x: Valor y: Valor z: Soma: as)       = calcula (Valor (x+y+z) : as)
calcula (Valor x:Valor y: Valor z : Multiplica: as) = calcula (Valor(x*y*z) : as)
