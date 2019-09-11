module Main where

import Web.Scotty
import Restful

main = do
  putStrLn "Starting Server..."

  scotty 3000 routes
