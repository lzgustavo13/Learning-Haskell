-- ** Funções de manipulação de listas **

-- head: Retorna o primeiro elemento de uma lista.
head [1, 2, 3] -- Saída: 1

-- tail: Retorna todos os elementos de uma lista, exceto o primeiro.
tail [1, 2, 3] -- Saída: [2, 3]

-- last: Retorna o último elemento de uma lista.
last [1, 2, 3] -- Saída: 3

-- init: Retorna todos os elementos de uma lista, exceto o último.
init [1, 2, 3] -- Saída: [1, 2]

-- null: Verifica se a lista está vazia.
null [] -- Saída: True
null [1] -- Saída: False

-- length: Retorna o comprimento de uma lista.
length [1, 2, 3] -- Saída: 3

-- reverse: Inverte os elementos de uma lista.
reverse [1, 2, 3] -- Saída: [3, 2, 1]

-- take: Pega os primeiros `n` elementos de uma lista.
take 2 [1, 2, 3] -- Saída: [1, 2]

-- drop: Remove os primeiros `n` elementos de uma lista.
drop 2 [1, 2, 3] -- Saída: [3]

-- (!!): Acessa o elemento de uma lista pelo índice (começa em 0).
[1, 2, 3] !! 1 -- Saída: 2

-- elem: Verifica se um elemento está em uma lista.
elem 2 [1, 2, 3] -- Saída: True
elem 4 [1, 2, 3] -- Saída: False

-- notElem: Verifica se um elemento NÃO está em uma lista.
notElem 4 [1, 2, 3] -- Saída: True

-- concat: Junta uma lista de listas em uma única lista.
concat [[1, 2], [3, 4]] -- Saída: [1, 2, 3, 4]

-- (++) : Concatena duas listas.
[1, 2] ++ [3, 4] -- Saída: [1, 2, 3, 4]

-- replicate: Cria uma lista com `n` repetições de um elemento.
replicate 3 "Haskell" -- Saída: ["Haskell", "Haskell", "Haskell"]

-- cycle: Repete infinitamente os elementos de uma lista.
take 10 (cycle [1, 2]) -- Saída: [1, 2, 1, 2, 1, 2, 1, 2, 1, 2]

-- repeat: Gera uma lista infinita com repetições de um elemento.
take 5 (repeat 42) -- Saída: [42, 42, 42, 42, 42]

-- splitAt: Divide uma lista em duas, com a primeira parte tendo `n` elementos.
splitAt 2 [1, 2, 3, 4] -- Saída: ([1, 2], [3, 4])

-- span: Divide uma lista no ponto em que o predicado falha.
span (< 3) [1, 2, 3, 4] -- Saída: ([1, 2], [3, 4])

-- break: Divide a lista no ponto em que o predicado é satisfeito.
break (== 3) [1, 2, 3, 4] -- Saída: ([1, 2], [3, 4])

-- zip: Junta duas listas em uma lista de pares.
zip [1, 2, 3] ['a', 'b', 'c'] -- Saída: [(1, 'a'), (2, 'b'), (3, 'c')]

-- unzip: Separa uma lista de pares em duas listas.
unzip [(1, 'a'), (2, 'b')] -- Saída: ([1, 2], "ab")

-- ** Funções de alta ordem **

-- map: Aplica uma função a cada elemento da lista.
map (* 2) [1, 2, 3] -- Saída: [2, 4, 6]

-- filter: Filtra os elementos que satisfazem um predicado.
filter odd [1, 2, 3, 4] -- Saída: [1, 3]

-- foldl: Reduz a lista da esquerda para a direita.
foldl (+) 0 [1, 2, 3] -- Saída: 6

-- foldr: Reduz a lista da direita para a esquerda.
foldr (+) 0 [1, 2, 3] -- Saída: 6

-- scanl: Como foldl, mas retorna todos os acumuladores intermediários.
scanl (+) 0 [1, 2, 3] -- Saída: [0, 1, 3, 6]

-- scanr: Como foldr, mas retorna todos os acumuladores intermediários.
scanr (+) 0 [1, 2, 3] -- Saída: [6, 5, 3, 0]

-- ** Funções para strings (listas de caracteres) **

-- lines: Divide uma string em linhas.
lines "Oi\nTudo bem?" -- Saída: ["Oi", "Tudo bem?"]

-- words: Divide uma string em palavras.
words "Olá Haskell!" -- Saída: ["Olá", "Haskell!"]

-- unlines: Junta linhas em uma única string.
unlines ["Oi", "Tudo bem?"] -- Saída: "Oi\nTudo bem?\n"

-- unwords: Junta palavras em uma única string.
unwords ["Olá", "Haskell!"] -- Saída: "Olá Haskell!"


-- ** Compreensão de listas (útil para construir listas complexas) **

-- Exemplos:
[x * 2 | x <- [1, 2, 3], x > 1] -- Saída: [4, 6]
[(x, y) | x <- [1, 2], y <- ['a', 'b']] -- Saída: [(1,'a'), (1,'b'), (2,'a'), (2,'b')]

-- ** Outras funções úteis **

-- any: Verifica se algum elemento satisfaz um predicado.
any odd [1, 2, 3] -- Saída: True

-- all: Verifica se todos os elementos satisfazem um predicado.
all even [2, 4, 6] -- Saída: True

-- maximum: Retorna o maior elemento de uma lista.
maximum [1, 2, 3] -- Saída: 3

-- minimum: Retorna o menor elemento de uma lista.
minimum [1, 2, 3] -- Saída: 1

-- sum: Soma os elementos de uma lista.
sum [1, 2, 3] -- Saída: 6

-- product: Calcula o produto dos elementos de uma lista.
product [1, 2, 3] -- Saída: 6
