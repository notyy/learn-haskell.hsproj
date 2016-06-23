module EitherSample where

type Score = Int
type Reason = String

scores :: [Either Reason Score]
scores = [Right 80, Left "error"]
