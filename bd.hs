type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio", "O Senhor dos Aneis"), ("Andre","Duna"), ("Fernando","Jonathans")]

--livros emprestados
livros :: BancoDados -> Pessoa -> [Livro]
livros bd p =[ll | (pp,ll) <- bd, pp == p]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = (emprestimos bd l) /= []

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length(livros bd p)

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar [] pessoa livro = [(pessoa,livro)]
emprestar ((p,l):as) pessoa livro | p == pessoa && l == livro = ((p,l):as)
                                   | otherwise = (p,l):emprestar as pessoa livro

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd l = [pp| (pp,ll) <- bd, ll == l]