module Collection where
  
head' :: [a] -> a
head' [] = error "empty List"
head' (x:xs) = x

head'' :: [a] -> Maybe a
head'' [] = Nothing
head'' (x:xs) = Just x


filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) = if f x then x : (filter' f xs) else filter' f xs








dup :: [a] -> [a]
dup = concat . map (\x -> [x,x])

--reap :: Int -> [a] -> [a]

reverse' :: [a] -> [a]
reverse' xs = foldl (\acc v -> v : acc) [] xs

reduce :: (a -> a -> a) -> [a] -> a
reduce f (x:xs) = foldl f x xs

