-- | Pragma needed in order to generate the FromJSON ToJSON automatically
{-# LANGUAGE DeriveGeneric, OverloadedStrings #-}

module Customer where
import Data.Aeson
import Data.Bson
import Data.Bson.Generic
import GHC.Generics
import Data.Text


data Customer = Customer
  { name :: Text
  , email :: Text
  , phone :: Text
  } deriving (Eq, Show, Generic)

instance FromJSON Customer
instance ToJSON Customer
instance FromBSON Customer
instance ToBSON Customer
