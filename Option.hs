module Option where

import TypeClass

data Option a = None
              | Some a
              deriving (Show)
              
myMap :: (a -> b) -> Option a -> Option b
myMap f None = None
myMap f (Some x) = Some (f x)

instance MyFunctor Option where
  fmap = myMap