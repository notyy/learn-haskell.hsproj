module MyFunction where
  
type Connection = String
type UrlStr = String
type User = String
type Email = String

getConn :: UrlStr -> Maybe Connection
getConn "damotou" = Just "good connection"
getConn _ = Nothing

getUser :: Connection -> User
getUser "good connection" = "good user"

getEmail :: User -> Email
getEmail "good user" = "good email" 

fetchEmail :: UrlStr -> Maybe Email
fetchEmail urlStr = case getConn urlStr of
                      Just conn -> Just ((getEmail . getUser) conn)
                      Nothing -> Nothing

fetchEmail' :: UrlStr -> Maybe Email
fetchEmail' urlStr = fmap (getEmail . getUser) (getConn urlStr)

fetchEmail'' :: UrlStr -> Maybe Email
fetchEmail'' = fmap (getEmail . getUser) . getConn