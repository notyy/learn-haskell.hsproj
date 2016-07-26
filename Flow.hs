{-# LANGUAGE GADTs #-}
{-# LANGUAGE ExistentialQuantification #-}


module Flow where
  

add1 :: Int -> Int
add1 = (+1)

multi2 :: Int -> Int
multi2 = (*2)

int2Str :: Int -> String
int2Str = show

myLength :: String -> Int
myLength = length


data Flow a b = LastStep (a -> b) | forall c. Combine (a -> b) (Flow b c)

fmap :: (b -> c) -> (a -> b) -> (a -> c)
fmap f g = \x -> f(g x)
