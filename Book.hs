module Book where

type Name = String
type Author = String
type ISBN = String
type Price = Float

data Book = Book {
  name :: Name,
  author :: Author,
  isbn :: ISBN,
  price :: Price
} deriving (Show)