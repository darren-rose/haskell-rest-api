{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Restful
    ( routes,
    ) where

import Web.Scotty
import Network.Wai.Middleware.RequestLogger
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Customer = Customer { name :: String, email :: String, phone :: String } deriving (Show, Generic)

instance ToJSON Customer
instance FromJSON Customer

kirk :: Customer
kirk = Customer { name = "kirk", email = "kirk@enterprise.com", phone = "123" }

spock :: Customer
spock = Customer { name = "spock", email = "spock@vulcan.com", phone = "456" }

allCustomers :: [Customer]
allCustomers = [kirk, spock]

routes :: ScottyM ()

routes = do
  middleware logStdoutDev

  get "/" $ json allCustomers

  get "/kirk" $ json kirk

  post "/spock" $ json spock
