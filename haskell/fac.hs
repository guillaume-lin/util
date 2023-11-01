-- fac.hs
module Main(
fac,main)
where

import System.Environment
fac :: Int -> Int
fac a =  if a==0 then 1 else  (a * (fac (a - 1)))


double x y =
 if x==2
     then 1
     else 2
action::IO String
action = do
 return "abc"

main = do
  args <- getArgs
  print(  double 3 4)
  print args



