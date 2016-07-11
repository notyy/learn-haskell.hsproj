module TypeClass where
  
class MyFunctor f where
  fmap :: (a -> b) -> f a -> f b