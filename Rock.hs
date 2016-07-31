module Rock where
  
data Move = Rock | Paper | Scissors
                 deriving (Show, Eq)
                 
type Tournament = ([Move],[Move])

type Strategy = [Move] -> Move

rock, paper, scissors :: Strategy
rock _ = Rock
paper _ = Paper
scissors _ = Scissors