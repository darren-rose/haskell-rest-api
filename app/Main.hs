{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Monoid (mconcat)
import Network.Wai.Middleware.RequestLogger

import Lib

main = scotty 3000 $ do
  middleware logStdoutDev
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
