import GHC.Generics (C, S)
import Data.Char 
import GHC.Exts.Heap.Closures (GenClosure(FloatClosure, n_args))
answer :: Int
answer = 42

greater :: Bool
greater = (answer > 71)

yes:: Bool
yes = True

square ::Float ->Float
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

maxi :: Int -> Int -> Int 
maxi n m | n>= m = n
         | otherwise = m

mini :: Int -> Int -> Int 
mini n m | n<= m = n
         | otherwise = m

imc :: Float -> Float -> Float
imc peso altura = peso / square altura

maiorQue :: Int -> Int -> Int -> Bool
maiorQue a b c | (a < b) && (b < c) = True
               | otherwise = False

vendas :: Int -> Int
vendas 0 = 12
vendas 1 = 14
vendas 2 = 15
vendas 3 = 16
vendas 4 = 5
vendas n = 0

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n
              | n > 0 = vendas n + totalVendas(n-1)
              | otherwise = 0

maxVendas :: Int -> Int
maxVendas n | n == 0 = 0
            | n > 0 = max(vendas n) (vendas n-1)
            | otherwise = 0
 
funC :: Int -> Int -> Int
funC s 0 | s == vendas 0 = 1
         | otherwise = 0
funC s n | s == vendas n = 1 + funC s (n-1)
         | otherwise = funC s (n-1)

ehPrimo :: Int -> Bool
ehPrimo 2 = True
ehPrimo n |  mod n 2 /= 0 && mod n 3 /= 0 && mod n 5 /= 0 && mod n 7 /= 0 = True
          | otherwise = False

mdc :: Int -> Int -> Int
mdc a 0 =  a
mdc a b = mdc b (mod a b)

primosSi :: Int -> Int -> Bool
primosSi n m | mdc n m == 1 = True
            | otherwise = False

fat :: Int -> Int
fat 0 = 1
fat n = n * fat(n-1)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal n m p q | allEqual n m p == True && q == p = True
                  | otherwise = False

equalCont :: Int -> Int -> Int -> Int
equalCont n m p | allEqual n m p == True = 3
                | n == p || n == m || m == p = 2
                | otherwise = 0

xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)

eXor :: Bool -> Bool -> Bool
eXor True x = not x
eXor False x = x

addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos(n-1)

paraDireita :: Int -> String -> String
paraDireita 0 str = str
paraDireita n str = addEspacos n ++ str

cabecalho :: String 
cabecalho = "Semana" ++ addEspacos 5 ++ "Venda" ++ "\n"

iSemanas :: Int -> String
iSemanas 0 = "0" ++ addEspacos(10) ++ show(vendas 0) ++ "\n"
iSemanas n =  iSemanas (n-1) ++ show n ++ addEspacos(10) ++ show(vendas n) ++ "\n"

iTotal :: Int -> String
iTotal n = "Total:" ++ addEspacos(5) ++ show(totalVendas n) ++ "\n"

iMedia :: Int -> String
iMedia n = "Média:" ++ addEspacos 5 ++ show (fromIntegral (totalVendas n) / fromIntegral (n+1)) ++ "\n"

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr(cabecalho ++ iSemanas n ++ iTotal n ++ iMedia n)

{- funções de listas
    head - pega a cabeça da lista
    tail - lista da cauda
    length - comprimento da lista
    ++ - concatenar duas listas
-}

sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as

maiorLista :: [Int] -> Int
maiorLista [] = minBound :: Int
maiorLista[x] = x
maiorLista (a:as) | a > maiorLista as = a
                  | otherwise = maiorLista as

merge :: [Int] -> [Int] -> [Int]
merge [][] = []
merge as [] = as
merge [] bs = bs
merge (a:as) (b:bs) | a <= b = a : merge as (b:bs)
                    | otherwise = b : merge (a:as) bs

-- case of

qSort :: [Int] -> [Int]
qSort [] = []
qSort (a:as) = qSort[y | y <- as ,y < a] ++ [a] ++ qSort[y | y <- as ,y >= a]

fib :: Int -> [Int]
fib 0 = [1]
fib 1 = fib 0 ++ [1]
fib n = fib (n-1) ++ [last(fib(n-1)) + last(fib(n-2))]


-- ax2 + bx + c = 0.0 
-- x = (-b +- sqrt(b2-4ac))/2a

oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float,Float)
twoRoots a b c = (d-e, d+e)
 where d = -b/(2.0*a)
       e = (sqrt(b*b - (4.0*a*c)))/(2.0*a)

roots :: Float -> Float -> Float -> (Int,Float,Float)
roots a b c | b*b - 4.0*a*c < 0 = (0,0,0)
            | b*b - 4.0*a*c == 0 = (1,(oneRoot a b c), 0)
            | otherwise = (2,raiz1,raiz2)
              where (raiz1,raiz2) = twoRoots a b c 

max3 :: Int -> Int -> Int -> Int
max3 a b c | (a >= b) && (a >=c) = a 
           | (b >= a) && (b >= c) = b 
           | otherwise = c

