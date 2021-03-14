{-
    Trabalho 1 de Programação Funcinal
-}

{-
    Questão 1
-}

triangulo :: (Float, Float, Float) -> String
triangulo (a, b, c)
    | ((a + b + c) /= 180) || a <= 0 || b <= 0 || c <= 0 = "Nao e triangulo"
    | (a == b) && (b == c) = "Equilatero"
    | (a == 90) || (b == 90) || (c == 90) = "Retangulo"
    | (a > 90) || (b > 90) || (c > 90) = "Obtuso"
    | otherwise = "Simples"

{-
    Questão 2
-}

equacao :: Float -> Float -> Float -> (Float, Float)
equacao a b c
    | a /= 0 = ((-b + sqrt(b^2 - 4 * a * c))/(2 * a), (-b - sqrt(b^2 - 4 * a * c))/(2 * a))
    | otherwise = ((-c)/b , a)

{-
    Questão 3
-}

type Data = (Int,Int,Int)

valor :: Float -> Data -> Data -> Float
valor x (d,m,a) (dn,mn,an)
     | (a - an) < 2 || ((a - an) == 2 && (m - mn) < 0) || ((a - an) == 2 && (m - mn) == 0 && (d - dn) < 0) = (15*x)/100
     | (a - an) < 11 || ((a - an) == 11 && (m - mn) < 0) || ((a - an) == 11 && (m - mn) == 0 && (d - dn) < 0) = (45*x)/100
     | (a - an) > 70 || ((a - an) == 70 && (m - mn) > 0) || ((a - an) == 70 && (m - mn) == 0 && (d - dn) >= 0) = (50*x)/100
     | otherwise = x

{-
    Questão 4
-}

{- Letra A -}

gera1 :: [Int]
gera1 = [ x^2 | x <- [1..15], odd x, x > 4, x < 14 ]

{- Letra B -}

gera2 :: [(Int,Int)]
gera2 = [ (x,y) | x <- [1..15], x >= 1, x <= 4, y <- [x..(2*x)] ] 

{- Letra C -}

l1 :: [Int]
l1 = [10..15]

gera3 :: [Int]
gera3 = [ x | y <- l1, x <- [1..15], x <= y ]

{- Letra D -}

gera4 :: [(Int,Int)]
gera4 = [ (x,x+1) | x <- [1..15], odd x ]

{- Letra E -}

gera5 :: [Int]
gera5 = [ fst(n) + y | n <- gera4, y <- [1..15], y == fst(n) + 1 ]

{-
    Questão 5
-}

{- Letra A -}

contaNegM2 :: [Int] -> Int
contaNegM2 l = length [ x | x <- l, x < 0, mod x 2 == 0]

{- Letra B -}

listaNegM2 :: [Int] -> [Int]
listaNegM2 l = [ x | x <- l, x < 0, mod x 2 == 0]

{-
    Questão 6
-}

distancias :: [(Float,Float)] -> [Float]
distancias l = [ (sqrt(x^2 + y^2)) | (x,y) <- l ]

{-
    Questão 7
-}

fatores :: Int -> [Int]
fatores n = [k | k <- [1..n], mod n k == 0]

primos :: Int -> Int -> [Int]
primos x y = [ g | g <- [x..y], length (fatores g) == 2]

{-
    Questão 8
-}

mdc :: (Int,Int) -> Int
mdc (m,n)
     | n == 0 = m
     | otherwise = mdc (n, mod m n)

mmc2 :: Int -> Int -> Int
mmc2 a b = div (a*b) (mdc(a,b))

mmc :: Int -> Int -> Int -> Int
mmc a b c = mmc2 (mmc2 a b) c

{-
    Questão 9
-}

calcula_serie :: Float -> Int -> Float
calcula_serie x 0 = 0
calcula_serie x n = if even n then (x/fromIntegral n) + calcula_serie x (n - 1) else (fromIntegral n/x) + calcula_serie x (n - 1)

{-
    Questão 10
-}

fizzbuzz :: Int -> [String]
fizzbuzz 0 = []
fizzbuzz n
     | mod n 3 == 0 && mod n 5 == 0 = fizzbuzz (n-1) ++ ["FizzBuzz"]
     | mod n 3 == 0 = fizzbuzz (n-1) ++ ["Fizz"]
     | mod n 5 == 0 = fizzbuzz (n-1) ++ ["Buzz"]
     | otherwise = fizzbuzz (n-1) ++ ["No"]

{-
    Questão 11
-}

incremento :: Int -> (Int,Int) -> (Int,Int)
incremento 1 (a,b) = (a+1,b)
incremento 2 (a,b) = (a,b+1)

