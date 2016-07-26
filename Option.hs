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
  

type Connection = String
type UrlStr = String
type User = String
type Email = String



withDefault :: b -> (a -> b) -> Option a -> b
withDefault dv _ None = dv
withDefault _ f (Some v) = f v
