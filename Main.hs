module Main where
  
import Data.Char (toUpper)
  
main :: IO ()
main = getMonadPut
  
getDoPut :: IO ()
getDoPut = do
            putStrLn "input something"
            line <- getLine
            let output = toUpperCase line
            putStrLn output
            
getMonadPut :: IO ()
getMonadPut = putStrLn "input something" >> getLine >>= putStrLn . toUpperCase

toUpperCase :: String -> String
toUpperCase = map toUpper