{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 6
-}

import Data.Array

mapMat :: (a -> b) -> Array (Int, Int) a -> Array (Int, Int) b
mapMat f m = array (formato) [(i, f (m ! i)) | i <- (range formato)]
    where
        formato = bounds m