module MyMonad where
  
type Connection = String
type UrlStr = String
type User = String
type Email = String

  
getConn :: UrlStr -> Maybe Connection
getConn "damotou" = Just "good connection"
getConn _ = Nothing

getUser :: Connection -> Maybe User
getUser "good connection" = Just "good user"
getUser _ = Nothing

getEmail :: User -> Maybe Email
getEmail "good user" = Just "good email" 
getEmail _ = Nothing

fetchEmail :: UrlStr -> Maybe Email
fetchEmail urlStr = case getConn urlStr of
                      Nothing -> Nothing
                      Just conn -> case getUser conn of
                                  Nothing -> Nothing
                                  Just user -> getEmail user

bind :: (a -> Maybe b) -> Maybe a -> Maybe b
bind f Nothing = Nothing
bind f (Just v) = f v
                                        

fetchEmail' :: UrlStr -> Maybe Email
fetchEmail' urlStr = bind getEmail (bind getUser (getConn urlStr))

fetchEmail'' :: UrlStr -> Maybe Email
fetchEmail'' urlStr = (getConn urlStr) >>= getUser >>= getEmail

fetchEmail''' :: UrlStr -> Maybe Email
fetchEmail''' urlStr = do
                          conn <- getConn urlStr
                          user <- getUser conn
                          email <- getEmail user
                          return email