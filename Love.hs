module Love where

type Age = Int
type Weight = Float
type Height = Float
type Saving = Float
type CarNum = Int
type Estate = Int
type BMI = Float

data Lover = Lover Age Weight Height Saving CarNum Estate
  
type Score = Int

calc :: Lover -> Score
calc (Lover age weight height saving carNum estate) = (ageScore age) + (bmiScore $ bmi weight height) + (savingScore saving) + (carNumScore carNum) + (estateScore estate)

ageScore :: Age -> Score
ageScore 26 = 10
ageScore 27 = 20
ageScore 28 = 20
ageScore 29 = 10
ageScore _ = 0

bmi :: Weight -> Height -> BMI
bmi w h = w / h ^ 2

bmiScore :: BMI -> Score
bmiScore bmi 
    | bmi <= 18.5 = 18
    | bmi <= 25.0 = 20
    | bmi <= 30.0 = 5
    | otherwise = 1


savingScore :: Saving -> Score
savingScore s
    | s <= 0 = 0
    | s <= 100000 = 5
    | s <= 500000 = 10
    | s <= 1000000 = 15
    | otherwise = 20

carNumScore :: CarNum -> Score
carNumScore 0 = 1
carNumScore 1 = 10
carNumScore 2 = 15
carNumScore _ = 20

estateScore :: Estate -> Score
estateScore 0 = 1
estateScore 1 = 10
estateScore 2 = 15
estateScore _ = 10




