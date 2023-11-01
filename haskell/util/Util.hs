module Util.Util
 where
find::Int->Int->Int
find x y = x + y

data Color = C { read
  , green
  , blue :: Int}

isGreenZero (C {green = 0 }) = True
isGreenZero _ = False

data Pixel = P Color

setGreen (P col@(C {green = 0})) = P col
setGreen _ = P (C 0 0 0)


data Term = Con Int
  | Add Term Term
    deriving (Show)
eval :: Term -> Int
eval (Con a ) = a
eval (Add a b) = eval a + eval b

-- eval (Add (Con 2) (Con 3))


Tree a = Tip | Node a  (Tree a) (Tree a)
