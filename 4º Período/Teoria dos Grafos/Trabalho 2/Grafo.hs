module Grafo 
    (
        eTrivial
    ) where

import GrafoListAdj

eTrivial :: Grafo -> Bool 
eTrivial g
    | length (vértices g) == 1 = True 
    | otherwise = False