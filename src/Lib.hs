{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc,
      multiplyByFive
    ) where

import qualified Data.Text.IO as T

multiplyByFive :: Integer -> Integer
multiplyByFive x = x * 5

someFunc :: IO ()
someFunc = T.putStrLn "someFunc"