conta_ocorrencias :: Eq t => t -> t -> [t] -> (Int,Int)
conta_ocorrencias _ _ [] = (0,0)
conta_ocorrencias x y (h:t)
     | h == x = incremento 1 (conta_ocorrencias x y t)
     | h == y = incremento 2 (conta_ocorrencias x y t)
     | otherwise = conta_ocorrencias x y t
     
{-
    Questão 12
-}

unica_ocorrencia :: Eq t => t -> [t] -> Bool
unica_ocorrencia u l = if length [k | k <- l, k == u] == 1 then True else False

{-
    Questão 13
-}

intercala :: [t] -> [t] -> [t]
intercala l [] = l
intercala [] l = l
intercala (x:xs) (y:ys) = x:y:intercala xs ys

{-
    Questão 14
-}

type Contato = (String,String,String,String)

type Agenda = [Contato]

agenda :: Agenda
agenda = [("Ana","R.Fulano","5555-2222","abc@mail.com"),
         ("Clara","R.Ciclano","4444-4444","def@mail.com"),
         ("Joao","R.Beltrano","2222-8888","ghi@mail.com")]

recupera_nome :: String -> Agenda -> String
recupera_nome _ [] = "Email desconhecido"
recupera_nome email ((n,en,t,em):s) = if em == email then n
                                                     else recupera_nome email s

{-
    Questão 15
-}

type Pessoa = (String, Float, Int, Char)

pessoas :: [Pessoa]
pessoas = [ ("Rosa", 1.66, 27, 'C'),
          ("João", 1.85, 26, 'C'),
          ("Maria", 1.55, 62, 'S'),
          ("Jose", 1.78, 42, 'C'),
          ("Paulo", 1.93, 25, 'S'),
          ("Clara", 1.70, 33, 'C'),
          ("Bob", 1.45, 21, 'C'),
          ("Rosana", 1.58, 39, 'S'),
          ("Daniel", 1.74, 72, 'S'),
          ("Jocileide", 1.69, 18, 'S') ]

alturaM :: [Pessoa] -> Float
alturaM l = sum [ a | (n,a,i,e) <- l] / fromIntegral (length l)

idadeMNova :: [Pessoa] -> Int
idadeMNova [(n,a,i,e)] = i
idadeMNova ((np,ap,ip,ep):(ns,as,is,es):r)
     | ip < is = idadeMNova ((np,ap,ip,ep):r)
     | otherwise = idadeMNova ((ns,as,is,es):r)

maisVelho :: [Pessoa] -> (String, Char)
maisVelho [(n,a,i,e)] = (n,e)
maisVelho ((np,ap,ip,ep):(ns,as,is,es):r)
     | ip > is = maisVelho ((np,ap,ip,ep):r)
     | otherwise = maisVelho ((ns,as,is,es):r)

cinquentaOuMais :: [Pessoa] -> [Pessoa]
cinquentaOuMais l = [ (n,a,i,e) | (n,a,i,e) <- l, i >= 50 ]

casadasMaisI :: Int -> [Pessoa] -> Int
casadasMaisI id l = length [ (n,a,i,e) | (n,a,i,e) <- l, i > id, e == 'C' ]

{-
    Questão 16
-}

insere_ord :: Ord t => t -> [t] -> [t]
insere_ord x [] = [x]
insere_ord x (h:t) = if x <= h then (x:h:t)
                               else (h:insere_ord x t)

{-
    Questão 17
-}

reverte :: [t] -> [t]
reverte [x] = [x]
reverte (h:t) = reverte t ++ [h]

{-
    Questão 18
-}

remove_elem :: Eq t => t -> [t] -> [t]
remove_elem x [] = []
remove_elem x (h:t) = if x == h then remove_elem x t else h : remove_elem x t

sem_repetidos :: Eq t => [t] -> [t]
sem_repetidos [] = []
sem_repetidos (h:t) = h : sem_repetidos (remove_elem h t)

{-
    Questão 19
-}

disponiveis :: [Int]
disponiveis = [1,2,5,10,20,50,100]

notasTroco :: Int -> [[Int]]
notasTroco 0 = [[]]
notasTroco x = [ h:t | h <- disponiveis, x >= h, t <- notasTroco (x-h) ]

{-
    Questão 20
-}

tira_elem :: Int -> [Int] -> [Int]
tira_elem x [] = []
tira_elem x (h:t) = if h == x then t
                              else (h:tira_elem x t)

verificaD :: Int -> [Int] -> Bool
verificaD _ [_] = True
verificaD x (h:s:t) = if abs (s-h) == x then False
                                        else verificaD (x+1) (h:t)

resolve :: Int -> [Int] -> [[Int]]
resolve 0 _ = [[]]
resolve k l = [ h:t | h <- l, t <- resolve (k-1) (tira_elem h l), verificaD 1 (h:t) ]

nRainhas :: Int -> [[Int]]
nRainhas n = resolve n [1..n]
