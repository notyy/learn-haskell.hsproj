module ADT where
  
import TypeClass
  
data Credential = Mobile String
                | Email String
                | UserName String
                
data EmailAddress = At String String

validate :: Credential -> Bool
validate (Mobile num) = (length num) == 11
validate (Email address) = elem '@' address -- 判断address里是否有'@'
validate (UserName name) = 
  let 
    nameLength = length name
  in
    nameLength > 5 && nameLength <= 10
                            

first :: (a,b) -> a
first (i, _) = i

second :: (a, b) -> b
second (_, s) = s

data MyTree a = Leaf a 
            | Node a (MyTree a) (MyTree a) 
            deriving (Show)
            

leftMost :: MyTree a -> a
leftMost (Leaf x) = x
leftMost (Node _ l r) = leftMost l

add :: Int -> Int -> Int
add = undefined

myMap :: (a -> b) -> MyTree a -> MyTree b
myMap f (Leaf x) = Leaf (f x)
myMap f (Node x l r) = Node (f x) (myMap f l) (myMap f r)

instance MyFunctor MyTree where
  fmap = myMap
