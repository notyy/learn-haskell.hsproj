module TrySample where
  
data Try e a = Success a | Failure e
                  deriving (Show)

instance Functor (Try e) where
  fmap f (Success x) = Success (f x)
  fmap _ (Failure x) = Failure x

instance Applicative (Try e) where
  pure x = Success x

  (Success f) <*> (Success x) = Success (f x)
  (Failure f) <*> _ = Failure f
  (Success f) <*> (Failure x) = Failure x
  

instance Monad (Try e) where
  return x = Success x
  
  Success x >>= f = f x
  Failure x >>= _ = Failure x
  

type Connection = String
type UrlStr = String
type User = String
type Email = String

getConn :: UrlStr -> Try String Connection
getConn "damotou" = Success "good connection"
getConn _ = Failure "failed to get database connection"

getUser :: Connection -> Try String User
getUser "good connection" = Success "good user"
getUser _ = Failure "failed to getUser"

getEmail :: User -> Try String Email
getEmail "good user" = Success "good email" 
getEmail _ = Failure "failed to get email"

fetchEmail :: UrlStr -> Try String Email
fetchEmail urlStr = do
                          conn <- getConn urlStr
                          user <- getUser conn
                          email <- getEmail user
                          return email