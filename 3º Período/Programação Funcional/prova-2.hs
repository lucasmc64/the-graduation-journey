l1 :: [Int]
l1 = [1..1000]

l2 :: [Int]
l2 = [1000,999..1]

l3 :: [Int]
l3 = l1 ++ [0]

l4 :: [Int]
l4 = [0] ++ l2

l5 :: [Int]
l5 = l1 ++ [0] ++ l2

l6 :: [Int]
l6 = l2 ++ [0] ++ l1

l7 :: [Int]
l7 = l2 ++ [0] ++ l2

{-
    Questão 1
-}

junta :: a -> ([a],b) -> ([a],b)
junta x (y,c) = (x:y,c)

removeUlt :: [a] -> ([a],a)
removeUlt [x] = ([],x)
removeUlt (x:y) = junta x (removeUlt y)

troca :: (Ord a) => ([a],Int) -> ([a],Int)
troca ([x],c) = ([x],c)
troca (x:y:z,c)
     | x < y = junta y (troca (x:z,c+1)) 
     | otherwise = junta x (troca (y:z,c))

bolhaOrd :: (Ord a) => [a] -> [a]
bolhaOrd lista = if x == 0 then lista
                            else (bolhaOrd ls) ++ [u]
           where
              (l,x) = troca (lista,0)
              (ls,u) = removeUlt l

bolha :: (Ord a) => [a] -> [a]
bolha [] = []
bolha lista = bolhaOrd lista

{-
    Questão 2
-}

-- Letra A

somat :: Int -> Int
somat n = foldr1 (+) (map (^ 2) [0..n])

-- Letra B

pares :: [(Int, Int)] -> [Int]
pares l = map (\(x, y) -> x * y) l

-- Letra C

triplas :: [(Int, Int, Int)] -> [Int]
triplas l = map (\(x, y, z) -> x + y + z) (filter (\(x, y, z) -> x > y && y > z) l)

-- Letra D

pares2 :: [(Int, Int)] -> [Int]
pares2 l = filter (\x -> mod x 2 /= 0) (map (\(x, y) -> x * y) l)

-- Letra E

totaliza :: [(Int, Int, Int)] -> Int
totaliza l = foldr1 (*) (map (\(x, y, z) -> x + y + z) (filter (\(x, y, z) -> y > x && mod z 2 /= 0) l))

{-
    Questão 3
-}

data ArvoreBinInt = Nulo  | No Int ArvoreBinInt ArvoreBinInt 
    deriving (Show,Eq)

arvEx::ArvoreBinInt
arvEx = (No 2 (No 7 (No 12 Nulo Nulo) (No 6 (No 5 Nulo Nulo) (No 11 Nulo Nulo) ) )
              (No 15 Nulo (No 9 (No 4 Nulo Nulo) Nulo) ) )

buscaPreAux :: Int -> (ArvoreBinInt, Int) -> (Bool, Int)
buscaPreAux k (Nulo, c) = (False, c)
buscaPreAux k (No n folhaesq folhadir, c) = if k == n then (True, c + 1) else (if resp then (resp, cont) else buscaPreAux k (folhadir, cont))
    where
        (resp, cont) = buscaPreAux k (folhaesq, c + 1)

buscaPre :: Int -> ArvoreBinInt -> (Bool, Int)
buscaPre k Nulo = (False, 0)
buscaPre k (No n folhaesq folhadir) = buscaPreAux k (No n folhaesq folhadir, 0)

{-
    Questão 4
-}

type Nome = String
type Endereco = String
type Codigo = Int
type QtMeses = Int

data MtPagamento = Deposito | Cartao | Boleto
    deriving (Show, Eq, Ord)

data VlCompras = Baixo | Medio | Alto
    deriving (Show, Eq, Ord)

data Cliente = BestCompra Nome Endereco Codigo QtMeses MtPagamento VlCompras
    deriving (Show, Eq, Ord)

c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18 :: Cliente

c1 = BestCompra "Lucas Souza" "Rua das pontes, 115, Uberlandia" 512448 5 Deposito Medio
c2 = BestCompra "Elza Peixoto" "Rua das flores, 62, Brasilia" 889632 4 Deposito Baixo
c3 = BestCompra "Shakira Rozane" "Rua das palmeira, 455, Paracatu" 896325 9 Cartao Alto
c4 = BestCompra "Gonzales Carmim" "Rua das pedras, 4563, Uberlandia" 753214 3 Boleto Medio
c5 = BestCompra "Jacides Pereira" "Rua das arvores, 896, Lisboa" 984123 7 Deposito Alto
c6 = BestCompra "Ataíde Oliveira" "Rua dos espinhos, 915, Salvador" 563492 8 Boleto Baixo
c7 = BestCompra "Lucas Morais" "Rua marechal deodoro, 563, Paranai" 865324 5 Deposito Alto
c8 = BestCompra "Lucas Maori" "Rua das pitombas, 1534, Sobrau" 469531 6 Deposito Medio
c9 = BestCompra "Lucas Augusto" "Rua dos amantes, 7785, Diamantina" 489512 7 Deposito Alto
c10 = BestCompra "Lucas Amado" "Rua das piabas, 456, Ouro Preto" 789653 8 Deposito Baixo
c11 = BestCompra "Lucas Perodo" "Rua da esperança, 444, Pirapora" 951482 9 Deposito Baixo
c12 = BestCompra "Lucas Carlin" "Rua do amor, 52, Arandai" 465821 10 Deposito Medio
c13 = BestCompra "Lucas Mingro" "Rua das carambolas, 495, Vancouver" 111472 11 Deposito Alto
c14 = BestCompra "Lucas Cardoso" "Rua das amoebas, 53, Berlim" 222358 12 Deposito Medio
c15 = BestCompra "Lucas Lumiti" "Rua dos lapis, 996, Tokio" 996354 1 Deposito Alto
c16 = BestCompra "Lucas Vilpi" "Rua das canetas, 458, Moscou" 444752 2 Deposito Medio
c17 = BestCompra "Lucas Maste" "Rua das bolas de praia, 474, Unai" 145255 3 Deposito Baixo
c18 = BestCompra "Lucas Castro" "Rua da reprovação, 456, Babaru" 336581 4 Deposito Baixo

lcBC :: [Cliente]
lcBC = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18]

insereOrd :: Cliente -> [Cliente] -> [Cliente]
insereOrd x [] = [x]
insereOrd (BestCompra n1 e1 c1 qm1 mp1 vc1) ((BestCompra n2 e2 c2 qm2 mp2 vc2) : r)
    | n1 <= n2 = (BestCompra n1 e1 c1 qm1 mp1 vc1) : (BestCompra n2 e2 c2 qm2 mp2 vc2) : r
    | otherwise = (BestCompra n2 e2 c2 qm2 mp2 vc2) : insereOrd (BestCompra n1 e1 c1 qm1 mp1 vc1) r

insercao :: [Cliente] -> [Cliente]
insercao [] = []
insercao (x : r) = foldr (insereOrd) [x] (insercao r)

ordena_clientes_nome :: [Cliente] -> [Cliente]
ordena_clientes_nome l = insercao l
