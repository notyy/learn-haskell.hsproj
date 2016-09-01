{-# LANGUAGE MultiParamTypeClasses #-} 
{-# LANGUAGE FlexibleInstances #-}

module MTPC where
  
import Prelude hiding (head, tail, snd) 

class Cons a b where 
  cons :: b -> a b -> a b 
  head :: a b -> b 
  tail :: a b -> (a b) 
  isEmpty :: a b -> Bool 

instance Cons [] b where 
  cons = (:) 
--  head [] = Nothing 
  head (x:_) = x 
--  tail [] = Nothing 
  tail (_:xs) = xs 
  isEmpty = null 
  
snd :: Cons a b => a b -> b
snd = head . tail