{-
    Exercício 1
-}

duplica::Float->Float
duplica x = x * 2

quadruplica::Float->Float
quadruplica x = duplica (duplica x)

calc_hipotenusa::Float->Float->Float
calc_hipotenusa cat1 cat2 = sqrt(cat1 ^ 2 + cat2 ^ 2)

distancia_entre::Float->Float->Float->Float->Float
distancia_entre x1 y1 x2 y2 = sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)