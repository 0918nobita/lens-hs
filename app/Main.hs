{-# LANGUAGE TemplateHaskell #-}

module Main where

import           Control.Lens  (makeLenses, (.~), (^.))
import           Data.Function ((&))

data Hoge = Hoge {
    _a :: Int,
    _b :: String
} deriving Show

makeLenses ''Hoge

main :: IO ()
main = do
    let hoge = Hoge { _a = 1, _b = "hoge" }

    print $ hoge ^. a -- => 1

    -- `print $ (b .~ "fuga") hoge` と等価
    print $ hoge & b .~ "fuga" -- => Hoge {_a = 1, _b = "fuga"}