min3 :: Int -> Int -> Int -> Int
min3 a b c | (a <= b) && (a <=c) = a 
           | (b <= a) && (b <= c) = b 
           | otherwise = c

menorMaior :: Int -> Int -> Int -> (Int,Int)
menorMaior a b c = (min3(a)(b)(c),max3(a)(b)(c))

ordenaTripla :: (Int,Int,Int) -> (Int,Int,Int)
ordenaTripla (a,b,c) = (x,y,z)
            where lista = qSort [a,b,c]
                  [x,y,z] = lista

somarDigitos :: Int -> Int
somarDigitos 0 = 0
somarDigitos n = mod n 10 + somarDigitos (div n 10)

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

fsPonto :: Ponto -> Float 
fsPonto p = x
    where x = fst(p)

snPonto :: Ponto -> Float 
snPonto p = x
    where x = snd(p)

vertical :: Reta -> Bool
vertical ((a,b),(x,y)) | a == x = True
                      | otherwise = False

-- Compreensão de lista [expressão que usa variavel | variavel <- lista, cond]
--[x*x | x<-[1..10]]

--funções de alta ordem
applyBinOper :: (t->t->u) -> t -> t ->u 
applyBinOper f x y = f x y

times2 :: Int -> Int
times2 n = 2*n

sqr :: Int -> Int
sqr n = n*n

-- map f l = [f a | a <- l]
mapping :: (t -> u) -> [t] -> [u]
mapping f [] = []
mapping f (a:as) = f a : mapping f as

doubleList :: [Int] -> [Int]
doubleList xs = mapping times2 xs

sqrList :: [Int] -> [Int]
sqrList xs = mapping sqr xs

folding :: (t -> t -> t) -> [t] -> t 
folding f [a] = a
folding f (a:as) = f a (folding f as)

sumList2 :: Num t => [t] -> t
sumList2 l = folding (+) l

--foldr1 = (t -> u -> u) -> u -> [t] -> u

isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescent f n | f n >= f (n-1) = isCrescent f (n-1)
               | otherwise = False

capitalize :: Char -> Char
capitalize ch = chr (ord ch + offset)
 where offset = ord 'A' - ord 'a'

agrupar :: Eq t => [[t]] -> [(t, Int)]
agrupar [] = []
agrupar lst = agruparLista (concat lst)  -- Concatena todas as sublistas e agrupa
  where
    agruparLista [] = []
    agruparLista (a:as) = incrementar a (agruparLista as)

    incrementar c [] = [(c, 1)]
    incrementar c ((char, cont):resto)
        | c == char = (char, cont + 1) : resto
        | otherwise = (char, cont) : incrementar c resto

twice :: (t -> t) -> (t->t)
twice f = f . f

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f) . f

--notação lambda
-- \m -> 3+m

--tipos algébricos

data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a

data Shape = Circle Float | Rectangle Float Float | Triangle Float Float

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False
isRound (Triangle _ _ ) = False

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Rectangle a b) = a * b 
area (Triangle h b) =  (h * b)/2

data Expr = Lit Int | Add Expr Expr | Sub Expr Expr

eval :: Expr -> Int
eval (Lit n) = n
eval (Add el1 el2) = (eval el1) + (eval el2)
eval (Sub el1 el2) = (eval el1) - (eval el2)

showExpr :: Expr -> String
showExpr (Lit n) = show n
showExpr (Add el1 el2) = "( " ++ (showExpr el1) ++ " + " ++ (showExpr el2) ++ " )"
showExpr (Sub el1 el2) = "( " ++ (showExpr el1) ++ " - " ++ (showExpr el2) ++ " )"

data List t = Nil | Cons t (List t)

toList :: List t -> [t]
toList Nil = []
toList (Cons a (as)) = a : toList as
 
fromList :: [t] -> List t
fromList [] = Nil
fromList (a:as) = Cons a (fromList as)

instance Show t => Show (List t) where
    show Nil = ""
    show (Cons x xs) = "[" ++ showHelper (Cons x xs) ++ "]"
     where 
     showHelper Nil = ""
     showHelper (Cons y Nil) = show y 
     showHelper (Cons y ys) = show y ++ ", " ++ showHelper ys

data Tree t = Nilt | Node t (Tree t) (Tree t) deriving (Eq, Show)

depth :: Tree t -> Int
depth Nilt = 0
depth (Node t a b) = 1 + max(depth a)(depth b)

collapse :: Tree t -> [t]
collapse Nilt = []
collapse (Node t a b) = [t] ++ collapse a ++ collapse b

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f Nilt = Nilt
mapTree f (Node t a b) = (Node (f t) (mapTree f a) (mapTree f b))


kauanny :: String
kauanny = "EU TE AMO"

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar lista = quicksort lista
     where quicksort [] = []
           quicksort (x:xs) = quicksort[y| y<-xs, somarDigitos y <= somarDigitos x ] ++ [x] ++ quicksort[y| y<-xs, somarDigitos y > somarDigitos x]
