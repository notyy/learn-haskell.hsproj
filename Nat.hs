module Nat where

data Nat = Zero | Succ Nat deriving (Show,Eq)

nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + (nat2Int n)

int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ $ int2Nat (n - 1)

roman :: Int -> String
roman 1 = "|"
roman 4 = "IV"
roman 5 = "V"
roman 10 = "X"