-- | Pragma needed in order to generate the FromJSON ToJSON automatically
{-# LANGUAGE DeriveGeneric, OverloadedStrings #-}
module User where
import GHC.Generics
import Data.Text
import Data.Aeson
import Data.Bson.Generic    


-- | Datatype for user
data User = User
  { username :: Text
  , password :: Text
  } deriving (Generic)


-- | generic FromJson/
instance FromJSON User
instance ToJSON User
instance FromBSON User
instance ToBSON User