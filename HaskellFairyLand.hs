module HaskellFairyLand where
  
import Data.Char

x :: Int
x = 0

--add :: (Int,Int) -> Int
--add (x,y) = x + y

add' :: Int -> (Int -> Int)
add' x y = x + y

add'' :: Int -> (Int -> Int)
add'' = \x y -> x + y



add''' :: Int -> (Int -> Int)
add''' x = \y -> x + y

normalAdd :: Int -> Int -> Int
normalAdd x y = x + y

add :: Num a => a -> a -> a
add x y = x + y

data MyOption a = Just a | Nothing

add1 :: Int -> Int
add1 = (+1)

multi2 :: Int -> Int
multi2 = (*2)

int2Str :: Int -> String
int2Str = show

myLength :: String -> Int
myLength = length

myfst :: (a, b) -> a
myfst (x,y) = x
